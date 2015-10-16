# SRTextField

* TextField, which can automatically perform regular verification, and automatically prohibits the non - allowed characters to be entered.
* 能够自动进行正则验证的TextField，并自动禁止非允许的字符进行输入。

## Requirements

* iOS 7.0+ 
* Xcode 7.0

## 如何使用SRTextField

* 手动导入：
    * 将`SRTextField/Classes`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "SRTextField.h"`

## Usage

* 创建SRTextField
```
    SRTextField *phoneTextField = [[SRTextField alloc]init];
    phoneTextField.regString = RegStringPhoneNumber;//正则验证是否为手机号码
    phoneTextField.inputType = SRTextFieldInputTypeNumber;//只允许输入数字
    phoneTextField.errorDescription = @"手机号格式错误!";//错误描述
    phoneTextField.emptyDescription = @"手机号不能为空!";//是否为空描述
    phoneTextField.delegate = self;//设置Controller为代理对象，遵守UITextfield的代理协议，无须其他操作
```
* 检查单个的SRTextField或者多个SRTextField对象均使用这个方法。
```
    [SRTextChecker checkAllWidgets:@[t1] completionBlock:^(SRTextCheckerResultInfo *resultInfo) {
        //输出上面填写过的错误提示
        NSLog(@"%@",resultInfo.resultString);
    }];
```
