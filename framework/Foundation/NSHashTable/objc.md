# NSHashTable

简介：NSHashTable是仿照的NSSet，但它提供了不同的选项，特别是支持弱关系。

* NSHashTable是可变的

* NSHashTable可以持有weak类型的成员变量

* NSHashTable可以在添加成员变量的时候复制成员

* NSHashTable可以随意的存储指针并利用指针的唯一性来进行hash同一性检查（检查成员变量是否有重复）和对比操作（equal）。

<br>

## 参考资料

* [NSHashtable and NSMaptable](http://www.cocoachina.com/industry/20140605/8683.html)

