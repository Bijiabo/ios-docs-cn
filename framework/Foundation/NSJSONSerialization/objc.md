# NSJSONSerialization

简介：通过`NSJSONSerializtion`可以实现JSON和Foundation对象的互转。一个对象必须拥有以下属性才能转成JSON：

* 顶级对象是一个数组或字典

* 所有对象都是NSString，NSNumber，NSArray，NSDictionary 或 NSNull的实例。

* 所有字典的key都是NSString的实例

* NSNumber不是NaN或无穷大