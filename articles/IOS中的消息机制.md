# IOS中的消息机制

> 简介：IOS中消息机制分两类：本地通知 和 远程通知，两种通知在IOS中的表现一致，可以通过横幅或者弹出提醒两种形式告诉用户，并且点击通知会打开应用程序，但两者的实现原理却完全不同。

<br>

### 一. 本地通知

##### 1. 简介

它由本地应用触发，是基于时间行为的一种通知形式，如闹钟定时、待办事项提醒等。

##### 2. 创建一个本地通知的步骤

	1. 创建UILocalNotification
	2. 设置处理通知的时间
	3. 设置通知的内容
	4. 设置通知传递的自定义数据参数（可选）
	5. 调用通知，可按计划调度一个通知（scheduleLocalNotification:），或立即调用通知（presentLocalNotificationNow）
	
##### 3. 注意

* 本地通知由操作系统统一调度，只有在应用退出到后台或关闭后才能收到通知（对于远程通知也是如此）。

* 通知的声音由IOS系统播放，格式必须是Linear PCM、MA4（IMA/ADPCM）、µLaw、aLaw中的一种，并且播放时间必须在30s内，否则将被系统声音替换，同时自定义声音文件必须放到main boundle中。

* 本地通知的数量是有限制的，最近的本地通知最多只能有64个，超过这个数量将被系统忽略。

* 如果想要移除本地通知可以调用UIApplication的cancelLocalNotification:，或cancelAllLocalNotifications移除所有通知。

##### 4. demo

* [示例](../framework/UIKit/UILocalNotification/UILocalNotificationDemo)

<br>

### 二. 远程通知

##### 1. 简介

它由应用服务提供商发起，通过苹果的APNS（Apple Push Notification Server）发送到应用客户端，推送过程分为以下几步：

* 应用程序注册APNS

	* 只有注册过才有可能接收到消息
	* *.mobileprovision文件的APP ID必须使用指定的APP ID
	* 配置文件中需选择Push Notifications服务
	* 应用程序的Bundle Identifier必须和应用的APP ID一致

* IOS 从 APNS 接收到 device token，并在应用程序中获取 device token。

	* 必须真机调试，模拟器无法获取 device token
	
* IOS 应用将 device token 发送给应用程序提供商，告诉提供商当前设备允许接收消息。

	* device token的生成算法只有Apple掌握
	* 每次应用程序启动都重新获得device token


* 应用程序提供商在服务器端根据发送过来的 `device token`，组织信息发送给APNS。

* APNS根据消息中的 `device token` 查找已注册的设备，然后推送消息。
