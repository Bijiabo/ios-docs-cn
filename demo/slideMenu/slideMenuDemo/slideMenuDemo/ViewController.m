//
//  ViewController.m
//  slideMenuDemo
//
//  Created by xidanjueying on 15/3/10.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    LeftView *leftview = [[LeftView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [self.view addSubview:leftview];
    
    DefaultView *defaultview = [[DefaultView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [self.view addSubview:defaultview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
