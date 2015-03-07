//
//  MoreViewController.m
//  UIPageViewControllerDemo
//
//  Created by xidanjueying on 15/3/6.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController()
@property UIImageView *imageview;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:self.urlstr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.imageview.contentMode = UIViewContentModeScaleAspectFit;
    self.imageview.image = image;
    
    [self.view addSubview:self.imageview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
