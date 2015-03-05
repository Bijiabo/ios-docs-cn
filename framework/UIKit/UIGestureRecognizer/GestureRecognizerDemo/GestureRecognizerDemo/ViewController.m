//
//  ViewController.m
//  GestureRecognizerDemo
//
//  Created by xidanjueying on 15/1/27.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

#define IMAGE_COUNT 3;

@interface ViewController ()

@property UIImageView *imageview;
@property int currentIndex;
@property UINavigationBar *navbar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
    [self addGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 布局
- (void)initLayout {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat statusBarHeight = 20;
    
    // 导航条
    self.navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, statusBarHeight, screenSize.width, 50)];
    self.navbar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.navbar];
    
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(0, self.navbar.frame.origin.y + self.navbar.frame.size.height, screenSize.width, screenSize.height - self.navbar.frame.origin.y - self.navbar.frame.size.height);
    // 缩放填充
    self.imageview.contentMode = UIViewContentModeScaleAspectFit;
    // 允许接收手势操作
    self.imageview.userInteractionEnabled = YES;
    self.imageview.image = [UIImage imageNamed:@"0.jpg"];
    [self.view addSubview:self.imageview];
}

// 添加手势
- (void)addGesture {
    // 添加点按手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    tapGesture.numberOfTapsRequired = 1; // 设置点按次数（即点几次才能触发），默认为1
    tapGesture.numberOfTouchesRequired = 1; // 设置点按的手指数（即需要几个手指点按才能触发）
    [self.view addGestureRecognizer:tapGesture];
    
    // 添加长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressImage:)];
    longPressGesture.minimumPressDuration = 0.5; // 设置长按时间，默认为0.5秒
    [self.imageview addGestureRecognizer:longPressGesture];
    
    // 添加捏合手势
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImage:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    // 添加旋转手势
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImage:)];
    [self.view addGestureRecognizer:rotateGesture];
    
    // 添加拖动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImage:)];
    [self.imageview addGestureRecognizer:panGesture];
    
    // 添加轻扫手势（注：一个轻扫手势只能控制一个方向，默认向右）
    UISwipeGestureRecognizer *swipeGestureToRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    [self.view addGestureRecognizer:swipeGestureToRight];
    
    UISwipeGestureRecognizer *swipeGestureToLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    swipeGestureToLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureToLeft];
    
    // 解决在图片上滑动时，拖动手势和轻扫手势的冲突
    [panGesture requireGestureRecognizerToFail:swipeGestureToLeft];
    [panGesture requireGestureRecognizerToFail:swipeGestureToRight];
}

- (void)nextImage {
    int count = IMAGE_COUNT;
    int index = (self.currentIndex + 1 + count) % count;
    self.currentIndex = index;
    self.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg", index]];
}

- (void)prevImage {
    int count = IMAGE_COUNT;
    int index = (self.currentIndex - 1 + count) % count;
    self.currentIndex = index;
    self.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg", index]];
}

#pragma mark - 手势操作
// 点按隐藏/显示导航条
- (void)tapImage:(UITapGestureRecognizer *)gesture {
    self.navbar.hidden = !self.navbar.hidden;
}

// 长按时出现删除提示框
- (void)longPressImage:(UILongPressGestureRecognizer *)gesture {
    // 由于长按为连续手势，该方法会调用多次，所以这里需要判断其状态
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIAlertController *as = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [as addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil]];
        [as addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:as animated:YES completion:nil];
    }
}

// 捏合时缩放图片
- (void)pinchImage:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        // 捏合手势中scale属性记录着缩放比例
        self.imageview.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        // 手势结束后取消一切形变
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.imageview.transform = CGAffineTransformIdentity;
        }];
    }
}

// 旋转图片
- (void)rotateImage:(UIRotationGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        // 旋转手势中的rotation属性记录了旋转弧度
        self.imageview.transform = CGAffineTransformMakeRotation(gesture.rotation);
    }  else if (gesture.state == UIGestureRecognizerStateEnded) {
        // 手势结束后取消一切形变
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:0.8 animations:^{
            weakSelf.imageview.transform = CGAffineTransformIdentity;
        }];
    }
}

// 拖动图片
- (void)panImage:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        // 取得图片在当前控制器视图里的移动位置
        CGPoint translation = [gesture translationInView:self.view];
        self.imageview.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        __weak ViewController *weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.imageview.transform = CGAffineTransformIdentity;
        }];
    }
}

// 轻扫则查看下一张或上一张
- (void)swipeImage:(UISwipeGestureRecognizer *)gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self prevImage];
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        [self nextImage];
    }
}

@end
