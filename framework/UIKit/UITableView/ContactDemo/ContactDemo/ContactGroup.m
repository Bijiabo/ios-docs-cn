//
//  ContactGroup.m
//  ContactDemo
//
//  Created by xidanjueying on 15/1/8.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ContactGroup.h"

@implementation ContactGroup

- (ContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts {
    self = [super init];
    
    self.name = name;
    self.detail = detail;
    self.contacts = contacts;
    
    return self;
}

@end
