//
//  ViewController.m
//  TouchMoveImageDemo
//
//  Created by xidanjueying on 15/1/27.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()
@property UIImageView *imageview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // 取得一个触摸对象，对于多点触摸可能有多个触对象
    UITouch *touch = [touches anyObject];
    // 取得当前位置
    CGPoint currentPoint = [touch locationInView:self.view];
    // 取得前一个位置
    CGPoint prevPoint = [touch previousLocationInView:self.view];
    // 移动前的中心点位置
    CGPoint centerPoint = self.imageview.center;
    // 移动的偏移量
    CGPoint offset = CGPointMake(currentPoint.x - prevPoint.x, currentPoint.y - prevPoint.y);
    // 更新图片的中心点位置
    self.imageview.center = CGPointMake(centerPoint.x + offset.x, centerPoint.y + offset.y);
}

- (void)initImage {
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    self.imageview = [[UIImageView alloc] initWithImage:img];
    self.imageview.frame = CGRectMake(50, 50, img.size.width, img.size.height);
    [self.view addSubview:self.imageview];
}

@end
