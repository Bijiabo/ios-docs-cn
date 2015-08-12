# ios-dev-resources

<br>

## 一. 编程语言

* [Objective-C](oc.md)
* Swift

<br>

## 二. 官方框架

* UI框架

	* [UIKit](./framework/UIKit)

* 数据处理

	* [Foundation](./framework/Foundation)

* 蓝牙框架

	* GameKit
	* MultipeerConnectivity
	* CoreBluetooth

* 社交分享

	* [Social](http://www.cnblogs.com/kenshincui/p/4220402.html#social)

* Assets Library

	* [AssetsLibrary](https://developer.apple.com/library/ios/documentation/AssetsLibrary/Reference/AssetsLibraryFramework/index.html)
	* [Photos](https://developer.apple.com/library/ios/documentation/Photos/Reference/Photos_Framework/index.html#//apple_ref/doc/uid/TP40014408) 【IOS8开始可用】

* 通讯录

	* [AddressBook](http://www.cnblogs.com/kenshincui/p/4220402.html#contact)

* 地理定位

	* CoreLocation

* 地图

	* MapKit

<br>

## 三. 常用的第三方库

* [MBProgressHUD](https://github.com/jdg/MBProgressHUD) -- 进度指示器（如常见的“加载中...”）
* [AFNetworking](https://github.com/AFNetworking/AFNetworking) -- 处理网络请求
* [SDWebImage](https://github.com/rs/SDWebImage) -- 支持缓存的图片延迟加载
* [ISHPermissionKit](https://github.com/iosphere/ISHPermissionKit) -- 以统一的方式请求用户授权
* [TBXML](https://github.com/71squared/TBXML) -- XML解析
* [ZBarSDK](https://github.com/bmorton/ZBarSDK) -- 二维码扫描
* [ObjQREncoder](https://github.com/jverkoey/ObjQREncoder) -- 二维码生成
* [KINWebBrowser](https://github.com/dfmuir/KINWebBrowser) -- 同时兼容WKWebView和UIWebView
* [MMDrawerController](https://github.com/mutualmobile/MMDrawerController) -- 侧边抽屉导航
* [Reachability](https://github.com/tonymillion/Reachability) -- 检测iOS设备网络环境的库（目标网络是否可用、网络的连接方式及连接方式的变更）
* [PushSharp](https://github.com/Redth/PushSharp) -- 用来给APNS发送消息的库
* [Masonry](https://github.com/Masonry/Masonry) -- 自动布局
* [MJRefresh](https://github.com/CoderMJLee/MJRefresh) -- 下拉上拉刷新
* [SWTableViewCell](https://github.com/CEWendel/SWTableViewCell) -- UITableViewCell侧滑按钮
* [PromiseKit](https://github.com/mxcl/PromiseKit) -- Promise的iOS版本
* [FormatterKit](https://github.com/mattt/FormatterKit) -- 强大的格式化工具包
* [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) -- Mac 和 iOS 的一款强大的日志框架（原生支持XcodeColors插件）
* [100个优秀IOS开源项目](http://www.jianshu.com/p/769ce426b5db)
* [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) -- 函数响应式编程框架
* [PonyDebugger](https://github.com/square/PonyDebugger) -- 类似浏览器控制台的调试工具
* [PonyDebugger使用详细说明](http://shiningio.com/2014/03/20/debug-ios-app-with-pony-debugger/)
* [Mantle](https://github.com/Mantle/Mantle) -- 数据模型框架（字典与类互转）
* [JSONModel](https://github.com/icanzilb/JSONModel) -- 数据模型框架（字典与类互转）
* [MJExtension](https://github.com/CoderMJLee/MJExtension) -- 数据模型框架（字典与类互转）
* [GrowingTextView](https://github.com/HansPinckaers/GrowingTextView) -- 自适应内容高度的textview
* [FMDB](https://github.com/ccgus/fmdb) -- 对SQLite的包装，让使用SQLite更方便
	* [FMDB官方使用文档中文版](http://www.cocoachina.com/industry/20130819/6821.html)
* [MagicalRecord](https://github.com/magicalpanda/MagicalRecord) -- 让使用Cora Data更方便
* [RegexKitLite](https://github.com/wezm/RegexKitLite) -- 正则表达式库
* [iOS图表库集合](https://github.com/sxyx2008/awesome-ios-chart)
* [SIAlertView](https://github.com/Sumi-Interactive/SIAlertView) -- 可自定义的对话框库
* [Aspects](https://github.com/steipete/Aspects) -- AOP编程库
* [WebViewJavascriptBridge](https://github.com/marcuswestin/WebViewJavascriptBridge) -- JSBridge库

<br>

## 四. 参考资料

* App构建&发布相关
	* [App store最新审核标准(2015.3)](https://github.com/leecade/ios-dev-flow/blob/master/Appstore%E6%9C%80%E6%96%B0%E5%AE%A1%E6%A0%B8%E6%A0%87%E5%87%86_2015-3.md)
	* [Xcode APP 打包以及提交apple审核详细流程](http://blog.csdn.net/mad1989/article/details/8167529)
	* [Xcode应用程序构建阶段（Build Phases）分析（1）](http://www.entlib.net/?p=1645)
	* [Xcode应用程序构建阶段（Build Phases）分析（2）](http://www.entlib.net/?p=1654)
	* [iOS代码签名探析](http://objccn.io/issue-17-2/)
	* [iOS代码签名](http://www.cocoachina.com/ios/20141017/9949.html)
	* [苹果开发者账号那些事儿（一）账号类型](http://ryantang.me/blog/2013/08/28/apple-account-1/)
	* [苹果开发者账号那些事儿（二）证书](http://ryantang.me/blog/2013/09/03/apple-account-2/)
	* [苹果开发者账号那些事儿（三）配置文件](http://ryantang.me/blog/2013/11/28/apple-account-3/)
* storyboard & nib
	* [iOS开发之xib技巧介绍](http://www.cocoachina.com/industry/20140529/8603.html)
	* [结队开发之多storyboard](http://www.cocoachina.com/industry/20140530/8620.html)
	* [storyboard使用简介](http://www.cocoachina.com/industry/20131213/7537.html)
	* [手写UI & xib & storyboard](http://www.cocoachina.com/industry/20140102/7640.html)
* 静态库
	* [IOS基础 -- 静态库](http://www.cnblogs.com/monicaios/p/3539920.html)
	* [iOS生成静态库方法-iOS集成静态库-iOS合并静态库](http://blog.sina.com.cn/s/blog_7b9d64af0101jlym.html)
	* [在iOS中创建静态库](http://www.cocoachina.com/industry/20131204/7468.html)
	* [使用CocoaPods开发并打包静态库](http://www.itjhwd.com/cocoapods-kajbk/)
* 状态栏
	* [如何隐藏状态栏](http://blog.csdn.net/hitwhylz/article/details/38614497)
	* [IOS7状态栏StatusBar官方标准适配方法](http://blog.csdn.net/rhljiayou/article/details/12029927)
* cocoa相关
	* [深入浅出Cocoa](http://blog.csdn.net/column/details/cocoa.html)
	* [Coding Guidelines for Cocoa](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html)
* 消息通信相关
	* [几种通信方式的区别](http://www.objc.io/issues/7-foundation/communication-patterns/)
	* [ReactiveCocoa指南一：信号](http://southpeak.github.io/blog/2014/08/02/reactivecocoazhi-nan-%5B%3F%5D-:xin-hao/)
	* [ReactiveCocoa2实战](http://www.cocoachina.com/industry/20140609/8737.html)
* 数据持久化
	* [如何使用NSCoding和NSFileManager来保存你的应用程序数据](http://www.cnblogs.com/andyque/archive/2011/09/13/2164469.html)
	* [NSCoding / NSKeyed​Archiver](http://nshipster.cn/nscoding/)
	* [iOS中常用的四种数据持久化方法简介](http://www.cocoachina.com/industry/20130328/5908.html)
	* [iOS中几种数据持久化方案](http://www.jianshu.com/p/7616cbd72845)
* 集合类
	* [基础集合类](http://www.cocoachina.com/ios/20140122/7735.html)
	* [iOS中集合遍历方法的比较和技巧](http://www.cocoachina.com/industry/20140531/8630.html)
* 设计模式
	* [MVVM 介绍](http://objccn.io/issue-13-1/)
	* [iOS的基本的设计模式](http://blog.csdn.net/totogo2010/article/details/8028180)
	* [Method Swizzling和AOP实践](http://tech.glowing.com/cn/method-swizzling-aop/)
* 如何实现手势密码
	* [文章一](http://blog.csdn.net/skylin19840101/article/details/38729757)
	* [文章二](http://blog.csdn.net/becomedragonlong/article/details/43704017)
* 第三方资料库
	* [https://github.com/vsouza/awesome-ios](https://github.com/vsouza/awesome-ios)
	* [开源项目汇总](https://github.com/Tim9Liu9/TimLiu-iOS)
* [UIView与CALayer的区别](http://blog.csdn.net/weiwangchao_/article/details/7771538)
* [自动布局教程(1) 中文版](http://www.cocoachina.com/industry/20131203/7462.html)
* [iOS开发上手教程（官方中文版）](https://developer.apple.com/LIBRARY/ios/referencelibrary/GettingStarted/RoadMapiOSCh/FirstTutorial.html#//apple_ref/doc/uid/TP40012668-CH3-SW1)
* [初探 iOS8 中的 Size Class](http://blog.csdn.net/pleasecallmewhy/article/details/39295327)
* [iOS8中LaunchImage和LaunchScreen的完美结合](http://www.simpleapples.com/2014/10/launchsreen-and-launchimage/)
* [iOS基础 -- 内存分析](http://www.cnblogs.com/monicaios/p/3541095.html)
* [Prefix.pch文件详解](http://blog.csdn.net/duxinfeng2010/article/details/8287550)
* [Apple移动设备处理器指令集 armv6、armv7、armv7s及arm64](http://www.cocoachina.com/ios/20140915/9620.html)
* [堆和栈的区别](http://blog.csdn.net/hairetz/article/details/4141043)
* [Core Animation编程指南](http://www.cocoachina.com/bbs/read.php?tid=84461)
* [多线程编程指南](http://www.cocoachina.com/bbs/read.php?tid=87592)
* [关于viewWithTag的一点说明](http://blog.csdn.net/smking/article/details/8590547)
* [判断是否有权限访问相机、相册、定位](http://blog.csdn.net/cafei111/article/details/25793145)
* [push vc时如何隐藏tabbar之hidesBottomBarWhenPushed的使用](http://www.isaced.com/post-223.html)
* [解决[UIColor colorWithRed: green: blue: alpha:] 失效问题](http://blog.csdn.net/chaoyuan899/article/details/27321235)
* [UIImagePickerController选择图片发送后旋转90度的问题](http://blog.csdn.net/mideveloper/article/details/44101267)
* [iOS UITableViewCell的重用机制分析](http://blog.csdn.net/omegayy/article/details/7356823)
* [iOS如何实现表格的折叠效果?](http://blog.csdn.net/youcanping2008/article/details/9202167)
* [如何解决sizeWithAttributes获取的字符串尺寸偏小的问题](http://stackoverflow.com/questions/18897896/replacement-for-deprecated-sizewithfont-in-ios-7)
* [在iOS开发中调用icon font字体的代码](http://www.weste.net/2013/12-13/94694.html)
* [iOS应用程序生命周期详解](http://blog.csdn.net/totogo2010/article/details/8048652)
* [iOS内存警告分级](http://www.cnblogs.com/smileEvday/archive/2012/03/07/MemoryWarning.html)
* [iOS如何在应用中唤起系统设置界面（仅支持8.0+）](http://itony.me/875.html)
* [iOS如何在应用中跳转到系统蓝牙设置界面](http://5828666.blog.51cto.com/5818666/1600185)
* [iOS照片多选](http://www.iphonetrain.com/blog_info/68.html)
* [应用进入后台后再回到前台，动画会消失的原因及其解决办法](http://www.cnblogs.com/YouXianMing/p/3670846.html)
* [如何正确移除CALayer的sublayers](http://stackoverflow.com/questions/2067578/removing-all-calayers-sublayers)
* [使用Base64编解码NSData和NSString对象](http://itony.me/488.html)
* [如何实现导航控制器全屏滑动返回效果](http://www.cocoachina.com/ios/20150811/12897.html)

<br>

## 五. 测试

* [OCUnit+xctool进行单元测试](http://blog.csdn.net/sqc3375177/article/details/40857313)
* [测试框架](http://www.infoq.com/cn/articles/build-ios-continuous-integration-platform-part2)

<br>

## 六. 工具

* [生成appstore审核截图](https://appscreens.io/yK7cLuBNij)
* [cocoa controls](https://www.cocoacontrols.com/) -- 可以收集你的组件被哪用于哪些应用

<br>

## 七. 人脸 & 语音识别

* [云端人脸识别API](https://rekognition.com/)
* [讯飞开放平台](http://www.xfyun.cn/)
* [微信语音SDK(iOS 版)上手指南](http://pr.weixin.qq.com/voice/sdkios)
* [语音识别](http://blog.csdn.net/shenjx1225/article/details/18549409)
* [Google，微软，科大讯飞的语音识别引擎对比](http://blog.csdn.net/yylsheng/article/details/8364487)
