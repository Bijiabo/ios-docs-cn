# NSNotification

简介：`NSNotification`用于封装消息，以便于通过`NSNotificationCenter`将其广播到其他对象。一个`NSNotification`对象包含一个消息名，一个对象（发送消息的对象）和一个可选的字典（希望发送给广播接收者的数据）。

注意：`NSNotification`是不可变的对象。