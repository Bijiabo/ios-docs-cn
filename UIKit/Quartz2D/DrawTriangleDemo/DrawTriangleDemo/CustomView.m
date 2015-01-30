//
//  CustomView.m
//  DrawTriangleDemo
//
//  Created by xidanjueying on 15/1/28.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect {
    // 1. 获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 三角形
    [self drawTriangleWithContext:context];
    
    // 矩形
    [self drawRectWithContext:context];
    [self drawRectByUIKitWithContext:context];
    
    // 圆形
    [self drawCircularWithContext:context];
    
    // 弧形
    [self drawArcWithContext:context];
    
    // 贝塞尔曲线
    [self drawCurveWithContext:context];
    
    // 文字
    [self drawTextWithContext:context];
    
    // 图片
    [self drawImageWithContext:context];
}

// 绘制三角形
- (void)drawTriangleWithContext:(CGContextRef)context {
    // 创建路径并添加到图形上下文
    CGContextMoveToPoint(context, 20, 40);
    CGContextAddLineToPoint(context, 20, 70);
    CGContextAddLineToPoint(context, 300, 70);
    CGContextClosePath(context); // 封闭路径
    
    // 设置图形上下文属性
    [[UIColor redColor] setStroke]; // 设置红色边框
    [[UIColor greenColor] setFill]; // 设置绿色填充
    
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 绘制矩形
- (void)drawRectWithContext:(CGContextRef)context {
    CGContextAddRect(context, CGRectMake(20, 100, 200, 30)); // 添加矩形到上下文
    [[UIColor blueColor] set]; // 同时设置填充和边框色
    CGContextDrawPath(context, kCGPathFillStroke); // 绘制路径
}

// 利用UIKit的封装方法绘制矩形
- (void)drawRectByUIKitWithContext:(CGContextRef)context {
    // 同时设置填充和边框色
    [[UIColor yellowColor] set];
    // 绘制矩形（相当于创建路径、添加路径到上下文、绘制三个步骤），只有填充
    UIRectFill(CGRectMake(20, 140, 200, 30));
    
    // 设置边框
    [[UIColor redColor] setStroke];
    // 绘制矩形，只有边框
    UIRectFrame(CGRectMake(20, 180, 200, 30));
}

// 绘制圆形
- (void)drawCircularWithContext:(CGContextRef)context {
    // 创建路径并添加到上下文
    CGContextAddEllipseInRect(context, CGRectMake(20, 230, 50, 50)); // 正圆
    CGContextAddEllipseInRect(context, CGRectMake(100, 240, 50, 40)); // 椭圆
    
    // 设置图形上下文属性
    [[UIColor redColor] setStroke]; // 设置红色边框
    [[UIColor greenColor] setFill]; // 设置绿色填充
    
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 绘制弧形
- (void)drawArcWithContext:(CGContextRef)context {
    /** 添加弧形对象
      * x:中心点x坐标
      * y:中心点y坐标
      * radius:半径
      * startAngle:起始弧度
      * endAngle:终止弧度
      * closewise:是否逆时针绘制，0则顺时针绘制
      */
    CGContextAddArc(context, 50, 300, 25, 0, M_PI, 0);
    
    // 设置图形上下文属性
    [[UIColor lightGrayColor] set];
    
    // 绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 绘制贝塞尔曲线
- (void)drawCurveWithContext:(CGContextRef)context {
    /** 绘制二次贝塞尔曲线
      * c: 图形上下文
      * cpx: 控制点x坐标
      * cpy: 控制点y坐标
      * x: 结束点x坐标
      * y: 结束点y坐标
      */
    CGContextMoveToPoint(context, 150, 320); // 移动到起始位置
    CGContextAddQuadCurveToPoint(context, 200, 280, 250, 320);
    
    /** 绘制三次贝塞尔曲线
      * c: 图形上下文
      * cp1x: 第一个控制点x坐标
      * cp1y: 第二个控制点y坐标
      * cp2x: 第二个控制点x坐标
      * cp2y: 第二个控制点y坐标
      * x: 结束点x坐标
      * y: 结束点y坐标
      */
    CGContextMoveToPoint(context, 20, 360);
    CGContextAddCurveToPoint(context, 50, 330, 80, 400, 120, 360);
    
    // 设置图形上下文属性
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

// 绘制文字
- (void)drawTextWithContext:(CGContextRef)context {
    NSString *text = @"上海上港足球俱乐部官方28日宣布孔卡即将加盟，并在通过体检后正式签约。";
    CGRect rect = CGRectMake(20, 400, 300, 50);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    
    style.alignment = NSTextAlignmentLeft;
    [text drawInRect:rect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                           NSForegroundColorAttributeName: [UIColor redColor],
                                           NSParagraphStyleAttributeName: style
                                           }];
}

// 绘制图片
- (void)drawImageWithContext:(CGContextRef)context {
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    
    // 从某一点开始绘制
    // [img drawAtPoint:CGPointMake(20, 460)];
    // 绘制到指定的矩形中，如果大小不合适会进行拉伸
    [img drawInRect:CGRectMake(20, 460, 200, 100)];
    // 平铺绘制
    // [img drawAsPatternInRect:CGRectMake(20, 460, 200, 100)];
}

@end
