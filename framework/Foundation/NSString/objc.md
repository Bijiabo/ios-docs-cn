# NSString

**简介**

不可变字符串


**快捷使用**

	语法糖：NSString *str = @"";
	
	说明：使用 @"" 快速创建一个 NSString 对象


**通过字符串读写文件**

```
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
```

<br>

***

<br>

### 参考资料

* [如何解决sizeWithAttributes获取的字符串尺寸偏小的问题](http://stackoverflow.com/questions/18897896/replacement-for-deprecated-sizewithfont-in-ios-7)