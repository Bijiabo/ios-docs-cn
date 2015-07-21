# NSInvocation

简介：`NSInvocation`对象用于在对象和应用程序之间存储和转发消息。一个`NSInvocation`对象包含了一个Objective-C消息的所有元素：目标、选择器、参数和返回值，每个元素都可以直接设置，返回值会在`NSInvocation`对象被派发后自动设置。

注意：

* 不能通过`[[NSInvocation alloc] init]`的方式创建`NSInvocation`的实例对象。
* `NSInvocation`符合`NSCoding`协议，但只支持`NSPortCoder`编码，`NSInvocation`不支持归档。