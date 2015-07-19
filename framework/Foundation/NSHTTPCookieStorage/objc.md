# NSHTTPCookieStorage

简介：NSHTTPCookieStorage实现了一个单例对象(共享实例)来管理存储的cookie。每个cookie由NSHTTPCookie类的一个实例来表示。一般来说，cookie在所有应用程序之间共享和跨进程边界保持同步。会话cookie(cookie对象的isSessionOnly方法返回YES)是一个本地进程，不是共享的。

注意：

* cookie不会在iOS应用程序之间共享。
* 更改cookie的接受策略，会影响所有使用cookie存储的活动应用。