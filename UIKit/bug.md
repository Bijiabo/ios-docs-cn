#### 1. 多次调用UIView的drawRect:方法时，内容出现重叠

	解决：设置UIView的backgroundColor属性，或opaque属性（属性值不能为1）。