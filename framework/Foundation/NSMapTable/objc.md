# NSMapTable

简介：`NSMapTable`是一个仿照`NSDictionary`的可变集合，但它提供了不同的选项：

* NSMapTable是可变的。

* NSMapTable可以通过弱引用来持有keys和values，所以当key或者value被deallocated的时候，所存储的实体也会被移除。

* NSMapTable可以在添加value的时候对value进行复制。

* NSMapTable可以随意的存储指针，并且利用指针的唯一性来进行对比和重复检查。

注意：`NSMapTable`不能被继承

<br>

## 参考资料

* [NSHashtable and NSMaptable](http://www.cocoachina.com/industry/20140605/8683.html)