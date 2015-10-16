//
//  SRTextCheckerConfig.h
//  SRTextChecker
//
//  Created by SR on 15/5/23.
//  Copyright (c) 2015年 SR. All rights reserved.
//

#ifndef SRTextChecker_SRTextCheckerConfig_h
#define SRTextChecker_SRTextCheckerConfig_h

@protocol SRTextCheckProtocol;
@class SRTextCheckerResultInfo;

#pragma mark - 自定义类型
typedef NS_ENUM(NSInteger, SRTextCheckingResultType)
{
    SRTextCheckingResultTypeCorrect = 0,
    SRTextCheckingResultTypeEmpty = 1,
    SRTextCheckingResultTypeFormatError = 2,
    SRTextCheckingResultTypeUnlike = 3,
    SRTextCheckingResultTypeEeverythingIsOK = -1,
};

typedef NS_ENUM(NSUInteger, SRTextFieldInputType) {
    SRTextFieldInputTypeEverything      = 0,//不限制字符输入
    SRTextFieldInputTypeNumber          = 1,//限制只输入数字
    SRTextFieldInputTypeLetter          = 2,//限制只输入字母
    SRTextFieldInputTypeCommonCharecter = 3,//限制只输入数字和字母
    SRTextFieldInputTypeChinese         = 4,//限定只输入中文
};

typedef void(^SRTextCheckerCompetionBlock)(SRTextCheckerResultInfo *resultInfo);

#pragma mark - 正则表达式集合
static NSString *const RegStringPhoneNumber = @"^[1][3-8]\\d{9}$";
static NSString *const RegStringPassword = @"^[a-zA-z0-9]{6}[a-zA-z0-9]{0,10}$";
static NSString *const RegStringMessageCode = @"^[0-9]\\d{5}$";
static NSString *const RegStringCarNumber = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$";
static NSString *const RegStringChineseName = @"^[\u4E00-\u9FA5]{2,5}$";

#pragma mark - 协议
@protocol SRTextCheckProtocol <NSObject>

@required;

- (SRTextCheckingResultType)checkTextIsCorrectWithCompletionBlock:(SRTextCheckerCompetionBlock)completionBlock;

- (SRTextCheckingResultType)checkTextIsCorrectInGroupWithCompletionBlock:(SRTextCheckerCompetionBlock)completionBlock;

#pragma mark - PropertyMethod
- (NSString *)errorDescription;

- (BOOL)allowEmpty;

- (NSString *)emptyDescription;

- (NSString *)checkedText;

- (NSString *)regString;

@end

#endif
