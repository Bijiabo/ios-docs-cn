# app的生命周期

*. 程序已经启动

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

*. 程序已经获得焦点

	- (void)applicationDidBecomeActive:(UIApplication *)application;

*. 程序将要失去焦点

	- (void)applicationWillResignActive:(UIApplication *)application;

*. 程序已经进入后台

	- (void)applicationDidEnterBackground:(UIApplication *)application;

*. 程序将要进入前台

	- (void)applicationWillEnterForeground:(UIApplication *)application;

*. 程序将要终止

	- (void)applicationWillTerminate:(UIApplication *)application;

