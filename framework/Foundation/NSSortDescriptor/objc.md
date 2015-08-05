# NSSortDescriptor

简介：`NSSortDescriptor`的实例描述了一种通过对象指定属性来进行排序的方法（你可以指定是升序还是降序）。

在以下情况下，你可以使用`NSSortDescriptor`：

* 对一个数组进行排序（NSArray or NSMutableArray，`sortedArrayUsingDescriptors:` 和 `sortUsingDescriptors:`）

* 直接比较两个对象（`compareObject:toObject:`）

* 指定table view中的元素应该如何安排（`sortDescriptors`）

* 指定由数组控制器管理的元素应该如何安排（神马意思？`sortDescriptors`）

* 如果你在使用Core Data，可以指定从获取请求返回的对象的排序。