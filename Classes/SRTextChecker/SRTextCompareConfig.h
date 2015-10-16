//
//  SRTextCompareConfig.h
//  SRTextChecker
//
//  Created by SR on 15/5/24.
//  Copyright (c) 2015年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRTextCheckerConfig.h"

@interface SRTextCompareConfig : NSObject

@property (nonatomic, assign) id<SRTextCheckProtocol> object_1;

@property (nonatomic, assign) id<SRTextCheckProtocol> object_2;

/**
 *  两个元素不一样时的描述
 */
@property (nonatomic, strong) NSString *unlikeDescription;

/**
 *  比较两个元素是否一样
 *
 *  @return 结果
 */
- (SRTextCheckingResultType)compare;

@end
