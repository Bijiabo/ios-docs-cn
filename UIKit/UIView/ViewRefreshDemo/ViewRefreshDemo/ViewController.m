//
//  ViewController.m
//  ViewRefreshDemo
//
//  Created by xidanjueying on 15/1/30.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property NSArray *fontSizes;
@property CustomView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContentView];
    [self addPickerView];
}

- (void)initContentView {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    self.fontSizes = @[@12, @14, @16, @18, @20, @22, @24, @28, @32];
    self.contentView = [[CustomView alloc] initWithFrame:CGRectMake(0, 20, size.width, size.height / 3)];
    self.contentView.title = @"Hello World";
    self.contentView.fontSize = [self.fontSizes[0] intValue];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentView];
}

- (void)addPickerView {
    CGRect frame = self.contentView.frame;
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width, frame.size.height)];
    picker.dataSource = self;
    picker.delegate = self;
    
    [self.view addSubview:picker];
}

#pragma mark - UIPickerView 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.fontSizes.count;
}

#pragma mark - UIPickerView 代理方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%@号字体", self.fontSizes[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.contentView.fontSize = [self.fontSizes[row] intValue];
    [self.contentView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
