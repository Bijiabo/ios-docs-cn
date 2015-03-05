//
//  Contact.m
//  ContactDemo
//
//  Created by xidanjueying on 15/1/8.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (Contact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    self = [super init];
    
    self.firstName = firstName;
    self.lastName = lastName;
    self.phoneNumber = phoneNumber;
    
    return self;
}

- (NSString *)getName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
