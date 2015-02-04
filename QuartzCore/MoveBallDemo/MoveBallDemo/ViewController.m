//
//  ViewController.m
//  MoveBallDemo
//
//  Created by xidanjueying on 15/1/30.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

#define WIDTH 50

@interface ViewController ()
@property CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawBallLayer];
}

- (void)drawBallLayer {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    // 获得根图层
    self.layer = [[CALayer alloc] init];
    // 设置背景色，由于QuartzCore是跨平台框架，无法直接使用UIColor
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    // 设置中心点
    self.layer.position = CGPointMake(size.width / 2, size.height / 2);
    // 设置大小
    self.layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    // 设置圆角
    self.layer.cornerRadius = WIDTH / 2;
    // 设置阴影颜色
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    // 设置阴影偏移
    self.layer.shadowOffset = CGSizeMake(2, 2);
    // 设置阴影透明度
    self.layer.shadowOpacity = 0.9;
    
    [self.view.layer addSublayer:self.layer];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGFloat width = self.layer.bounds.size.width;
    
    if (width == WIDTH) {
        width = 4 * WIDTH;
    } else {
        width = WIDTH;
    }
    
    self.layer.bounds = CGRectMake(0, 0, width, width);
    self.layer.position = [touch locationInView:self.view];
    self.layer.cornerRadius = width / 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
