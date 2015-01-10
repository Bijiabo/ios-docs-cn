//
//  UserStatusTableViewCell.h
//  UserStatusDemo
//
//  Created by xidanjueying on 15/1/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserStatus.h"

@interface UserStatusTableViewCell : UITableViewCell

#pragma mark - 公开属性
@property (nonatomic) UserStatus *status;
@property CGFloat height; // 单元格高度

@end
