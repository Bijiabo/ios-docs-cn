# NSValue

简介：一个`NSValue`对象是一个C或objective - C数据项的简单容器，它可以容纳任何标量类型：如整型、浮点型、字符、指针、结构和对象id引用。该类可用于需要objective-c对象的场合，如集合中的key&value，以及其他需要objective-c对象的api。

注意：

* `NSValue`对象总是不变的

* 任何`NSValue`的子类都必须覆盖两个原始的实例方法：`getValue:`和`objcType`，这些方法必须为值提供存储操作。

* `NSValue`类没有指定初始化器，如果子类的初始化器只需要调用父类的`init`方法即可。

* `NSValue`类采用了`NSCopying`和`NSSecureCoding`协议，如果你想从复制或编码中创建自定义子类的实例，就覆盖这些协议的方法。