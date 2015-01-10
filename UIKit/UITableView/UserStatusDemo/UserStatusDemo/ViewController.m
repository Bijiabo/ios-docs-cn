//
//  ViewController.m
//  UserStatusDemo
//
//  Created by xidanjueying on 15/1/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "UserStatus.h"
#import "UserStatusTableViewCell.h"

@interface ViewController ()

@property UITableView *tableview;
@property NSMutableArray *status;
@property NSMutableArray *cellCache;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initStatusData];
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
}

#pragma mark 初始化状态数据
- (void)initStatusData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"status" ofType:@"plist"];
    NSArray *statusData = [NSArray arrayWithContentsOfFile:path];
    
    self.status = [[NSMutableArray alloc] init];
    self.cellCache = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in statusData) {
        [self.status addObject:[[UserStatus alloc] initWithDictionary:dict]];
        [self.cellCache addObject:[[UserStatusTableViewCell alloc] init]];
    }
}

#pragma mark - UITableView 数据源方法
#pragma mark 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.status.count;
}

#pragma mark 返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIndentifier = @"Cell";
    UserStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if (cell == nil) {
        cell = [[UserStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    }
    
    cell.status = self.status[indexPath.row];
    [self.cellCache replaceObjectAtIndex:indexPath.row withObject:cell];
    
    return cell;
}

#pragma mark - UITableView 代理方法
#pragma mark 设置单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserStatusTableViewCell *cell = self.cellCache[indexPath.row];
    return cell.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
