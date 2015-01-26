//
//  ViewController.m
//  autoresizingMaskDemo
//
//  Created by xidanjueying on 15/1/19.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButton {
    UIButton *btn = [[UIButton alloc] init];
    [btn setFrame:CGRectMake(50, 50, 200, 50)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"hello world" forState:UIControlStateNormal];
    // 宽度与右边距自适应（注：左边距会保持不变）
    [btn setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin];
    [self.view addSubview:btn];
}

@end
