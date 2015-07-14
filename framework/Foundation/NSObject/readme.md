# NSObject

简介：它是大多数Objective-C类的根类。

<br>

## 一. 方法和属性
***

### + (void)initialize

	作用：对类进行初始化
	
	
### + (void)load

	作用：当Objective-C运行时环境加载类或类别时，会调用这个方法。

	备注：

		* 一个类的load方法会在其所有父类的load方法之后调用
		* 类别的load方法会在对应类的load方法之后调用
		* 在load方法里面，我们不需要显示地去调用[super load]，因为父类的load方法会自动被调用，且在子类之前
		* 在有依赖关系的两个库中，被依赖的库中的类其load方法会优先调用
	
	
### + (instancetype)alloc

	作用：返回一个当前类的新实例
	
	
### + (instancetype)allocWithZone:(struct _NSZone *)zone

	作用：返回一个当前类的新实例
	
	注意：
		* zone参数会被忽略，Objective-C不再使用内存区域
		* 这个方法的存在是因为历史原因
		* alloc方法的实现调用了allocWithZone:方法
		

### - (instancetype)init

	作用：在对象被分配过内存后，对其进行初始化。
	
	注意：
		* 对象被初始化后才可以使用
		* 在自定义的初始化方法中，必须先调用父类的初始化方法，然后再进行对象自身的初始化，如下：
		
			- (instancetype)init {
   				self = [super init];
    			if (self) {
        			// Initialize self.
    			}
    			return self;
			}
			
		  原因：因为在具体的设备上，类可能无法初始化（如ipod上没有相机，相机相关的类就无法初始化），
		       此时调用父类的init方法会返回nil，通过判断self是否为nil来决定是否需要继续初始化。
		       
		       
### - (id)copy

	作用：通过`NSCopying`协议的`copyWithZone:`方法对对象进行浅拷贝。
	
	
### - (id)mutableCopy

	作用：通过`mutableCopyWithZone:`方法对对象进行深拷贝。
	
	
### - (void)dealloc

	作用：释放对象占用的内存
	
	注意：开启ARC后，不用在该方法内调用父类的的dealloc方法。
	
	
### + (instancetype)new

	作用：对当前类进行实例化并初始化，它是对`alloc`和`init`的组合。

	备注：它是一个历史遗留产物，源于NeXT时代
	
	
### + (Class)class

	作用：返回接受者的类对象


### + (Class)superclass

	作用：返回接收者的父类对象


### + (BOOL)isSubclassOfClass:(Class)aClass

	作用：判断接受者的类对象是否为另一个类的子类


### + (BOOL)instancesRespondToSelector:(SEL)aSelector

	作用：测试接收者的实例是否能响应指定的消息

	备注：如果aSelector消息被转发到其它对象，则类的实例可以接收这个消息而不会引发错误，即使该方法返回NO。


### + (BOOL)conformsToProtocol:(Protocol *)aProtocol

	作用：判断类是否采用了指定协议

	备注：如果一个类直接或间接地采用了一个协议，则我们可以说这个类实现了该协议


### - (IMP)methodForSelector:(SEL)aSelector

	作用：获取aSelector对应的方法实现的地址（是一个函数指针）。

	备注：

		* 如果接收者是一个对象，则aSelector应该是一个实例方法；如果接收者是一个类，则aSelector应该是一个类方法。

		* 当需要在一个循环内频繁调用同一个方法时，可以通过该方法取得目标方法的实现地址，然后通过该地址来直接调用方法实现，
		  从而避开动态绑定的过程，提高程序的性能。

		* methodForSelector:是Cocoa运行时提供的，它不是Objective-C语言的特性。


### + (IMP)instanceMethodForSelector:(SEL)aSelector

	作用：获取aSelector对应的实例方法实现的地址。


### + (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector

	作用：返回包含aSelector实例方法描述信息的NSMethodSignature对象，如果实例方法未找到，则返回nil。


### - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector

	作用：返回包含aSelector方法描述信息的NSMethodSignature对象，如果找不到方法，则返回nil。


### + (NSString *)description

	作用：返回一个表示类内容的字符串。


### autoContentAccessingProxy

	作用：只读属性，返回一个代理接收对象。


### - performSelector:withObject:afterDelay:

	作用：在当前线程下，使用默认模式延迟调用接收器的指定方法。


### - performSelector:withObject:afterDelay:inModes:

	作用：在当前线程下，使用指定模式延迟调用接收器的指定方法。


### - performSelectorOnMainThread:withObject:waitUntilDone:

	作用：在主线程下，使用默认模式调用接收器的指定方法。


### - performSelectorOnMainThread:withObject:waitUntilDone:modes:

	作用：在主线程下，使用指定模式调用接收器的指定方法。


### - performSelector:onThread:withObject:waitUntilDone:

	作用：在指定线程下，使用默认模式调用接收器的指定方法。


### - performSelector:onThread:withObject:waitUntilDone:modes:

	作用：在指定线程下，使用指定模式调用接收器的指定方法。


### - performSelectorInBackground:withObject:

	作用：在一个新的后台线程下调用接收器的指定方法。


### + (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget

	作用：在调用发生前，取消通过`performSelector:withObject:afterDelay:`实例方法注册的，所有接收者为aTarget的调用请求。


### + cancelPreviousPerformRequestsWithTarget:selector:object:

	作用：在调用发生前，取消通过`performSelector:withObject:afterDelay:`实例方法注册的指定调用请求（target、selector、object均与三个参数一致的请求）。


### - forwardingTargetForSelector:

	作用：如果一个对象实现了这个方法，并返回一个非nil的对象且该对象不是self自身（否则会出现无限循环），则该对象成为消息的新接收者。


### - forwardInvocation:

	作用：该方法会被子类覆盖，用于将消息转发给其他对象。


### + resolveClassMethod:

	作用：动态解析一个类方法


### + resolveInstanceMethod:

	作用：动态解析一个实例方法


### - doesNotRecognizeSelector:

	作用：运行时系统在对象无法处理或转发一个消息时会调用这个方法。

	备注：

		* 这个方法引发一个NSInvalidArgumentException异常，并生成一个错误消息。
		* 如果我们要重写该方法，必须调用super的实现，或在实现的最后引发一个NSInvalidArgumentException异常。

	应用：可以用于阻止一个方法被继承

		// 这段代码阻止子类的实例响应copy消息，或阻止父类转发copy消息
		- (id)copy {
    		[self doesNotRecognizeSelector:_cmd];
		}


### - awakeAfterUsingCoder:

	作用：当接收该消息的对象被解码后，将其替换成另外一个对象。

	备注：该方法由子类实现；该方法被NSCoder调用。


### @property(readonly) Class classForCoder

	作用：返回接收器的类，除非它正在编码中。

	备注：该方法被NSCoder调用。


### @property(readonly) Class classForKeyedArchiver

	作用：？


### + (NSArray *)classFallbacksForKeyedArchiver

	作用：？


### - (id)replacementObjectForCoder:(NSCoder *)aCoder

	作用：？


### - (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver

	作用：？


### + (void)setVersion:(NSInteger)aVersion

	作用：设置接收者的版本值，默认值为0。


### + (NSInteger)version

	作用：返回接受者的版本值，默认值为0。

<br>

## 二. 参考资料
***

* [NSObject](http://www.cocoachina.com/ios/20150205/11113.html)
