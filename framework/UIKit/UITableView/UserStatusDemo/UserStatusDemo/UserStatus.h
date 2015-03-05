//
//  UserStatus.h
//  UserStatusDemo
//
//  Created by xidanjueying on 15/1/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserStatus : NSObject

#pragma mark - 公开属性
@property long long userId; // 用户id
@property NSString *avatar; // 头像
@property NSString *userName; // 用户名
@property NSString *userIcon; // 用户类型icon
@property NSString *publishTime; // 发微博的时间
@property (nonatomic) NSString *deviceName; // 发微博的设备名
@property NSString *content; // 微博内容

#pragma mark - 公开方法
- (UserStatus *)initWithDictionary:(NSDictionary *)dic; // 初始化方法

@end
