//
//  ViewController.m
//  ContactDemo
//
//  Created by xidanjueying on 15/1/8.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "ContactGroup.h"

@interface ViewController ()

#pragma mark UITableView实例
@property UITableView *tableview;

#pragma mark 联系人数据集合
@property NSMutableArray *contacts;

#pragma mark 当前被选中的行
@property NSIndexPath *selectedIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContactData];
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
}

#pragma mark 初始化联系人数据
- (void)initContactData {
    self.contacts = [[NSMutableArray alloc] init];
    
    Contact *contact1 = [[Contact alloc] initWithFirstName:@"张" andLastName:@"三" andPhoneNumber:@"123"];
    Contact *contact2 = [[Contact alloc] initWithFirstName:@"李" andLastName:@"四" andPhoneNumber:@"456"];
    ContactGroup *group1 = [[ContactGroup alloc] initWithName:@"亲戚" andDetail:@"这里放亲戚的联系信息" andContacts:[NSMutableArray arrayWithObjects:contact1, contact2, nil]];
    [self.contacts addObject:group1];
    
    Contact *contact3 = [[Contact alloc] initWithFirstName:@"王" andLastName:@"五" andPhoneNumber:@"678"];
    Contact *contact4 = [[Contact alloc] initWithFirstName:@"赵" andLastName:@"六" andPhoneNumber:@"901"];
    Contact *contact5 = [[Contact alloc] initWithFirstName:@"钱" andLastName:@"七" andPhoneNumber:@"923"];
    ContactGroup *group2 = [[ContactGroup alloc] initWithName:@"朋友" andDetail:@"这里是朋友的联系信息" andContacts:[NSMutableArray arrayWithObjects:contact3, contact4, contact5, nil]];
    [self.contacts addObject:group2];
}

#pragma mark - table view 数据源方法
#pragma mark 分组数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contacts.count;
}

#pragma mark 每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ContactGroup *group = self.contacts[section];
    return group.contacts.count;
}

#pragma mark 表格右侧的标题索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    
    for (ContactGroup *group in self.contacts) {
        [indexs addObject:group.name];
    }
    
    return indexs;
}

#pragma mark 每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIndentifier = @"Cell";
    static NSString *reuseSwitchIndentifier = @"SwitchCell";
    BOOL isFirstSectionAndRow = indexPath.section == 0 && indexPath.row == 0;
    NSString *curReuseIndentifier = isFirstSectionAndRow ? reuseSwitchIndentifier : reuseIndentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:curReuseIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:curReuseIndentifier];
    }
    
    ContactGroup *group = self.contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    
    if (isFirstSectionAndRow) {
        cell.accessoryView = [[UISwitch alloc] init];
    } else {
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    
    return cell;
}

#pragma mark 分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ContactGroup *group = self.contacts[section];
    return group.name;
}

#pragma mark 分组脚注
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    ContactGroup *group = self.contacts[section];
    return group.detail;
}

#pragma mark - table view 代理方法
#pragma mark 设置分组标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

#pragma mark 设置分组脚注高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}

#pragma mark 设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    
    ContactGroup *group = self.contacts[indexPath.section];
    __block __weak ViewController *weakSelf = self;
    __block __weak Contact *contact = group.contacts[indexPath.row];
    __block __weak UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[contact getName] preferredStyle:UIAlertControllerStyleAlert];
    
    // 在弹出框中增加一个文本框，并显示当前联系人的号码
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.text = contact.phoneNumber;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *lastPhoneNumber = contact.phoneNumber;
        UITextField *textField = alert.textFields[0];
        
        // 当号码发生变更时，更新联系人数据并刷新表格
        if (![lastPhoneNumber isEqual:textField.text]) {
            contact.phoneNumber = textField.text;
            [weakSelf.tableview reloadRowsAtIndexPaths:@[weakSelf.selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
