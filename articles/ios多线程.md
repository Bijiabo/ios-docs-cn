# IOS多线程

### 一. 常用的多线程开发方式

##### 1. NSThread

简介：轻量级的多线程开发，线程执行顺序和线程总数无法控制，需要自己管理线程生命周期。

用法：

	(1) 静态方法
	[NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
	
	(2)实例方法
	NSThread *thread = [[NSThread alloc] initWithTarget:self 
												selector:@selector(loadImage) 
												object:nil];
	
	// 启动线程，启动线程并不意味着一定会立即执行，而是处于就绪状态，当系统调度时才真正执行
	[thread start];
		
线程优先级：

	说明：线程优先级范围为 0 ~ 1，值越大优先级越高，每个线程的默认优先级为 0.5

线程状态：

	* isExecuting -- 正在执行
	* isFinished -- 已完成
	* isCancellled -- 已经取消

扩展方法

	-(void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg
	说明：在后台执行一个操作，本质就是重新创建一个线程执行当前方法
	
	-(void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait
	说明：在指定的线程上执行一个方法，需要用户创建一个线程对象。
	
	-(void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait
	说明：在主线程上执行一个方法。


##### 2. NSOperation

简介：使用它进行多线程开发，可控制线程总数及依赖关系，它有两个子类用于创建线程操作：`NSInvocationOperation` 和 `NSBlockOperation`，只需将其实例放到 `NSOperationQueue` 队列中，线程就会依次启动。

NSInvocationOperation：

	// 创建一个操作
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadImage) object:nil];
	// 创建操作队列
	NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
	// 添加到操作队列后，队列会开启一个线程来执行操作
	[operationQueue addOperation:operation];
	
NSBlockOperation：

    // 创建一个操作
 	NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
 		// do something
    }];
	// 创建操作队列
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    // 设置最大并发线程数
    operationQueue.maxConcurrentOperationCount = 5;
    // 添加到操作队列
    [operationQueue addOperation:blockOperation];
    
线程执行顺序控制：

	// 创建操作
	NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
		// do something
	}];
	NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
		// do something
	}];
	// 创建操作队列
	NSOperationQueue *operationQueue = [NSOperationQueue alloc] init];
	// 设置第一个操作依赖于第二个操作，这样第二个操作便会先执行
	[firstOperation addDependency:secondOperation];
	// 将操作加入执行队列
	[operationQueue addOperation:firstOperation];
	[operationQueue addOperation:secondOperation];

##### 3. GCD -- 官方推荐的方式

简介：GCD中也有队列，它分为三类：串行队列、并行队列和主队列。

串行队列：

	说明：只有一个线程，加入到队列中的操作按添加顺序依次执行。
	
	例子：
		// 创建一个串行队列
		// 第一个参数：队列名
		// 第二个参数：队列类型
		dispatch_queue_t serialQueue = dispatch_queue_create("mySerialQueue", DISPATCH_QUEUE_SERIAL);
		// 异步执行队列任务
		dispatch_async(serialQueue, ^{ // do something });
	
并行队列：

	说明：有多个线程，操作进来之后它会将这些队列安排在可用的处理器上，同时保证先进来的任务优先处理。
	
	例子：
		// 创建一个并行队列
		dispatch_queue_t concurrentQueue = dispatch_queue_create("myConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
		// 异步执行队列任务
		dispatch_async(concurrentQueue, ^{ // do something });
		
	备注：实际开发中，通常不会重新创建一个并行队列，而是使用dispatch_get_global_queue()方法取得
		 一个全局的并发队列，例如：
		 
		 /* 取得全局队列
     		第一个参数：线程优先级
     		第二个参数：标记参数，目前没有用，一般传入0
    	  */
    	dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    	dispatch_async(globalQueue, ^{ // do something });
	
主队列：

	说明：用来执行主线程上的操作任务
	
	例子：
		// 取得主线程队列
	    dispatch_queue_t mainQueue= dispatch_get_main_queue();
	    // 更新UI界面
    	dispatch_sync(mainQueue, ^{ // update ui });
    	
常用方法：

* dispatch_apply()

	说明：重复执行某个任务，该方法没法异步执行（可使用dispatch_async()包装后执行来避免线程阻塞）。
	
* dispatch_once()

	说明：此方法中的任务只会执行一次，重复调用也没办法重复执行。
	
* dispatch_time()

	说明：延迟一定的时间后执行
	
* dispatch_barrier_async()

	说明：使用此方法创建的任务，首先会查看队列中有没有别的任务要执行，如果有，则会等待已有任务执行完毕再执行。同时在此方法后添加的任务，必须等待此方法中任务执行后才能执行。

* dispatch_group_async()

	说明：对任务分组管理
	
* dispatch_group_notify()

	说明：如果一组任务全部完成，可以通过该方法获得完成通知。

	
总结：

* 只有队列类型为并行队列，且使用异步方法执行时，才能在多个线程中执行。
* UI界面的更新最好采用同步方法，其他操作采用异步方法。
* GCD中多线程操作方法不需要使用@autoreleasepool，GCD会管理内存。

<br>

### 二. 多线程的资源抢夺问题

ios中，解决该问题的常用方法有四种：

* 使用NSLock同步锁

		NSLock *lock = [[NSLock alloc] init];
		[lock lock]; // 加锁
		// do something
		[lock unlock]; // 解锁

* 使用@synchronized代码块

		// 参数为同步对象，一般用self
		@synchronized(self) {
			// do something
    	}
    	
* GCD信号机制

		// 定义一个信号量，参数是信号量初始值
		dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
		dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); // 信号等待
		// target code
		dispatch_semaphore_signal(semaphore); // 信号通知
	
* NSCondition

		// 初始化锁对象
		NSCondition condition = [[NSCondition alloc] init];
		// 加锁
		[condition lock];
		if (/* 需要等待 */) {
			// 让当前线程处于等待状态
			[condition wait];
		} else {
			// 唤醒其他等待线程，如有多个线程在等待，则任意唤醒一个
			[condition signal];
			// 唤醒所有等待线程
			// [condition broadcast];
		}
		// 解锁
		[condition unlock];	 
		
<br>

### 三. 参考

* [IOS并行开发](http://www.cnblogs.com/kenshincui/p/3983982.html)
