//
//  FKLoginViewController.m
//  QQZone
//
//  Created by kun on 15/2/1.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKLoginViewController.h"
#import "UIImage+FK.h"
#import "FKMainViewController.h"
#import "FKCommon.h"

@interface FKLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginingView;
/**
 *  登录框
 */
@property (weak, nonatomic) IBOutlet UIView *loginView;
/**
 *  帐号
 */
@property (weak, nonatomic) IBOutlet UITextField *accountField;
/**
 *  密码
 */
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

/**
 *  登录按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
/**
 *  登录
 */
- (IBAction)login;

/**
 *  点击checkbox
 */
- (IBAction)checkboxClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *rememberPasswordBox;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBox;
@end

@implementation FKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = FKGlobalBgColor;
    
    // 1.设置按钮背景
    [self.loginButton setBackgroundImage:[UIImage resizedImageWithName:@"login_button_normal"] forState:UIControlStateNormal];
    
    [self.loginButton setBackgroundImage:[UIImage resizedImageWithName:@"login_button_pressed"] forState:UIControlStateHighlighted];
}

- (IBAction)login {
    // 1.帐号认证
    NSString *account = self.accountField.text;
    if(account.length == 0)
    {
        [self showError:@"请输入帐号"];
        return;
    }
    
    // 2.验证密码
    NSString *pwd = self.pwdField.text;
    if(pwd.length == 0)
    {
        [self showError:@"请输入密码"];
        return;
    }
    
    // 3.发送请求
    self.view.userInteractionEnabled = NO;
    [self.loginingView startAnimating];
    
    CGFloat delay = 2.0f;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay *NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 4.登录完毕（请求完毕）
        [self.loginingView stopAnimating];
        self.view.userInteractionEnabled = YES;
        
        // 5.帐号密码同时为123才是正确
        if(![account isEqualToString:@"123"])
        {
            [self showError:@"请输入正确的帐号"];
            return;
        }
        
        if(![pwd isEqualToString:@"123"])
        {
            [self showError:@"请输入正确的密码"];
            return;
        }
        
        // 6.登录成功
#warning 跳转到主页
        self.view.window.rootViewController = [[FKMainViewController alloc] init];
        
    });
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/**
 *  显示错误信息
 *
 *  @param errorMsg 错误信息
 */
- (void)showError:(NSString *)errorMsg
{
    // 1.弹框提示
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录失败" message:errorMsg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
    // 2.抖动
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
    shakeAnim.keyPath = @"transform.translation.x";
    shakeAnim.duration = 0.15;
    CGFloat delta = 15;
    shakeAnim.values = @[@0, @(-delta), @(delta), @0];
    shakeAnim.repeatCount = 2;
    [self.loginView.layer addAnimation:shakeAnim forKey:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.accountField)
    {
        [self.pwdField becomeFirstResponder];
    }
    else if (textField == self.pwdField)
    {
        [self login];
    }
    return YES;
}
- (IBAction)checkboxClick:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    if(sender == self.rememberPasswordBox && !sender.isSelected)
    {
        self.autoLoginBox.selected = NO;
    }
    else if(sender == self.autoLoginBox && sender.isSelected)
    {
        self.rememberPasswordBox.selected = YES;
    }
}
@end
