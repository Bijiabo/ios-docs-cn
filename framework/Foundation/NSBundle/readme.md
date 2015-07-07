# NSBundle

简介：当app安装到手机或者模拟器上，整个项目会被打包成一个文件夹。如果需要在该文件夹中寻找特定文件，则会用到NSBundle。

<br>

## 二. 方法及属性
***

### + (instancetype)bundleWithURL:(NSURL *)url

	作用：基于指定的目录url生成一个NSBundle对象。


### + (instancetype)bundleWithPath:(NSString *)fullPath

	作用：基于指定的目录路径（完整路径）生成一个NSBundle对象。


### - (instancetype)initWithURL:(NSURL *)url

	作用：基于指定的目录url生成一个NSBundle对象。


### - (instancetype)initWithPath:(NSString *)fullPath

	作用：基于指定的目录路径生成一个NSBundle对象。


### + bundleForClass:

	作用：获取指定类所在的bundle。


### + (NSBundle *)bundleWithIdentifier:(NSString *)identifier

	作用：获取名称为identifier的bundle。


### + (NSBundle *)mainBundle

	作用：找到对应app的主文件夹（即`xx.app`）。


### + (NSArray *)allBundles

	作用：获取当前应用程序的所有非framework bundle。


### + (NSArray *)allFrameworks

	作用：获取应用程序加载的所有framework的资源。


### - (Class)classNamed:(NSString *)className

	作用：根据类名字符串获取一个类对象。


### @property(readonly) Class principalClass

	作用：返回bundle的主要类。


### - URLForResource:withExtension:subdirectory:

	作用：返回指定子目录中指定文件名及后缀名的资源文件的url。


### + pathForResource:ofType:inDirectory:

	作用：返回指定目录中指定文件名及后缀名的资源文件的完整路径。


### - URLForResource:withExtension:

	作用：返回指定文件名及后缀名的资源文件的url。


### - pathForResource:ofType:

	作用：返回指定文件名及后缀名的资源文件的完整路径。


### - URLsForResourcesWithExtension:subdirectory:

	作用：返回指定子目录中，所有匹配指定后缀名的资源文件的url。


### - pathForResource:ofType:inDirectory:

	作用：返回指定目录中指定文件名及后缀名的资源文件的完整路径。


### - URLForResource:withExtension:subdirectory:localization:

	作用：在指定语言的情况下，返回指定子目录中指定文件名及后缀名的资源文件的url。


### - pathForResource:ofType:inDirectory:forLocalization:

	作用：在指定语言的情况下，返回指定目录中指定文件名及后缀名的资源文件的完整路径。


### + pathsForResourcesOfType:inDirectory:

	作用：返回指定目录中，所有匹配指定后缀名的资源文件的完整路径。


### - pathsForResourcesOfType:inDirectory:

	作用：返回指定目录中，所有匹配指定后缀名的资源文件的完整路径。


### - URLsForResourcesWithExtension:subdirectory:localization:

	作用：在指定语言的情况下，返回指定子目录中匹配指定后缀名的资源文件的url。


### - pathsForResourcesOfType:inDirectory:forLocalization:

	作用：在指定语言的情况下，返回指定目录中匹配指定后缀名的资源文件的完整路径。


### + URLForResource:withExtension:subdirectory:inBundleWithURL:

	作用：返回指定bundle的指定子目录中，匹配指定文件名及后缀名的资源文件的url。


### + URLsForResourcesWithExtension:subdirectory:inBundleWithURL:

	作用：返回指定bundle的指定子目录中，匹配指定后缀名的资源文件的url。


### @property(readonly, copy) NSString *resourcePath

	作用：获取bundle中包含资源文件的子目录的完整路径。


### @property(readonly, copy) NSURL *appStoreReceiptURL

	作用：包的应用商店收据文件的url。


<br>

## 二. 参考资料

* [NSBundle 方法详解](http://www.devdiv.com/ios_nsbundle_-blog-316270-50789.html)