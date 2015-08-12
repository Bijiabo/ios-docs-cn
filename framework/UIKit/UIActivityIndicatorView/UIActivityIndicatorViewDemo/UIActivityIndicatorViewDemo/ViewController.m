//
//  ViewController.m
//  UIActivityIndicatorViewDemo
//
//  Created by xidanjueying on 15/8/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] init];
    indicator.frame = CGRectMake(0, 0, 100, 100);
    indicator.center = self.view.center;
    indicator.hidesWhenStopped = YES;
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [indicator startAnimating];
    [self.view addSubview:indicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
