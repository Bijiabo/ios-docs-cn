//
//  RadialGradientView.m
//  DrawGradientDemo
//
//  Created by xidanjueying on 15/1/29.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "RadialGradientView.h"

@implementation RadialGradientView

- (void)drawRect:(CGRect)rect {
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 使用RGB颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 颜色数组，四个数组元素表示一个颜色
    CGFloat components[12] = {
        248.0/255.0, 86.0/255.0, 86.0/255.0, 1,
        249.0/255.0, 127.0/255.0, 127.0/255.0, 1,
        1.0, 1.0, 1.0, 1.0
    };
    
    // 颜色所在位置（范围 0 ~ 1）
    CGFloat locations[3] = {0, 0.3, 1.0};
    
    /** 创建渐变色
     * space：颜色空间
     * components：颜色数组
     * locations：颜色所在位置
     * count：渐变个数
     */
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 3);
    
    /** 绘制径向渐变
     * context：图形上下文
     * gradient：渐变色
     * startCenter：起始点位置
     * startRadius：起始半径（通常为0，否则在此半径范围内容无任何填充）
     * endCenter：终点位置
     * endRadius：终点半径（即渐变的扩散长度）
     * options：绘制方式
        -- kCGGradientDrawsBeforeStartLocation，开始位置之前就进行绘制，到结束位置之后不再绘制
        -- kCGGradientDrawsAfterEndLocation，开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGFloat w = self.frame.size.width / 2;
    CGFloat h = self.frame.size.height / 2;
    CGContextDrawRadialGradient(context, gradient, CGPointMake(w, h), 0, CGPointMake(w + 10, h + 10), h - 10, kCGGradientDrawsAfterEndLocation);
    
    // 释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

@end
