//
//  ZBTextField.m
//  SRTextFieldDemo
//
//  Created by SarielTang on 15/11/11.
//  Copyright © 2015年 Sariel. All rights reserved.
//

#import "ZBTextField.h"

@interface ZBTextField ()

@property (nonatomic,strong)UIView *underline;

@end

@implementation ZBTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor blackColor];
        self.borderStyle = UITextBorderStyleNone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_underline == nil) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, 1)];
        [self.superview addSubview:view];
        view.backgroundColor = [UIColor grayColor];
        _underline = view;
    }
}

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{
    [[UIColor grayColor] setFill];
    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:self.font.pointSize]];
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y + (bounds.size.height-self.font.pointSize) * 0.5, bounds.size.width, bounds.size.height);
    return inset;
}

@end
