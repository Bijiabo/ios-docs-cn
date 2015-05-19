//
//  ViewController.m
//  xidanjueying
//
//  Created by xidanjueying on 15/3/4.
//  Copyright (c) 2015年 xidanjueying. All rights reserved.
//

#import "ViewController.h"
#import <TAETopSDK/TaeTopClient.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = @"http://gw.api.taobao.com/router/rest";
    
    // userdata 为上报到智能云的用户数据
    NSDictionary *attrinfo = @{
                               @"unit":@"kg",
                               @"data_collect_time":@1425343683,
                               @"data_upload_time":@1425343689,
                               @"value":@"71.6",
                               @"attribute":@"weight"
                               };
    NSDictionary *userdata = @{
                               @"device_model":@"DREAMMAKER_HEALTH_AIRPURIFIER_DM260S01_i",
                               @"vendor_user_id":@"38907410",
                               @"data_list":@[attrinfo]
                            };
    
    // 将userdata 转换为 json string
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:userdata
                                                       options:0
                                                         error:nil];
    NSString *jsonstr = [[NSString alloc] initWithData:jsondata
                                              encoding:NSUTF8StringEncoding];
    
    // 拼装系统参数和用户数据
    NSDictionary *params = @{
                             @"method": @"aliyun.alink.bind.user",
                             @"format": @"json",
                             @"vendor_uid": @"test"
                            };

    // 上报到智能云
    [TaeTopClient doRequest:params url:url onComplete:^(NSString *result) {
        NSLog(@"%@", result);
        // do something
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
