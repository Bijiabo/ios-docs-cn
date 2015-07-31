# NSOperation

简介：它是一个抽象类，用来封装一个任务的相关代码和数据。

注意：

* 不能直接调用`NSOperation`类（因为是抽象类），可以使用其子类或系统定义的子类(NSInvocationOperation或NSBlockOperation)来执行实际的工作。

* 一个`NSOperation`对象只会被执行一次，不能用于再次执行。

* 一个操作通常被添加到一个操作队列（`NSOperationQueue`类的实例）中执行。