//
//  SRTextCompareConfig.m
//  SRTextChecker
//
//  Created by SR on 15/5/24.
//  Copyright (c) 2015年 SR. All rights reserved.
//

#import "SRTextCompareConfig.h"

@implementation SRTextCompareConfig

- (SRTextCheckingResultType)compare
{
    if ([[self.object_1 checkedText] isEqualToString:[self.object_2 checkedText]]) {
        return SRTextCheckingResultTypeCorrect;
    }
    return SRTextCheckingResultTypeUnlike;
}

@end
