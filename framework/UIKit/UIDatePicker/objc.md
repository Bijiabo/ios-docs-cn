# UIDatePicker

**简介**

它实现了一个使用多个“旋转车轮”来让用户选择日期和时间的对象，你也可以使用它作为一个倒数计数器。当用户通过“旋转车轮”更改了日期和时间后，`UIDatePicker`对象会发送一个动作消息，与之对应的事件是`UIControlEventValueChanged`。


**注意**

* `UIDatePicker`对象可以作为倒数计时器，但它并没有提供实现，应用程序必须建立一个`NSTimer`对象来更新计时器的秒数。

* `UIDatePicker`没有继承`UIPickerView`，但是它管理了一个自定义的picker view对象作为子视图。


<br>

***

<br>

### 经验

* 如何强制UIDatePicker显示为12小时制？

	// 设置locale即可
	datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
