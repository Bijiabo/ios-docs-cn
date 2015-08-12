# UIAppearance

简介：使用它来取得一个类的外观代理。你可以通过发送外观修改消息到一个类的外观代理，来自定义这个类的实例的外观。给对象自定义外观的方式有两种：

* 给类的所有实例定义统一的外观，调用目标类的`appearance`方法来取得外观代理，如下：

```
// 给所有导航条设置统一的背景色
[[UINavigationBar appearance] setBarTintColor:myNavBarBackgroundColor];
```

* 给容器类内部的实例定义外观（如给导航条内的按钮定义外观），调用目标类的`appearanceWhenContainedIn:`方法来取得外观代理，如下：

```
// 给导航条内的按钮设置背景图片
[[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil]
       setBackgroundImage:myNavBarButtonBackgroundImage forState:state barMetrics:metrics];
```


注意：iOS中，只有当视图进入窗口时，外观才会变化。对于已经存在窗口中的视图，若想改变其外观，则需要先将其从视图层次中删除，然后再将其放回视图层次中。

<br>

### 参考

* [使用UIAppearance协议自定义视图](http://www.ituring.com.cn/article/30658)