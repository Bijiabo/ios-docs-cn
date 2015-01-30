//
//  ViewController.m
//  DrawGradientDemo
//
//  Created by xidanjueying on 15/1/29.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "LinearGradientView.h"
#import "RadialGradientView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    float width = size.width;
    float height = size.height / 3;
    
    // 线性渐变
    LinearGradientView *linearView = [[LinearGradientView alloc] initWithFrame:CGRectMake(0, 0, width, height) isNeedClip:NO];
    // 对裁剪的区域进行渐变填充
    LinearGradientView *clipLinearView = [[LinearGradientView alloc] initWithFrame:CGRectMake(0, linearView.frame.size.height, width, height) isNeedClip:YES];
    // 径向渐变
    RadialGradientView *radialView = [[RadialGradientView alloc] initWithFrame:CGRectMake(0, clipLinearView.frame.origin.y + clipLinearView.frame.size.height, width, height)];
    
    [self.view addSubview:linearView];
    [self.view addSubview:clipLinearView];
    [self.view addSubview:radialView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
