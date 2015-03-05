# Category

### 一. 简介

简介：动态的为已有类添加新的行为（类似于js中往对象的prototype添加新成员）。

<br>

### 二. 定义方式

说明：

* 文件名一般是“原有类名+分类名称”；
* 分类的定义是通过在原有类名后加上 `(分类名)` 来定义的（注意.h和.m都是如此）。

以给 `NSString` 添加一个 `stringByTrim()` 方法为例：

	// NSString+Extend.h
	@interface NSString (Extend)
	
	-(NSString *)stringByTrim;
	
	@end
	
	
	// NSString+Extend.m
	#import "NSString+Extend.h"

	@implementation NSString (Extend)
	
	-(NSString *)stringByTrim {
    	NSCharacterSet *character = [NSCharacterSet whitespaceCharacterSet];
    	return [self stringByTrimmingCharactersInSet:character];
	}
	
	@end

