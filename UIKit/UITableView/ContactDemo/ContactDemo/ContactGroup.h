//
//  ContactGroup.h
//  ContactDemo
//
//  Created by xidanjueying on 15/1/8.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactGroup : NSObject

#pragma mark -
#pragma mark 组名
@property NSString *name;

#pragma mark 分组描述
@property NSString *detail;

#pragma mark 分组包含的联系人
@property NSMutableArray *contacts;

#pragma mark -
#pragma mark 初始化方法
- (ContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;
@end
