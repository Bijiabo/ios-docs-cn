//
//  ViewController.m
//  WaterMarkDemo
//
//  Created by xidanjueying on 15/1/30.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [self addWatermarkForImage:@"1.jpg"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    imageview.center = self.view.center;
    [self.view addSubview:imageview];
}

- (UIImage *)addWatermarkForImage:(NSString *)imageName {
    // 获得一个位图图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(300, 180)); // 300 x 180 是画布大小
    
    // 将图片绘制在图形上下文中
    UIImage *image = [UIImage imageNamed:imageName];
    [image drawInRect:CGRectMake(0, 0, 300, 180)]; // 绘图的位置是相对于画布顶点而言，不是屏幕
    
    // 添加水印
    NSString *str = @"我是水印";
    NSDictionary *attrs = @{
                            NSFontAttributeName:[UIFont systemFontOfSize:15],
                            NSForegroundColorAttributeName:[UIColor greenColor]
                            };
    [str drawInRect:CGRectMake(220, 148, 70, 20) withAttributes:attrs];
    
    // 获取绘制的新图形
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭位图图形上下文
    UIGraphicsEndImageContext();
    
    return newimage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
