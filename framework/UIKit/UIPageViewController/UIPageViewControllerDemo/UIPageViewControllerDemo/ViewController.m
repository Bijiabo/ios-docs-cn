//
//  ViewController.m
//  UIPageViewControllerDemo
//
//  Created by xidanjueying on 15/3/6.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPageContent];
    [self initPageController];
    [self initPageControl];
}

- (void)initPageContent {
    self.pageContent = @[@"http://a.hiphotos.baidu.com/image/w%3D310/sign=680bde304e086e066aa8394a32097b5a/6a63f6246b600c3357d69cc9184c510fd9f9a100.jpg",
                         @"http://e.hiphotos.baidu.com/image/w%3D310/sign=9d2bde29952bd40742c7d5fc4b899e9c/3812b31bb051f8191217434bd8b44aed2e73e785.jpg",
                         @"http://c.hiphotos.baidu.com/image/w%3D310/sign=0e809763d488d43ff0a997f34d1fd2aa/79f0f736afc37931f8d6b63fe9c4b74543a9116d.jpg"];
}

- (void)initPageController {
    // UIPageViewControllerOptionInterPageSpacingKey，指定两个page之间的间距
    // 注意：仅在transitionStyle为UIPageViewControllerTransitionStyleScroll才有效
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey: @10.0f};
    
    // 初始化
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pageController.dataSource = self;
    self.pageController.view.frame = self.view.bounds;
    [self.pageController setViewControllers:@[[self viewControllerAtIndex:0]]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:YES
                                 completion:nil];
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
}

- (void)initPageControl {
    CGSize screenSize = self.view.frame.size;
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(0, screenSize.height - 50, screenSize.width, 50);
    self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.numberOfPages = self.pageContent.count;
    
    [self.view addSubview:self.pageControl];
}

// 根据索引值获取对应的viewController
- (MoreViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (index >= self.pageContent.count) {
        return nil;
    }
    
    MoreViewController *viewController = [[MoreViewController alloc] init];
    viewController.urlstr = [self.pageContent objectAtIndex:index];
    
    return viewController;
}

// 获取指定viewController在所有viewController中的顺序值
- (NSInteger)getIndexByViewController:(MoreViewController *)viewController {
    return [self.pageContent indexOfObject:viewController.urlstr];
}

#pragma mark - UIPageViewController数据源方法
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self getIndexByViewController:(MoreViewController *)viewController];
    
    [self.pageControl setCurrentPage:index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self getIndexByViewController:(MoreViewController *)viewController];
    
    [self.pageControl setCurrentPage:index];
    
    index++;
    
    return [self viewControllerAtIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
