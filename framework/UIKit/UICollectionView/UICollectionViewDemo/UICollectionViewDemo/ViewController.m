//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by xidanjueying on 15/5/24.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

#define NUMBER_PER_ROW 4

@interface ViewController ()

@property (nonatomic) NSArray *images;

@end

@implementation ViewController

#pragma mark -- 属性get方法 --

- (NSArray *)images {
    if (!_images) {
        _images = @[@"laiwang_session",
                    @"laiwang_timeline",
                    @"sina_weibo",
                    @"weixin_session",
                    @"weixin_timeline"];
    }
    
    return _images;
}

#pragma mark -- ViewController生命周期方法 --

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float itemSize = 61;
    float sectionInsetV = 20;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemSize, itemSize);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(sectionInsetV, sectionInsetV, sectionInsetV, sectionInsetV);
    
    float navbarHeight = 20;
    CGSize viewSize = self.view.frame.size;
    CGRect frame = CGRectMake(0, navbarHeight, viewSize.width, viewSize.height - navbarHeight);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame
                                                          collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- 数据源方法 --

// 设置行数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.images.count;
}

// 设置每行显示多少个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return NUMBER_PER_ROW;
}

// 设置单元格的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger index = indexPath.section * NUMBER_PER_ROW + indexPath.item;
    
    if (self.images.count > index) {
        UIImageView *imageView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:self.images[index]];
        
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        imageView.image = image;
        [cell.contentView addSubview:imageView];
    }
    
    return cell;
    
}

@end
