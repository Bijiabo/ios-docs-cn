# NSProxy

简介：`NSProxy`是一个抽象的父类，它为作为其他对象的替身对象定义了一个API。向一个替身对象发送消息，这个消息会被转发给真实对象或者导致替身对象载入真实对象。`NSProxy`的子类用于实现透明的分布式消息或对象的懒实例化。