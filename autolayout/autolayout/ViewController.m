//
//  ViewController.m
//  autolayout
//
//  Created by xidanjueying on 15/4/13.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak ViewController *weakSelf = self;
    
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv1];
    
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:sv2];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sv);
        make.left.equalTo(sv).mas_offset(110);
        make.size.mas_equalTo(sv);
    }];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sv1);
        make.left.equalTo(sv1).mas_offset(110);
        make.size.mas_equalTo(sv1);
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
