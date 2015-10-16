//
//  SRTextField.h
//  SRTextField
//
//  Created by SarielTang on 15/10/16.
//  Copyright © 2015年 Sariel. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for SRTextField.
FOUNDATION_EXPORT double SRTextFieldVersionNumber;

//! Project version string for SRTextField.
FOUNDATION_EXPORT const unsigned char SRTextFieldVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SRTextField/PublicHeader.h>

#import "SRTextCheckerConfig.h"
#import "SRTextChecker.h"

IB_DESIGNABLE
@interface SRTextField : UITextField<SRTextCheckProtocol>

@property (nonatomic, assign) SRTextFieldInputType inputType;

#pragma mark ProtocolProperty
@property (nonatomic, strong) NSString *errorDescription;

@property (nonatomic, assign) BOOL allowEmpty;

@property (nonatomic, strong, readonly) NSString *checkedText;

@property (nonatomic, strong) NSString *emptyDescription;

@property (nonatomic, strong) NSString *regString;

@property (nonatomic, assign) IBInspectable NSUInteger maxTextLength;


/**
 *  检查textField的text是否符合规则
 *
 *  @param completionBlock 完成检查时的回调block
 *
 *  @return 检查的结果枚举
 */
- (SRTextCheckingResultType)checkTextIsCorrectWithCompletionBlock:(SRTextCheckerCompetionBlock)completionBlock;
@end
