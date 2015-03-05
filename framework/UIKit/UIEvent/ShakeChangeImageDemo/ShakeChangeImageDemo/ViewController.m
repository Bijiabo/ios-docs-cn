//
//  ViewController.m
//  ShakeChangeImageDemo
//
//  Created by xidanjueying on 15/1/28.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "CustomImageView.h"

@interface ViewController ()
@property CustomImageView *imageview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageview = [[CustomImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.imageview.userInteractionEnabled = YES;
    [self.view addSubview:self.imageview];
}

// 视图显示时让控件变成第一响应者
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.imageview becomeFirstResponder];
}

// 视图不显示时注销控件第一响应者的身份
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.imageview resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
