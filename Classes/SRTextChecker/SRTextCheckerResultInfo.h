//
//  SRTextCheckerResultInfo.h
//  SRTextChecker
//
//  Created by SR on 15/5/24.
//  Copyright (c) 2015年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRTextCheckerConfig.h"

@interface SRTextCheckerResultInfo : NSObject

@property (nonatomic, assign) SRTextCheckingResultType resultType;

@property (nonatomic, strong) id<SRTextCheckProtocol> someone;

@property (nonatomic, strong) NSString *resultString;

- (void)showResult;

@end
