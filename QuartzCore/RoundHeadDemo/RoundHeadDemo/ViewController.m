//
//  ViewController.m
//  RoundHeadDemo
//
//  Created by xidanjueying on 15/1/30.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

#define PHOTO_SIZE 150

@interface ViewController ()

@property CALayer *layerShadow;
@property CALayer *layerBox;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect bounds = CGRectMake(0, 0, PHOTO_SIZE, PHOTO_SIZE);
    CGFloat cornerRadius = PHOTO_SIZE / 2;
    CGColorRef borderColor = [UIColor whiteColor].CGColor;
    CGFloat borderWidth = 2;
    
    // 阴影图层
    // 注：阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，而阴影效果刚好在外边框
    self.layerShadow = [[CALayer alloc] init];
    self.layerShadow.bounds = bounds;
    self.layerShadow.position = self.view.center;
    self.layerShadow.cornerRadius = cornerRadius;
    self.layerShadow.shadowColor = [UIColor blackColor].CGColor;
    self.layerShadow.shadowOffset = CGSizeMake(1, 1);
    self.layerShadow.shadowOpacity = 0.9;
    self.layerShadow.borderColor = borderColor;
    self.layerShadow.borderWidth = borderWidth;
    [self.view.layer addSublayer:self.layerShadow];
    
    // 图层容器
    self.layerBox = [[CALayer alloc] init];
    self.layerBox.bounds = bounds;
    self.layerBox.position = self.view.center;
    self.layerBox.backgroundColor = [UIColor redColor].CGColor;
    // 仅仅设置圆角，对于图形而言可以正常显示，但是对于图层中绘制的图片却无法显示，
    // 此时必须设置masksToBounds为YES，剪切子图层
    self.layerBox.cornerRadius = cornerRadius;
    self.layerBox.masksToBounds = YES;
    self.layerBox.borderColor = borderColor;
    self.layerBox.borderWidth = borderWidth;
    self.layerBox.delegate = self;
    
    [self.view.layer addSublayer:self.layerBox];
    
    // 必须调用该方法，否则代理方法不会被调用
    [self.layerBox setNeedsDisplay];
}

// 该方法中，绘图时所有的位置都是相对于图层而言的，图形上下文指的也是当前图层的图形上下文
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 保存图形上下文的初始状态
    CGContextSaveGState(ctx);
    
    // 图形上下文形变，解决倒立问题
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -PHOTO_SIZE);
    
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_SIZE, PHOTO_SIZE), [UIImage imageNamed:@"1.jpg"].CGImage);
    
    CGContextRestoreGState(ctx);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGFloat width = self.layerBox.bounds.size.width;
    
    if (width == PHOTO_SIZE) {
        width = 2 * PHOTO_SIZE;
    } else {
        width = PHOTO_SIZE;
    }
    
    CGRect bounds = CGRectMake(0, 0, width, width);
    CGFloat cornerRadius = width / 2;
    
    self.layerBox.bounds = bounds;
    self.layerBox.cornerRadius = cornerRadius;
    self.layerShadow.bounds = bounds;
    self.layerShadow.cornerRadius = cornerRadius;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
