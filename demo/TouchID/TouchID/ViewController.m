//
//  ViewController.m
//  TouchID
//
//  Created by xidanjueying on 15/7/8.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self authenticateUser];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)authenticateUser {
    // 初始化上下文对象
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    NSString *result = @"Authentication is needed to access your notes.";
    
    // 指纹验证回调
    void (^evaluatePolicyCallback)(BOOL success, NSError *error) = ^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"success");
        } else {
            NSLog(@"%@", error.localizedDescription);
            switch (error.code) {
                case LAErrorSystemCancel: {
                    NSLog(@"Authentication was cancelled by the system");
                    break;
                } case LAErrorUserCancel: {
                    NSLog(@"Authentication was cancelled by the user");
                    break;
                } case LAErrorUserFallback: {
                    NSLog(@"User selected to enter custom password");
                    break;
                }
                default: {
                    break;
                }
            }
        }
    };

    // 首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) { // 支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:result
                          reply:evaluatePolicyCallback];

    } else { // 不支持指纹验证
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled: {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet: {
                NSLog(@"A passcode has not been set");
                break;
            }
            default: {
                NSLog(@"TouchID not available");
                break;
            }
        }
    }
}


@end
