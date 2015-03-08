//
//  AppDelegate.m
//  UILocalNotificationDemo
//
//  Created by xidanjueying on 14/11/17.
//  Copyright (c) 2014年 xidanjueying. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIApplication *app = [UIApplication sharedApplication];
    
    if (app.currentUserNotificationSettings.types != UIUserNotificationTypeNone) { // 已获得发送通知的授权
        [self addLocalNotification];
    } else { // 请求授权，如果不请求授权，则在“设置”中是没有对应的“通知”设置项的
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
        [app registerUserNotificationSettings:settings];
    }
    
    return YES;
}

// 调用过registerUserNotificationSettings:方法后，会马上执行该方法
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    if (notificationSettings.types != UIUserNotificationTypeNone) {
        [self addLocalNotification];
    }
}

- (void)addLocalNotification {
    // 初始化本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    // 设置调用时间，10秒后触发通知
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    // 通知重复次数
    notification.repeatInterval = 1;
    // 设置通知内容
    notification.alertBody = @"有新特性，快去体验下吧~";
    // 锁屏后的滑动动作提示
    notification.alertAction = @"打开应用";
    // 点击通知打开应用时的启动图片
    notification.alertLaunchImage = @"Default";
    // 应用程序右上角的消息数量
    notification.applicationIconBadgeNumber = 1;
    // 收到通知时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 绑定到通知上的其他附加信息
    notification.userInfo = @{@"user":@"xidanjueying"};
    
    // 调用本地通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // 应用进入前台后更新消息数量
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
