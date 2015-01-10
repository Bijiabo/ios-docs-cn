//
//  UserStatusTableViewCell.m
//  UserStatusDemo
//
//  Created by xidanjueying on 15/1/9.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "UserStatusTableViewCell.h"

#define US_RGB_COLOR(r,g,b) [UIColor colorWithHue:r/255 saturation:g/255 brightness:b/255 alpha:1]
#define US_CONTROL_SPACE 10 // 控件间距
#define US_CELL_BGCOLOR US_RGB_COLOR(251, 251, 251) // 单元格背景色
#define US_GRAY_COLOR US_RGB_COLOR(50, 50, 50)
#define US_LIGHT_GRAY_COLOR US_RGB_COLOR(120, 120, 120)
#define US_AVATAR_SIZE 64 // 头像尺寸
#define US_USER_ICON_SIZE 16 // 会员icon尺寸
#define US_USERNAME_FONTSIZE 14
#define US_PUBLISH_TIME_FONTSIZE 12
#define US_DEVICE_NAME_FONTSIZE 12
#define US_CONTENT_FONTSIZE 14

@interface UserStatusTableViewCell()

#pragma mark - 私有属性
@property UIImageView *avatar; // 头像
@property UIImageView *userIcon; // 会员icon
@property UILabel *userName; // 用户名
@property UILabel *publishTime; // 发布时间
@property UILabel *deviceName; // 发表微博的设备
@property UILabel *content; // 微博内容

@end

@implementation UserStatusTableViewCell

#pragma mark 初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self initSubView];
    return self;
}

#pragma mark 初始化视图
- (void)initSubView {
    // 头像
    self.avatar = [[UIImageView alloc] init];
    [self addSubview:self.avatar];
    
    // 用户名
    self.userName = [[UILabel alloc] init];
    self.userName.textColor = US_GRAY_COLOR;
    self.userName.font = [UIFont systemFontOfSize:US_USERNAME_FONTSIZE];
    [self addSubview:self.userName];
    
    // 会员图标
    self.userIcon = [[UIImageView alloc] init];
    [self addSubview:self.userIcon];
    
    // 发布时间
    self.publishTime = [[UILabel alloc] init];
    self.publishTime.textColor = US_LIGHT_GRAY_COLOR;
    self.publishTime.font = [UIFont systemFontOfSize:US_PUBLISH_TIME_FONTSIZE];
    [self addSubview:self.publishTime];
    
    // 设备名
    self.deviceName = [[UILabel alloc] init];
    self.deviceName.textColor = US_LIGHT_GRAY_COLOR;
    self.deviceName.font = [UIFont systemFontOfSize:US_DEVICE_NAME_FONTSIZE];
    [self addSubview:self.deviceName];
    
    // 微博内容
    self.content = [[UILabel alloc] init];
    self.content.textColor = US_GRAY_COLOR;
    self.content.font = [UIFont systemFontOfSize:US_CONTENT_FONTSIZE];
    self.content.numberOfLines = 0;
    [self addSubview:self.content];
}

- (void)setStatus:(UserStatus *)status {
    // 设置头像大小和位置
    self.avatar.frame = CGRectMake(US_CONTROL_SPACE, US_CONTROL_SPACE / 2, US_AVATAR_SIZE, US_AVATAR_SIZE);
    self.avatar.image = [UIImage imageNamed:status.avatar];
    
    // 设置用户名大小和位置
    CGSize userNameSize = [self getTextSize:status.userName fontSize:US_USERNAME_FONTSIZE isSingleLine:YES];
    self.userName.frame = CGRectMake([self getCGRectX:self.avatar], US_CONTROL_SPACE, userNameSize.width, userNameSize.height);
    self.userName.text = status.userName;
    
    // 设置会员icon大小及位置
    self.userIcon.frame = CGRectMake([self getCGRectX:self.userName], US_CONTROL_SPACE, US_USER_ICON_SIZE, US_USER_ICON_SIZE);
    self.userIcon.image = [UIImage imageNamed:status.userIcon];
    
    // 设置发布时间的大小及位置
    CGSize publishTimeSize = [self getTextSize:status.publishTime fontSize:US_PUBLISH_TIME_FONTSIZE isSingleLine:YES];
    self.publishTime.frame = CGRectMake(self.userName.frame.origin.x, [self getCGRectY:self.userName], publishTimeSize.width, publishTimeSize.height);
    self.publishTime.text = status.publishTime;
    
    // 设置设备信息的大小及位置
    CGSize deviceNameSize = [self getTextSize:status.deviceName fontSize:US_DEVICE_NAME_FONTSIZE isSingleLine:YES];
    self.deviceName.frame = CGRectMake([self getCGRectX:self.publishTime], self.publishTime.frame.origin.y, deviceNameSize.width, deviceNameSize.height);
    self.deviceName.text = status.deviceName;
    
    // 设置微博内容的大小及位置
    CGSize contentSize = [self getTextSize:status.content fontSize:US_CONTENT_FONTSIZE isSingleLine:NO];
    self.content.frame = CGRectMake(US_CONTROL_SPACE, [self getCGRectY:self.avatar], contentSize.width, contentSize.height);
    self.content.text = status.content;
    
    // 计算单元格的高度
    self.height = [self getCGRectY:self.content];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (float)getCGRectX:(UIView *)refer {
    return refer.frame.origin.x + refer.frame.size.width + US_CONTROL_SPACE;
}

- (float)getCGRectY:(UIView *)refer {
    return refer.frame.origin.y + refer.frame.size.height + US_CONTROL_SPACE;
}

// 获取文本内容占用的空间大小
- (CGSize)getTextSize:(NSString *)text fontSize:(float)size isSingleLine:(BOOL)isSingleLine {
    if (isSingleLine) {
        return [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    } else {
        CGFloat textWidth = self.frame.size.width - US_CONTROL_SPACE * 2;
        return [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil].size;
    }
}

@end
