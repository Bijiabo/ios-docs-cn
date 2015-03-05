//
//  Contact.h
//  ContactDemo
//
//  Created by xidanjueying on 15/1/8.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

#pragma mark -
#pragma mark 姓
@property NSString *firstName;

#pragma mark 名
@property NSString *lastName;

#pragma mark 电话号码
@property NSString *phoneNumber;


#pragma mark -
#pragma mark 初始化方法
- (Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

#pragma mark 获取姓名
- (NSString *)getName;

@end
