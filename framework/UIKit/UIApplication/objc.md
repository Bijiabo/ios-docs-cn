# UIApplication

**简介**

它为运行在iOS上应用程序提供了一个集中控制和协调的点。每个应用程序只能有一个`UIApplication`或`UIApplication`子类的实例。当应用程序启动时，UIApplicationMain函数被调用，该函数创建一个`UIApplication`的单例对象，此后你可以通过调用`sharedApplication`类方法访问该对象。


`UIApplication`的主要作用是处理初始路由的用户事件，它还将来自控件对象的动作消息转发给适当的目标对象。此外，`UIApplication`对象还维护所有窗口中打开的应用程序列表，所以通过这个列表可以检索任何一个应用程序的UIView对象。应用程序通常分配一个代理，应用程序通过这个代理来通知重要的运行时事件，如应用启动、内存不足等。


`UIApplication`的编程接口允许你管理设备的特定行为，使用它你可以做到：

* 控制应用程序响应界面方向的变化
* 暂时中止传入的触摸事件
* 切换用户人脸接近感应的开关
* 注册远程通知
* 触发撤消、重做UI
* 确定一个已安装的应用程序能否打开一个URL
* 扩展应用程序的执行，让其可以在后台完成一个任务
* 计划和取消本地通知
* 协调远程控制事件的接收
* 执行应用级别的状态恢复任务


**注意**

* 仅在你需要实现一个自定义事件或动作调度机制时，才需要子类化`UIApplication`。在这种情况下，你需要覆盖`sendEvent:` 或`sendAction:to:from:forEvent:`方法来实现机制。不过这种情况是非常罕见的，应该尽可能避免。

<br>

***

<br>

### 参考资料

* [iOS应用程序生命周期详解](http://blog.csdn.net/totogo2010/article/details/8048652)