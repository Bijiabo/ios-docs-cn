# NSAutoreleasePool

简介：它用于支持Cocoa的引用计数内存管理系统。

注意：

* 如果开启了ARC，就不能直接使用`NSAutoreleasePool`了，而应该使用`@autoreleasepool`块，如：

```
@autoreleasepool {
    // Code benefitting from a local autorelease pool.
}
```

* `@autoreleasepool`块比直接使用`NSAutoreleasePool`要更有效

* 即便你没有开启ARC，也可以使用`@autoreleasepool`块