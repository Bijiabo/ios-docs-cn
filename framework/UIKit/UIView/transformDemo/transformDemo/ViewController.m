//
//  ViewController.m
//  transformDemo
//
//  Created by xidanjueying on 15/1/19.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIImageView *imageview;
@property UIView *buttonGroup;
@property UIButton *btnRotate; // 旋转按钮
@property UIButton *btnScale; // 缩放按钮
@property UIButton *btnTranslate; // 移动按钮
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImage];
    [self initButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initImage {
    NSURL *url = [NSURL URLWithString:@"http://i.mmcdn.cn/simba/img/TB1B7yqHXXXXXa0aXXXSutbFXXX.jpg"];
    UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
    float ratio = img.size.width / img.size.height;
    float imgWidth = self.view.bounds.size.width > img.size.width ? img.size.width : self.view.bounds.size.width;
    
    self.imageview = [[UIImageView alloc] initWithImage:img];
    self.imageview.frame = CGRectMake(0, 20, imgWidth, imgWidth / ratio);
    [self.view addSubview:self.imageview];
}

- (void)initButtons {
    float viewWidth = self.view.bounds.size.width;
    
    self.buttonGroup = [[UIView alloc] init];
    self.buttonGroup.frame = CGRectMake(0, self.view.bounds.size.height - 130, viewWidth, 130);
    [self.view addSubview:self.buttonGroup];
    [self.buttonGroup setBackgroundColor:[UIColor lightGrayColor]];
    
    // 旋转按钮
    self.btnRotate = [[UIButton alloc] init];
    self.btnRotate.frame = CGRectMake(0, 0, viewWidth, 50);
    [self.btnRotate setTitle:@"旋转" forState:UIControlStateNormal];
    [self.btnRotate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnRotate addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonGroup addSubview:self.btnRotate];
    
    // 缩放按钮
    self.btnScale = [[UIButton alloc] init];
    self.btnScale.frame = [self caleButtonFrame:self.btnRotate];
    [self.btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    [self.btnScale setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnScale addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonGroup addSubview:self.btnScale];
    
    // 移动按钮
    self.btnTranslate = [[UIButton alloc] init];
    self.btnTranslate.frame = [self caleButtonFrame:self.btnScale];
    [self.btnTranslate setTitle:@"移动" forState:UIControlStateNormal];
    [self.btnTranslate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnTranslate addTarget:self action:@selector(translate:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonGroup addSubview:self.btnTranslate];
}

- (void)rotate:(UIButton *)btn {
    [UIView animateWithDuration:0.5 animations:^{
        // M_PI_4 -- 四分之π
        self.imageview.transform = CGAffineTransformRotate(self.imageview.transform, M_PI_4);
    }];
}

- (void)scale:(UIButton *)btn {
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat scaleOffset = 0.9;
        self.imageview.transform = CGAffineTransformScale(self.imageview.transform, scaleOffset, scaleOffset);
    }];
}

- (void)translate:(UIButton *)btn {
    [UIView animateWithDuration:0.5 animations:^{
        self.imageview.transform = CGAffineTransformTranslate(self.imageview.transform, 0, 90);
    }];
}

- (CGRect)caleButtonFrame:(UIButton *)referButton {
    CGRect frame = referButton.frame;
    return CGRectMake(frame.origin.x, frame.origin.y + 40, frame.size.width, frame.size.height);
}

@end
