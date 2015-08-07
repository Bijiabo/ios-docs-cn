# NSUserDefaults

简介：它提供了与默认系统进行交互的编程接口，通常用于记录应用程序目标用户的偏好设置。

备注：

* 它提供了便利的方法来访问常见类型：浮点型、双精度浮点型、整型、布尔型和URL。

* 一个默认的对象必须是一个属性列表

* 可存储的对象类型包括：NSData，NSString，NSNumber，NSDate，NSArray，NSDictionary。

* 如果想存储其他类型的对象，你应该将其存档，然后创建一个NSData实例。

* `NSUserDefaults`的返回值是不可变的，即使你存储的值是可变的。

* `NSUserDefaults`不支持每个主机的偏好，但能够正确读取每个主机的偏好。

* `NSUserDefaults`类是线程安全的