//
//  SRTextCompareResultInfo.h
//  SRTextChecker
//
//  Created by SR on 15/5/24.
//  Copyright (c) 2015年 SR. All rights reserved.
//

#import "SRTextCheckerResultInfo.h"
#import "SRTextCompareConfig.h"

@interface SRTextCompareResultInfo : SRTextCheckerResultInfo

@property (nonatomic, strong) SRTextCompareConfig *config;

@property (nonatomic, assign) SRTextCheckingResultType resultType;

@end
