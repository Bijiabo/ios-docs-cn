//
//  ViewController.m
//  InfiniteScrollDemo
//
//  Created by xidanjueying on 15/1/26.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH SCREEN_BOUNDS.size.width
#define SCREEN_HEIGHT SCREEN_BOUNDS.size.height
#define IMAGEVIEW_COUNT 3

@interface ViewController ()
@property UIScrollView *scrollview;
@property UIImageView *leftImageView;
@property UIImageView *centerImageView;
@property UIImageView *rightImageView;
@property UIPageControl *pageControl;
@property UILabel *label;
@property NSMutableDictionary *imgData;
@property int currentIndex; // 当前图片索引
@property int imgCount; // 图片总数
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImageData];
    [self initScrollView];
    [self initImageViews];
    [self initPageControl];
    [self initLabel];
    [self setDefaultImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initImageData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"imageInfo" ofType:@"plist"];
    self.imgData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    self.imgCount = (int)[self.imgData count];
}

- (void)initScrollView {
    self.scrollview = [[UIScrollView alloc] initWithFrame:SCREEN_BOUNDS];
    [self.view addSubview:self.scrollview];
    
    self.scrollview.delegate = self;
    self.scrollview.contentSize = CGSizeMake(IMAGEVIEW_COUNT * SCREEN_WIDTH, SCREEN_HEIGHT);
    // 设置当前显示的位置为中间图片
    self.scrollview.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    // 设置分页
    self.scrollview.pagingEnabled = YES;
    // 隐藏水平滚动条
    self.scrollview.showsHorizontalScrollIndicator = NO;
}

- (void)initImageViews {
    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollview addSubview:self.leftImageView];
    
    self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollview addSubview:self.centerImageView];
    
    self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2 * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollview addSubview:self.rightImageView];
}

// 分页控件
- (void)initPageControl {
    self.pageControl = [[UIPageControl alloc] init];
    // 此方法可以根据页数返回UIPageControl合适的大小
    CGSize size = [self.pageControl sizeForNumberOfPages:self.imgCount];
    // 设置位置和尺寸
    self.pageControl.frame = CGRectMake((SCREEN_WIDTH - size.width) / 2, 30, size.width, size.height);
    // 设置总页数
    self.pageControl.numberOfPages = self.imgCount;
    // 设置默认颜色
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    // 设置当前颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [self.view addSubview:self.pageControl];
}

// 图片描述
- (void)initLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.pageControl.frame.size.height + self.pageControl.frame.origin.y + 20, SCREEN_WIDTH, 30)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    [self.view addSubview:self.label];
}

- (NSString *)getImageNameByIndex:(int)index {
    return [NSString stringWithFormat:@"%i.jpg", index];
}

- (void)setDefaultImage {
    self.leftImageView.image = [UIImage imageNamed:[self getImageNameByIndex:self.imgCount - 1]];
    self.centerImageView.image = [UIImage imageNamed:[self getImageNameByIndex:0]];
    self.rightImageView.image = [UIImage imageNamed:[self getImageNameByIndex:1]];
    self.currentIndex = 0;
    
    // 设置当前页
    self.pageControl.currentPage = self.currentIndex;
    // 设置描述信息
    self.label.text = self.imgData[[self getImageNameByIndex:self.currentIndex]];
}

- (void)resetImage {
    int leftImageIndex;
    int rightImageIndex;
    CGPoint offset = self.scrollview.contentOffset;
    
    if (offset.x > SCREEN_WIDTH) { // 向右滑
        self.currentIndex = (self.currentIndex + 1) % self.imgCount;
    } else if (offset.x < SCREEN_WIDTH) { // 向左滑
        self.currentIndex = (self.currentIndex + self.imgCount - 1) % self.imgCount;
    }
    
    leftImageIndex = (self.currentIndex + self.imgCount - 1) % self.imgCount;
    rightImageIndex = (self.currentIndex + 1) % self.imgCount;
    
    self.leftImageView.image = [UIImage imageNamed:[self getImageNameByIndex:leftImageIndex]];
    self.rightImageView.image = [UIImage imageNamed:[self getImageNameByIndex:rightImageIndex]];
    self.centerImageView.image = [UIImage imageNamed:[self getImageNameByIndex:self.currentIndex]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 重新设置图片
    [self resetImage];
    // 移动到中间
    self.scrollview.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    // 设置分页
    self.pageControl.currentPage = self.currentIndex;
    // 显示图片描述
    self.label.text = self.imgData[[self getImageNameByIndex:self.currentIndex]];
}

@end
