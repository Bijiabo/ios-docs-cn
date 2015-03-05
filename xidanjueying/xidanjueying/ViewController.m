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
    
    NSString *url = @"http://gw.api.tbsandbox.com/router/rest";
    //NSString *url = @"http://gw.api.taobao.com/router/rest";
    NSMutableDictionary *params=[[NSMutableDictionary alloc] init];
    
    [params setValue:@"aliyun.alink.devicedata.post" forKey:@"method"];
    [params setValue:@"json" forKey:@"format"];
    [params setValue:@"2.0" forKey:@"v"];
    [params setValue:@"888" forKey:@"value"];
    [params setValue:@"size" forKey:@"attribute"];

    [TaeTopClient doRequest:params url:url onComplete:^(NSString *result) {
        NSLog(@"TAE_TOP_LOG: %@", result);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
