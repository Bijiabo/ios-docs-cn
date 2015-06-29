//
//  ViewController.m
//  UITableViewDemo
//
//  Created by xidanjueying on 15/1/4.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property NSArray *namelist;
@property NSArray *detaillist;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.namelist = @[@"张三", @"李四", @"王五", @"赵六", @"钱七"];
    self.detaillist = @[@"手机", @"住宅", @"手机", @"手机", @"住宅"];
    
    [self setNavBar];
    [self setTableView];
    [self setBottomToolbar];
}

- (void)setNavBar {
    UINavigationItem *navitem = [[UINavigationItem alloc] init];
    navitem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    navitem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    navitem.title = @"个人收藏";
    
    UINavigationBar *navbar = [[UINavigationBar alloc] init];
    navbar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
    navbar.items = @[navitem];
    
    [self.view addSubview:navbar];
}

- (void)setTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, SCREEN_HEIGHT - 135)];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    // 设置行高
    tableView.rowHeight = 50;
    
    [self.view addSubview:tableView];
}

- (void)setBottomToolbar {
    UITabBar *tabbar = [[UITabBar alloc] init];
    tabbar.frame = CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50);
    tabbar.items = @[
                      [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0],
                      [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:1],
                      [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2],
                      [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:3]
                      ];
    tabbar.barStyle = UIBarStyleDefault;
    tabbar.itemPositioning = UITabBarItemPositioningAutomatic;
    tabbar.selectedItem = tabbar.items[1];
    tabbar.selectedItem.badgeValue = @"1";
    
    [self.view addSubview:tabbar];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.namelist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.namelist[indexPath.row];
    cell.detailTextLabel.text = self.detaillist[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"select"];
    cell.imageView.layer.cornerRadius = 25;
    cell.imageView.layer.masksToBounds = YES;
    // 显示在cell最右边的按钮, accessoryType用于设置按钮类型，若accessoryView的属性不为nil，则accessoryType的值会被忽略
    // UITableViewCellAccessoryDisclosureIndicator -- 向右的箭头
    // UITableViewCellAccessoryCheckmark -- 对勾
    // UITableViewCellAccessoryDetailDisclosureButton -- "info"按钮 + 向右的箭头
    // UITableViewCellAccessoryDetailButton -- "info"按钮
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
