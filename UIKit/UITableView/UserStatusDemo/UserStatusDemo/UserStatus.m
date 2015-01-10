//
//  UserStatus.m
//  UserStatusDemo
//
//  Created by xidanjueying on 15/1/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "UserStatus.h"

@implementation UserStatus

- (UserStatus *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    self.userId = [dic[@"userId"] longLongValue];
    self.avatar = dic[@"avatar"];
    self.userName = dic[@"userName"];
    self.userIcon = dic[@"userIcon"];
    self.publishTime = dic[@"publishTime"];
    self.deviceName = [self formatDeviceName:dic[@"deviceName"]];
    self.content = dic[@"content"];
    
    return self;
}

- (NSString *)formatDeviceName:(NSString *)deviceName {
    return [NSString stringWithFormat:@"来自 %@", deviceName];
}

@end
