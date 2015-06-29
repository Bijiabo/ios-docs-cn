# NSObject

简介：它是大多数Objective-C类的根类。

<br>

# 方法和属性

### + (void)initialize

	作用：对类进行初始化
	
	
### + (void)load

	作用：当一个类或类别被添加到Objective-C运行环境中时，会调用该方法。
	
	
### + (instancetype)alloc

	作用：返回一个当前类的新实例
	
	
### + (instancetype)allocWithZone:(struct _NSZone *)zone

	作用：返回一个当前类的新实例
	
	注意：
		* zone参数会被忽略，Objective-C不再使用内存区域
		* 这个方法的存在是因为历史原因
		

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
	
	
### + (Class)class

	作用：返回类对象


### + (Class)superclass

	作用：返回父类对象


### + (BOOL)isSubclassOfClass:(Class)aClass

	作用：判断是否为aClass的子类


+ (BOOL)instancesRespondToSelector:(SEL)aSelector

	作用：判断当前类的实例是否有aSelector方法


+ (BOOL)conformsToProtocol:(Protocol *)aProtocol

	作用：判断当前类是否符合指定的协议


- (IMP)methodForSelector:(SEL)aSelector

	作用：获取aSelector方法的指针地址。

+ (IMP)instanceMethodForSelector:(SEL)aSelector

	作用：获取aSelector实例方法的指针地址