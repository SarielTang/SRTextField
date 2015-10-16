//
//  SRTextFieldChecker.m
//  Parking
//
//  Created by SR on 15/4/9.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "SRTextChecker.h"
#import "SRTextField.h"

@implementation SRTextChecker

/**
 *  正则验证
 *
 *  @param text      需验证文本
 *  @param regString 正则表达式
 *
 *  @return 是否匹配
 */
+ (BOOL)customRegularCheckWithText:(NSString *)text andRegString:(NSString *)regString
{
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regString options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSTextCheckingResult *result = [expression firstMatchInString:text options:0 range:NSMakeRange(0, text.length)];
    
    return !NSEqualRanges(result.range, NSMakeRange(0, 0));
    
}


/**
 *  检查某个东西的文本是否符合
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block
 *
 *  @return 检查结果枚举
 */
+ (SRTextCheckingResultType)checkSomeoneTextIsCorrect:(id<SRTextCheckProtocol>)someone completionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
        
    //判断是否为空
    if (![someone allowEmpty] && [self check_SomeoneTextIsEmpty:someone completionBlock:completionBlock])
    {
        return SRTextCheckingResultTypeEmpty;
    }
    
    //判断格式是否正确
    if (![self check_SomeoneTextIsCorrect:someone completionBlock:completionBlock]) {
        return SRTextCheckingResultTypeFormatError;
    }
    
    //展示结果
    SRTextCheckerResultInfo *info = [[SRTextCheckerResultInfo alloc] init];
    info.resultType = SRTextCheckingResultTypeCorrect;
    info.someone = someone;
    
    if (!completionBlock) {
        [self showResultWithResultInfo:info];
    }
    else
    {
        completionBlock(someone);
    }
    
    return SRTextCheckingResultTypeCorrect;
}

/**
 *  检查某个东西的文本是否符合，用于整组检查时
 *  如果completionBlock为nil将使用默认的展示结果的方式。(此方法不会展示结果为正确的结果)
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block回调
 *
 *  @return 结果枚举
 */
+ (SRTextCheckingResultType)checkSomeoneTextIsCorrectInGroup:(id<SRTextCheckProtocol>)someone completionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
    
    //判断是否为空
    if (![someone allowEmpty] && [self check_SomeoneTextIsEmpty:someone completionBlock:completionBlock])
    {
        return SRTextCheckingResultTypeEmpty;
    }
    
    //判断格式是否正确
    if ([self check_SomeoneTextIsCorrect:someone completionBlock:completionBlock]) {
        return SRTextCheckingResultTypeFormatError;
    }
    
    return SRTextCheckingResultTypeCorrect;
}


/**
 *  检查某个东西的文本格式是否正确
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的回调block
 *
 *  @return 结果枚举类型
 */
+ (SRTextCheckingResultType)check_SomeoneTextIsCorrect:(id<SRTextCheckProtocol>)someone completionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
    
    if (![SRTextChecker customRegularCheckWithText:[someone checkedText] andRegString:[someone regString]]) {
        
        SRTextCheckerResultInfo *info = [[SRTextCheckerResultInfo alloc] init];
        info.someone = someone;
        info.resultType = SRTextCheckingResultTypeFormatError;
        
        if (!completionBlock) {
            [self showResultWithResultInfo:info];
        }
        else
        {
            completionBlock(info);
        }
        
        return SRTextCheckingResultTypeFormatError;

    }
    
    return SRTextCheckingResultTypeCorrect;
}

/**
 *  检查某个东西的文本是否为空
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的回调block
 *
 *  @return 返回结果枚举
 */
+ (SRTextCheckingResultType)check_SomeoneTextIsEmpty:(id<SRTextCheckProtocol>)someone completionBlock:(SRTextCheckerCompetionBlock)completionBlock
{

    if ([[someone checkedText] isEqualToString:@""] || ![someone checkedText]) {
    
        SRTextCheckerResultInfo *info = [[SRTextCheckerResultInfo alloc] init];
        info.someone = someone;
        info.resultType = SRTextCheckingResultTypeEmpty;
        
        if (!completionBlock) {
            [self showResultWithResultInfo:info];
        }
        else
        {
            completionBlock(info);
        }
        
        return SRTextCheckingResultTypeEmpty;
        
    }
    
    return SRTextCheckingResultTypeCorrect;
    
}

/**
 *  默认展示结果的方法
 *
 *  @param resultInfo 结果对象
 */
+ (void)showResultWithResultInfo:(SRTextCheckerResultInfo *)resultInfo
{
    [resultInfo showResult];
}

/**
 *  按顺序检查控件数组里的所有控件
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param widgets         控件数组内容为, id<SRSRTextCheckProtocol>
 *  @param completionBlock 完成时调用的block
 *
 *  @return 检查结果对象
 */
+ (SRTextCheckerResultInfo *)checkAllWidgets:(NSArray *)widgets completionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
    
    SRTextCheckerResultInfo *info = [[SRTextCheckerResultInfo alloc] init];
    
    for (id<SRTextCheckProtocol> widget in widgets) {
        
        info.resultType = [widget checkTextIsCorrectInGroupWithCompletionBlock:completionBlock];
        info.someone = widget;
        if (info.resultType) {
            return info;
        }
        
    }
    
    info.resultType = SRTextCheckingResultTypeEeverythingIsOK;
    info.someone = nil;
    
    if (completionBlock) {
        completionBlock(info);
    }
    else
    {
        [self showResultWithResultInfo:info];
    }
    
    return info;
    
}

/**
 *  检查控件数组里需要相等的控件是否相等，数组是比较配置数组.
 *
 *  @param configs         SRTextCompareCofig数组
 *  @param completionBlock 完成时的回调block
 *
 *  @return 结果对象
 */
+ (SRTextCompareResultInfo *)comepareObjectWidgetsByConfigs:(NSArray *)configs completionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
    
    SRTextCompareResultInfo *info = [[SRTextCompareResultInfo alloc] init];
    
    for (SRTextCompareConfig *config in configs) {
        
        info.config = config;
        
        if ([config compare]) {
            
            info.resultType = SRTextCheckingResultTypeUnlike;
            
            if (completionBlock) {
                completionBlock(info);
            }
            else
            {
                [self showResultWithResultInfo:info];
            }
            
            return info;
            
        }
        
    }
    
    info.resultType = SRTextCheckingResultTypeEeverythingIsOK;
    
    if (completionBlock) {
        completionBlock(info);
    }
    else
    {
        [self showResultWithResultInfo:info];
    }

    return info;
}

#pragma mark - SRTextFieldDlegate 
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    SRTextField *t = (SRTextField *)textField;
    switch (t.inputType) {
        case SRTextFieldInputTypeNumber:
        {
            NSString * regexStr = @"^[0-9]+$";
            NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
            if ([regextestmobile evaluateWithObject:string])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
            break;
        case SRTextFieldInputTypeLetter:
        {
            NSString * regexStr = @"^[A-Za-z]+$";
            NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
            if ([regextestmobile evaluateWithObject:string])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
            break;
        case SRTextFieldInputTypeCommonCharecter:
        {
            NSString * regexStr = @"^[A-Za-z0-9]+$";
            NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
            if ([regextestmobile evaluateWithObject:string])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
            break;
        case SRTextFieldInputTypeChinese:
        {
            NSString * regexStr = @"^[\u4E00-\u9FA5\uf900-\ufa2d]+$";
            NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr];
            if ([regextestmobile evaluateWithObject:string])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
            break;
            
        default:
            break;
    }
    if (textField.text.length+1 > t.maxTextLength) {
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
