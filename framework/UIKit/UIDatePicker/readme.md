# UIDatePicker

### DEMO

* [效果预览](preview.png)

* [示例源码](UIDatePickerDemo)

<br>

### 经验

* 如何强制UIDatePicker显示为12小时制？

	// 设置locale即可
	datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
