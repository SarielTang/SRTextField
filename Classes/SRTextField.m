//
//  SRTextField.m
//  SRTextFieldDemo
//
//  Created by SarielTang on 15/10/15.
//  Copyright © 2015年 Sariel. All rights reserved.
//

#import "SRTextField.h"
#import "SRTextChecker.h"

@interface SRTextField ()

@property (nonatomic,strong) SRTextChecker *checker;

@end

@implementation SRTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor grayColor];
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.returnKeyType = UIReturnKeyDone;
        self.enablesReturnKeyAutomatically = YES;
        _checker = [[SRTextChecker alloc]init];
        self.delegate = self.checker;
    }
    return self;
}

- (NSString *)checkedText
{
    return self.text;
}

#pragma  mark - SRTextCheckProtocol
- (SRTextCheckingResultType)checkTextIsCorrectWithCompletionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
    
    return [SRTextChecker checkSomeoneTextIsCorrect:self completionBlock:completionBlock];
}

- (SRTextCheckingResultType)checkTextIsCorrectInGroupWithCompletionBlock:(SRTextCheckerCompetionBlock)completionBlock
{
    return [SRTextChecker checkSomeoneTextIsCorrectInGroup:self completionBlock:completionBlock];
}

@end
