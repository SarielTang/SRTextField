//
//  SRTextFieldChecker.h
//  Parking
//
//  Created by SR on 15/4/9.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRTextCheckerResultInfo.h"
#import "SRTextCompareResultInfo.h"

typedef void (^CheckCompleteBlock)();

@interface SRTextChecker : NSObject<UITextFieldDelegate>

/**
 *  检查某个东西的文本是否符合
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block
 *
 *  @return 检查结果枚举
 */
+ (SRTextCheckingResultType)checkSomeoneTextIsCorrect:(id<SRTextCheckProtocol>)someone completionBlock:(SRTextCheckerCompetionBlock)completionBlock;

/**
 *  检查某个东西的文本是否符合，用于整组检查时
 *  如果completionBlock为nil将使用默认的展示结果的方式。(此方法不会展示结果为正确的结果)
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block回调
 *
 *  @return 结果枚举
 */
+ (SRTextCheckingResultType)checkSomeoneTextIsCorrectInGroup:(id<SRTextCheckProtocol>)someone completionBlock:(SRTextCheckerCompetionBlock)completionBlock;

/**
 *  按顺序检查控件数组里的所有控件
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param widgets         控件数组内容为, id<SRSRTextCheckProtocol>
 *  @param completionBlock 完成时调用的block
 *
 *  @return 检查结果对象
 */
+ (SRTextCheckerResultInfo *)checkAllWidgets:(NSArray *)widgets completionBlock:(SRTextCheckerCompetionBlock)completionBlock;

/**
 *  检查控件数组里需要相等的控件是否相等，数组是比较配置数组.
 *
 *  @param configs         SRTextCompareCofig数组
 *  @param completionBlock 完成时的回调block
 *
 *  @return 结果对象
 */
+ (SRTextCompareResultInfo *)comepareObjectWidgetsByConfigs:(NSArray *)configs completionBlock:(SRTextCheckerCompetionBlock)completionBlock;

@end
