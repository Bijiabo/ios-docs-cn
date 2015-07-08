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

	例子：`/Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/C4B23F67-1419-4E63-B2C4-44E255D17D8D/UtilsDemo.app`


### @property(readonly, copy) NSURL *appStoreReceiptURL

	作用：包的应用商店收据文件的url。


### @property(readonly, copy) NSURL *bundleURL

	作用：目标bundle目录的完整url。

	例子：`file:///Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/62FCEAD8-3EE5-45AA-8E32-C417E5998916/UtilsDemo.app/`


### @property(readonly, copy) NSString *bundlePath

	作用：目标bundle目录的完整路径。

	例子：`/Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/9A62F48C-C0EA-40AD-95F9-871D6FD810EE/UtilsDemo.app`


### @property(readonly, copy) NSString *bundleIdentifier

	作用：目标bundle的标识符，如：`com.xidanjueying.UtilsDemo`


### @property(readonly, copy) NSDictionary *infoDictionary

	作用：由目标bundle的Info.plist文件生成的字典。


### - (id)objectForInfoDictionaryKey:(NSString *)key

	作用：从目标bundle的Info.plist文件中，获取指定key的value。


### @property(readonly, copy) NSURL *builtInPlugInsURL

	作用：获取bundle中插件所在子目录的url。


### @property(readonly, copy) NSString *builtInPlugInsPath

	作用：获取bundle中插件所在子目录的完整路径。


### @property(readonly, copy) NSURL *executableURL

	作用：bundle中可执行文件的url。

	例子：`file:///Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/77F992C5-B1A7-4034-929D-4B1D568C1430/UtilsDemo.app/UtilsDemo`


### @property(readonly, copy) NSString *executablePath

	作用：bundle中可执行文件的完整路径。

	例子：`/Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/F8EE6869-BD80-4274-B3FA-4E0390BCEA7B/UtilsDemo.app/UtilsDemo`


### - (NSURL *)URLForAuxiliaryExecutable:(NSString *)executableName

	作用：返回bundle中指定名称的可执行文件的url。


### - (NSString *)pathForAuxiliaryExecutable:(NSString *)executableName

	作用：返回bundle中指定名称的可执行文件的完整路径。


### @property(readonly, copy) NSURL *privateFrameworksURL

	作用：返回bundle中私有框架所在子目录的url。


### @property(readonly, copy) NSURL *privateFrameworksPath

	作用：返回bundle中私有框架所在子目录的完整路径。


### @property(readonly, copy) NSURL *sharedFrameworksURL

	作用：返回bundle中共享框架所在子目录的url。

	例子：`SharedFrameworks/ -- file:///Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/B7A763DD-4876-4F2A-B9F0-54A2C19515B3/UtilsDemo.app/`


### @property(readonly, copy) NSString *sharedFrameworksPath

	作用：返回bundle中共享框架所在子目录的完整路径。

	例子：`/Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/03D01E1D-E313-4D93-BA84-0BE33DDFFDF6/UtilsDemo.app/SharedFrameworks`


### @property(readonly, copy) NSURL *sharedSupportURL

	作用：返回bundle中共享支持文件所在子目录的url。

	例子：`SharedSupport/ -- file:///Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/8F1AD587-B8B0-454B-BE2D-C59C41A33DAD/UtilsDemo.app/`

### @property(readonly, copy) NSString *sharedSupportPath

	作用：返回bundle中共享支持文件所在子目录的完整路径。

	例子：`/Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/A36309F8-7B0D-4FB6-ADD9-62263D5BC065/UtilsDemo.app/SharedSupport`


### @property(readonly, copy) NSURL *resourceURL

	作用：返回bundle中资源文件所在子目录的url。

	例子：`file:///Users/xidanjueying/Library/Developer/CoreSimulator/Devices/57926028-2FCE-47F1-BDE8-C9E3371E2E60/data/Containers/Bundle/Application/55A6B2F4-0D4E-40F2-BC5E-D6F824FDDD3C/UtilsDemo.app/`


<br>

## 二. 参考资料

* [NSBundle 方法详解](http://www.devdiv.com/ios_nsbundle_-blog-316270-50789.html)