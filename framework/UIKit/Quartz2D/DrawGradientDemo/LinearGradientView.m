//
//  LinearGradientView.m
//  DrawGradientView
//
//  Created by xidanjueying on 15/1/29.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "LinearGradientView.h"

@interface LinearGradientView()
@property BOOL isNeedClip;
@end

@implementation LinearGradientView

- (instancetype)initWithFrame:(CGRect)frame isNeedClip:(BOOL)isNeedClip {
    self = [super initWithFrame:frame];
    self.isNeedClip = isNeedClip;
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 从上下文中裁切处一块矩形用于显示，注意必须先裁切再调用渐变
    if (self.isNeedClip) {
        CGContextClipToRect(context, CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40));
    }

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
    
    /** 绘制线性渐变
     * context：图形上下文
     * gradient：渐变色
     * startPoint：起始位置
     * endPoint：终止位置
     * options：绘制方式，
     -- kCGGradientDrawsBeforeStartLocation，开始位置之前就进行绘制，到结束位置之后不再绘制
     -- kCGGradientDrawsAfterEndLocation，开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(self.frame.size.width, self.frame.size.height), kCGGradientDrawsAfterEndLocation);
    
    // 释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

@end
