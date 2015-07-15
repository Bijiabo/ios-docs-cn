# NSString

### 一. 简介

说明：不可变字符串

<br>

### 二. 使用

	语法糖：NSString *str = @"";
	
	说明：使用 @"" 快速创建一个 NSString 对象

<br>

### 三. 通过字符串读写文件

	// 读取文件内容
    NSString *path = @"/Users/kenshincui/Desktop/test.txt";
    NSString *str1 = [NSString stringWithContentsOfFile:path 
    						   encoding:NSUTF8StringEncoding 
    						   error:nil];

    // 文件写入
    NSString *path = @"/Users/kenshincui/Desktop/test2.txt";
    NSString *str = @"hello world,世界你好！";
    // automically代表一次性写入，如果写到中间出错了最后就全部不写入
    [str writeToFile:path atomically:YES 
    	 				  encoding:NSUTF8StringEncoding 
    	 				  error:nil];