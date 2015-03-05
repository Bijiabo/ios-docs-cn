# 协议

### 一. 如何定义协议

	// 定义一个协议
	@protocol AnimalDelegate <NSObject>

	// 必须实现的方法
	@required 
	-(void)eat;

	// 可选实现的方法
	@optional 
	-(void)run;
	-(void)say;
	-(void)sleep;

	@end
	
<br>

### 二. 协议的使用

	// Person.h
	@interface Person : NSObject <AnimalDelegate>

	-(void)eat;

	@end

	// Person.m
	#import "Person.h"

	@implementation Person

	-(void)eat {
    	// do something
   	}

	@end


### 三. 注意

* 一个协议可扩展自另一个协议，如上面 `AnimalDelegate` 就扩展自 `NSObject`，如果需要扩展多个协议中间使用逗号分隔。

* 协议中定义的方法不一定是必须实现的，我们可以通过关键字进行 `@required` 和 `@optional` 进行设置，如果不设置则默认是 `@required`。

* 协议通过 `<>` 进行实现，一个类可以同时实现多个协议，中间通过逗号分隔。

* 协议的实现只能在类的声明上,不能放到类的实现上（即必须写成`@interface Person:NSObject <AnimalDelegate>`而不能写成 `@implementation Person <AnimalDelegate>`）。

* 协议中的方法可以在.h文件中声明，也可以不声明直接在.m中实现，如果只实现不声明则认为是私有方法。

* 协议中不能定义属性、成员变量等，只能定义方法。