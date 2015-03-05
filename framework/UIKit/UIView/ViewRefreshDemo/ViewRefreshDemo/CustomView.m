//
//  CustomView.m
//  ViewRefreshDemo
//
//  Created by xidanjueying on 15/1/30.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;

    NSDictionary *attrs = @{
                            NSFontAttributeName:[UIFont systemFontOfSize:self.fontSize],
                            NSForegroundColorAttributeName:[UIColor redColor],
                            NSParagraphStyleAttributeName:style
                          };
    
    [self.title drawInRect:CGRectMake(rect.origin.x, self.frame.size.height / 2, rect.size.width, rect.size.height) withAttributes:attrs];
}

@end
