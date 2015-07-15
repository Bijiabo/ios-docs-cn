# NSNumber

### 一. boxing

说明：将基本类型和结构体转换成 NSObject

相关方法：

* 针对基本类型

	* +(NSNumber *)numberWithChar:(char)value;

	* +(NSNumber *)numberWithInt:(int)value;

	* +(NSNumber *)numberWithFloat:(float)value;

	* +(NSNumber *)numberWithDouble:(double)value;

	* +(NSNumber *)numberWithBool:(BOOL)value;

	* +(NSNumber *)numberWithInteger:(NSInteger)value;
	
* 针对结构体

	* +(NSValue *)valueWithPoint:(NSPoint)point;
	
	* +(NSValue *)valueWithSize:(NSSize)size;
	
	* +(NSValue *)valueWithRect:(NSRect)rect;
	
* 针对自定义结构体

	* +(NSValue *)valueWithBytes:(const void *)value objCType:(const char *)type;


<br>

### 二. unboxing

说明：将 NSObject 转换成基本类型或结构体

相关方法：

* 针对基本类型

	* -(char)charValue;

	* -(int)intValue;

	* -(float)floatValue;

	* -(double)doubleValue;

	* -(BOOL)boolValue;
	
* 针对结构体

	* -(NSPoint)pointValue;
	
	* -(NSSize)sizeValue;
	
	* -(NSRect)rectValue;
	
* 针对自定义结构体

	* -(void)getValue:(void *)value;



<br>

### 三. 例子

	// 基本类型
	NSNumber *number = [NSNumber numberWithChar:'a'];
	NSLog(@"%@", [number charValue]);
	
	// 结构体
	CGPoint point = CGPointMake(10, 20);
	NSValue *value = [NSValue valueWithPoint:point];
	NSLog(@"%@", [value pointValue]);
	
	// 自定义结构体
	Date date = {2014, 2, 28};
	char *type = @encode(Date);
	// 第一个参数传递结构体地址，第二个参数传递类型字符串
	NSValue *value = [NSValue value:&date withObjCType:type];
	Date date2;
	NSLog(@"%@", [value getValue:&date2]);









