//
//  SRTextCheckerResultInfo.m
//  SRTextChecker
//
//  Created by SR on 15/5/24.
//  Copyright (c) 2015年 SR. All rights reserved.
//

#import "SRTextCheckerResultInfo.h"

@implementation SRTextCheckerResultInfo

- (void)showResult
{
    
    //这里是默认的展示检查结果的地方,使用block回调将不会调用这个方法。
    
    NSString *resultString = self.resultString;
    
    NSLog(@"%@", resultString);
    
}

- (void)setResultType:(SRTextCheckingResultType)resultType
{
    _resultType = resultType;
    
    switch (self.resultType) {
            
        case SRTextCheckingResultTypeEmpty:
        {
            self.resultString = [self.someone emptyDescription];
        }
            break;
        case SRTextCheckingResultTypeFormatError:
        {
            self.resultString = [self.someone errorDescription];
        }
            break;
        case SRTextCheckingResultTypeCorrect:
        {
            self.resultString = [NSString stringWithFormat:@"%@ is ok!", self.someone];
        }
            break;
        case SRTextCheckingResultTypeEeverythingIsOK:
        {
            self.resultString = @"Everything is ok!";
        }
            
        default:
            break;
    }
    
}

@end
