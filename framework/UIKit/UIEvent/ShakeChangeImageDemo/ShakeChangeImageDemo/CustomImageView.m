//
//  CustomImageView.m
//  ShakeChangeImageDemo
//
//  Created by xidanjueying on 15/1/28.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "CustomImageView.h"

#define IMG_COUNT 3;

@implementation CustomImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.image = [self getImage];
    self.contentMode = UIViewContentModeScaleAspectFit;
    return self;
}

// 让控件可以成为第一个响应者
- (BOOL)canBecomeFirstResponder {
    return YES;
}

// 运动事件开始
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    // 这里只处理摇晃事件
    if (motion == UIEventSubtypeMotionShake) {
        self.image = [self getImage];
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"运动事件结束");
}

// 取得随机图片
- (UIImage *)getImage {
    int index = arc4random() % IMG_COUNT;
    return [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg", index]];
}

@end
