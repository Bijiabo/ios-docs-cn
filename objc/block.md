# Block

### 一. 简介

说明：它是一个匿名函数（相当于javascript中的匿名函数），是ObjC对闭包的实现。
	
<br>
	
### 二. Block的声明方式

语法：^[返回值类型] [参数列表] 表达式
	
说明：[返回值类型] 与 [参数列表] 是可选的。当省略返回值类型时，若表达式中有return语句，就使用该返回值类型（如有多个return语句，则所有return的返回值必须相同），否则就使用 void 类型。

	^int (int num) {
		return num + 1;
	}
		 
	// 省略返回值类型（与完整版等价）
	^(int num) {
		 return num + 1;
	}
		 
<br>

### 三. Block类型的声明方式

##### 1. 方式一

	语法：返回值类型  (^类型名称)(参数列表);
	
	例子：int (^blk)(int) = ^(int num) {return num + 1;};
	
##### 2. 通过typeof声明

	语法：typedef 返回值类型 (^类型名称)(参数列表);
	
	例子：
		typedef int (^blk_t)(int);
		blk_t blk = ^(int num) {return num + 1;};
		
		// 作为函数参数
		void func(blk_t blk) {
			...
		}
		
		// 作为函数返回值
		blk_t func() {
			return ^(int num) {return num + 1;}; 
		} 

<br>

### 四. Block对自动变量值的截获

说明：在执行Block语法的瞬间，会保存被引用到的变量值。
	
    {
        int num = 24;
        typedef void (^blk_t)(void);
        blk_t blk = ^{NSLog(@"%d", num);}; // 会保存变量num的值
        num = 30; // 改写num的值
        blk(); // 输出 24
    }

<br>
    	
### 五. Block存储域

说明：Block也是Objective-C对象，它对应着三个类：

* _NSConcreteStackBlock
* _NSConcreteGlobalBlock
* _NSConcreteMallocBlock

由这三个类所生成的Block实例对象，分别存储在不同的存储域：
	     
* _NSConcreteStackBlock -- 栈
* _NSConcreteGlobalBlock -- 程序的数据区域
* _NSConcreteMallocBlock -- 堆
	     
在ARC开启的情况下，
		 
(1) 若Block内未引用任何变量，或Block内只引用了全局变量、静态全局变量、静态局部变量，或在全局的地方使用Block，则会将Block对象存储在“程序的数据区域”：
		   
	// 例1：Block内未引用任何变量
	typedef void (^blk)(void);
	blk blk_a = ^{NSLog(@"%d", 1);};
	NSLog(@"%@", blk_a); // 输出 <__NSGlobalBlock__: 0x10f0f80e0>
		   		
	// 例2：Block内引用了全局变量，静态全局变量和静态局部变量
	int a = 1; // 全局变量
	static int b = 2; // 静态全局变量
	int main(int argc, char * argv[]) {
    	@autoreleasepool {
    		static int c = 3; // 静态局部变量
            typedef void (^blk)(void);
            	
            blk obj_a = ^{NSLog(@"%d", a);};
            blk obj_b = ^{NSLog(@"%d", b);};
            blk obj_c = ^{NSLog(@"%d", c);};
            	
            NSLog(@"%@", obj_a); // 输出 <__NSGlobalBlock__: 0x101f740d0>
            NSLog(@"%@", obj_b); // 输出 <__NSGlobalBlock__: 0x101f74110>
            NSLog(@"%@", obj_c); // 输出 <__NSGlobalBlock__: 0x101f74150>
    	}
	}
		   		
(2) 其他情况，则会自动将Block对象复制到“堆”中：
		 
	{
		typedef void (^blk)(void);
		int val = 10;
		blk obj = ^{NSLog(@"%d", val);};
		NSLog(@"%@", obj); // 输出 <__NSMallocBlock__: 0x7f91cb399330>
	}

<br>
	 		
### 六. 栈上的Block什么时候会复制到堆？

* 调用Block的copy实例方法时
* Block作为函数返回值时
* 将Block赋值给附有__strong修饰符的id类型变量或Block类型变量时
* 向方法名中含有usingBlock的Cocoa框架方法或GCD的API传递Block时	
<br>

### 七. __block说明符

说明：被Block引用的变量，默认是不能对其赋值的（会报错），但通过在目标变量声明前附加 __block 说明符，则可以进行赋值。
	
    {
        __block int num = 24;
        typedef void (^blk_t)(void);
        blk_t blk = ^{
        	num = 30; // 重新赋值
        	NSLog(@"%d", num);
        };
        blk(); // 输出 30
    }
    
> 注意：__block 说明符不能与 __autoreleasing 修饰符同时使用，会引起编译错误。

<br>

### 八. __block变量存储域

说明：使用__block变量的Block从栈复制到堆上时，__block变量也会受到影响：
	
* 若一个Block中使用了__block变量，则当该Block从栈复制到堆时，Block使用的所有__block变量也会被复制到堆上，并被Block持有。	 		
		   
* 在Block已复制到堆的情形下，再次复制该Block，对该Block使用到的__block变量没有任何影响。
	