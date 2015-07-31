# NSRunLoop

简介：`NSRunLoop`类为管理输入源的对象声明了编程接口。一个`NSRunLoop`对象会处理输入源，像来自窗口系统的鼠标和键盘事件、NSPort对象、NSConnection对象、NSTimer事件。

备注：你的应用程序不能创建或显示地管理`NSRunLoop`对象，每个NSThread对象，包括应用的主线程，会在需要时自动创建一个`NSRunLoop`对象。你可以通过`NSRunLoop`的类方法：`currentRunLoop`访问当前线程的运行循环。

警告：`NSRunLoop`一般被认为是非线程安全的，其方法应该只在当前线程的上下文中被调用，如果尝试在另一个不同的线程中调用其方法，可能会导致意想不到的结果。