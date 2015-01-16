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

#define STATUSBAR_HEIGHT 20
#define TOP_TOOLBAR_HEIGHT 44
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property UITableView *tableview;
@property NSMutableArray *contactGroups;
@property NSMutableArray *searchContacts;
@property NSIndexPath *selectedIndexPath;
@property BOOL isDeleteContact;
@property BOOL isSearching;
@property UISearchBar *searchbar;

@end

@implementation ViewController

#pragma mark - ViewController 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContactData];
    [self initToolbar];
    [self initTableView];
    [self initSearchbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 私有方法
// 初始化联系人数据
- (void)initContactData {
    self.contactGroups = [NSMutableArray array];
    
    Contact *contact1 = [[Contact alloc] initWithFirstName:@"张" andLastName:@"三" andPhoneNumber:@"123"];
    Contact *contact2 = [[Contact alloc] initWithFirstName:@"李" andLastName:@"四" andPhoneNumber:@"456"];
    ContactGroup *group1 = [[ContactGroup alloc] initWithName:@"亲戚" andDetail:@"这里放亲戚的联系信息" andContacts:[NSMutableArray arrayWithObjects:contact1, contact2, nil]];
    [self.contactGroups addObject:group1];
    
    Contact *contact3 = [[Contact alloc] initWithFirstName:@"王" andLastName:@"五" andPhoneNumber:@"678"];
    Contact *contact4 = [[Contact alloc] initWithFirstName:@"赵" andLastName:@"六" andPhoneNumber:@"901"];
    Contact *contact5 = [[Contact alloc] initWithFirstName:@"钱" andLastName:@"七" andPhoneNumber:@"923"];
    ContactGroup *group2 = [[ContactGroup alloc] initWithName:@"朋友" andDetail:@"这里是朋友的联系信息" andContacts:[NSMutableArray arrayWithObjects:contact3, contact4, contact5, nil]];
    [self.contactGroups addObject:group2];
}

// 初始化表格
- (void)initTableView {
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT + TOP_TOOLBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUSBAR_HEIGHT - TOP_TOOLBAR_HEIGHT) style:UITableViewStyleGrouped];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
}

// 添加工具栏
- (void)initToolbar {
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, TOP_TOOLBAR_HEIGHT)];
    
    UIBarButtonItem *delBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeContact)];
    UIBarButtonItem *spaceBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];
    toolbar.items = @[delBtn, spaceBtn, addBtn];
    
    [self.view addSubview:toolbar];
}

- (void)initSearchbar {
    self.searchContacts = [NSMutableArray array];
    self.searchbar = [[UISearchBar alloc] init];
    self.searchbar.delegate = self;
    self.searchbar.placeholder = @"请输入关键字搜索";
    self.searchbar.showsCancelButton = YES;
    [self.searchbar sizeToFit];
    self.tableview.tableHeaderView = self.searchbar;
}

// 删除联系人
- (void)removeContact {
    self.isDeleteContact = YES;
    [self.tableview setEditing:!self.tableview.editing animated:YES];
}

// 添加联系人
- (void)addContact {
    self.isDeleteContact = NO;
    [self.tableview setEditing:!self.tableview.editing animated:YES];
}

// 根据搜索关键字生成搜索结果数据
- (void)generateSearchDataByKeyword:(NSString *)keyword {
    self.isSearching = YES;
    
    for (ContactGroup *group in self.contactGroups) {
        for (Contact *contact in group.contacts) {
            if (![self.searchContacts containsObject:contact] && [self isContactMatchingKeyword:contact keyword:keyword]) {
                [self.searchContacts addObject:contact];
            }
        }
    }
    
    [self.tableview reloadData];
}

// 判断当前contact是否包含目标关键字
- (BOOL)isContactMatchingKeyword:(Contact *)contact keyword:(NSString *)keyword {
    NSString *kw = keyword.uppercaseString;
    return [contact.firstName.uppercaseString containsString:kw] || [contact.lastName.uppercaseString containsString:kw] || [contact.phoneNumber.uppercaseString containsString:kw];
}

#pragma mark - table view 数据源方法
// 分组数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isSearching) {
        return 1;
    } else {
        return self.contactGroups.count;
    }
}

// 每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isSearching) {
        return self.searchContacts.count;
    } else {
        ContactGroup *group = self.contactGroups[section];
        return group.contacts.count;
    }
}

// 表格右侧的标题索引
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    NSMutableArray *indexs = [[NSMutableArray alloc] init];
//    
//    for (ContactGroup *group in self.contacts) {
//        [indexs addObject:group.name];
//    }
//    
//    return indexs;
//}

// 每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *curContact;
    static NSString *reuseIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIndentifier];
    }
    
    if (self.isSearching) {
        curContact = self.searchContacts[indexPath.row];
    } else {
        ContactGroup *group = self.contactGroups[indexPath.section];
        curContact = group.contacts[indexPath.row];
    }
    
    cell.textLabel.text = [curContact getName];
    cell.detailTextLabel.text = curContact.phoneNumber;
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    return cell;
}

// 分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.isSearching) {
        return @"搜索结果";
    } else {
        ContactGroup *group = self.contactGroups[section];
        return group.name;
    }
}

// 分组脚注
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (self.isSearching) {
        return @"";
    } else {
        ContactGroup *group = self.contactGroups[section];
        return group.detail;
    }
}

#pragma mark - table view 代理方法
// 设置分组标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

// 设置分组脚注高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}

// 设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

// 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    
    ContactGroup *group = self.contactGroups[indexPath.section];
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

// 取得当前操作状态
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.isDeleteContact ? UITableViewCellEditingStyleDelete : UITableViewCellEditingStyleInsert;
}

// 实现了此方法，向左滑时就会显示删除或添加图标
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactGroup *group = self.contactGroups[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [group.contacts removeObject:contact];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        if (group.contacts.count == 0) {
            [self.contactGroups removeObject:group];
            [tableView reloadData];
        }
    } else {
        Contact *newcontact = [[Contact alloc] init];
        newcontact.firstName = @"周";
        newcontact.lastName = @"八";
        newcontact.phoneNumber = @"3456789";
        [group.contacts insertObject:newcontact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

// 只要实现了该方法，当tableview处于编辑状态时，就可以进行排序
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    ContactGroup *sourceGroup = self.contactGroups[sourceIndexPath.section];
    Contact *sourceContact = sourceGroup.contacts[sourceIndexPath.row];
    
    ContactGroup *destGroup = self.contactGroups[destinationIndexPath.section];
    
    [sourceGroup.contacts removeObject:sourceContact];
    if (sourceGroup.contacts.count == 0) {
        [self.contactGroups removeObject:sourceGroup];
        [tableView reloadData];
    }
    
    [destGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
}

#pragma mark - searchbar代理方法
// 取消搜索
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.isSearching = NO;
    self.searchbar.text = @"";
    [self.searchContacts removeAllObjects];
    [self.tableview reloadData];
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self generateSearchDataByKeyword:searchBar.text];
    [searchBar resignFirstResponder];
}

// 输入搜索关键字
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchBar.text isEqual:@""]) {
        self.isSearching = NO;
        [self.tableview reloadData];
    } else {
        [self generateSearchDataByKeyword:searchText];
    }
}

@end
