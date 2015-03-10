//
//  DefaultView.m
//  slideMenuDemo
//
//  Created by xidanjueying on 15/3/10.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "DefaultView.h"

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define SCREEN_WIDTH SCREEN_SIZE.width
#define SCREEN_HEIGHT SCREEN_SIZE.height
#define MAX_CENTER_X SCREEN_WIDTH * 1.5 - 60
#define BOUND_X SCREEN_WIDTH - 60

@implementation DefaultView

- (instancetype)initWithFrame:(CGRect)frame {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor blueColor];
    self.centerX = size.width / 2;
    self.centerY = size.height / 2;
    self.gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:self.gesture];
    
    NSLog(@"%f", size.width / 2);
    
    return self;
}

- (void)handlePan:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint transition = [sender translationInView:self];
        float x = self.center.x + transition.x;
        
        [UIView animateWithDuration:0.2 animations:^{
            if (x > BOUND_X) {
                self.center = CGPointMake(MAX_CENTER_X, self.centerY);
            } else {
                self.center = CGPointMake(self.centerX, self.centerY);
            }
        }];
    }
}

@end
