//
//  ViewController.m
//  SRTextFieldDemo
//
//  Created by SarielTang on 15/10/16.
//  Copyright © 2015年 Sariel. All rights reserved.
//

#import "ViewController.h"
#import <SRTextField/SRTextField.h>

@interface ViewController ()<UITextFieldDelegate>
{
    SRTextField *t1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //手机号码输入框
    t1 = [[SRTextField alloc]init];
    t1.regString = RegStringPhoneNumber;//正则验证是否为手机号码
    t1.inputType = SRTextFieldInputTypeNumber;//只允许输入数字
    t1.errorDescription = @"手机号格式错误!";//错误描述
    t1.emptyDescription = @"手机号不能为空!";//是否为空描述
    t1.delegate = self;//设置Controller为代理对象，遵守UITextfield的代理协议，无须其他操作
    [self.view addSubview:t1];
    t1.frame =  CGRectMake(16, 60, 200, 60);
    
    //验证按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 300, 200, 60);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick {
    //检查单个的SRTextField或者多个SRTextField对象均使用这个方法。
    [SRTextChecker checkAllWidgets:@[t1] completionBlock:^(SRTextCheckerResultInfo *resultInfo) {
        //输出上面填写过的错误提示
        NSLog(@"%@",resultInfo.resultString);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
