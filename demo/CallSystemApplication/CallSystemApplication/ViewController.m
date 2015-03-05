//
//  ViewController.m
//  CallSystemApplication
//
//  Created by xidanjueying on 15/2/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initButtons];
}

- (void)initButtons {
    // 打电话
    UIButton *telButton = [self createButtonWithTitle:@"打电话" andIndex:0];
    [telButton addTarget:self action:@selector(callTel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:telButton];
    
    // 发短信
    UIButton *msgButton = [self createButtonWithTitle:@"发短信" andIndex:1];
    [msgButton addTarget:self action:@selector(callMsg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:msgButton];
    
    // 发送邮件
    UIButton *emailButton = [self createButtonWithTitle:@"发邮件" andIndex:2];
    [emailButton addTarget:self action:@selector(callEmail:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emailButton];
    
    // 浏览网页
    UIButton *webpageButton = [self createButtonWithTitle:@"看网页" andIndex:3];
    [webpageButton addTarget:self action:@selector(callWebpage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:webpageButton];
}

- (UIButton *)createButtonWithTitle:(NSString *)title andIndex:(NSInteger)index {
    UIButton *btn = [[UIButton alloc] init];
    
    btn.frame = CGRectMake((index + 1) * 10 + index * 70, 50, 60, 30);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return btn;
}

- (void)callTel:(id)sender {
    NSString *url = [NSString stringWithFormat:@"telprompt://%@", @"123456789"];
    [self openUrl:url];
}

- (void)callMsg:(id)sender {
    NSString *url = [NSString stringWithFormat:@"sms://%@", @"123456789"];
    [self openUrl:url];
}

- (void)callEmail:(id)sender {
    NSString *url = [NSString stringWithFormat:@"mailto://%@", @"changtian@taobao.com"];
    [self openUrl:url];
}

- (void)callWebpage:(id)sender {
    NSString *url = [NSString stringWithFormat:@"http://www.taobao.com"];
    [self openUrl:url];
}

- (void)openUrl:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
