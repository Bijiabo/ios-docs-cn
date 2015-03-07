//
//  ViewController.h
//  UIPageViewControllerDemo
//
//  Created by xidanjueying on 15/3/6.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MoreViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property UIPageViewController *pageController;
@property NSArray *pageContent;

@end

