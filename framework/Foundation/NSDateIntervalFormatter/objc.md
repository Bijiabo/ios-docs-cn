# NSDateIntervalFormatter

简介：它用于从成对的日期（<start> - <end>）创建用户可读的字符串。

例子：

```
NSDateIntervalFormatter* formatter = [[NSDateIntervalFormatter alloc] init];
formatter.dateStyle = NSDateIntervalFormatterShortStyle;
formatter.timeStyle = NSDateIntervalFormatterNoStyle;
 
// Create two dates that are exactly 1 day apart.
NSDate* startDate = [NSDate date];
NSDate* endDate = [NSDate dateWithTimeInterval:86400 sinceDate:startDate];
 
// Use the configured formatter to generate the string.
// Output：7/15/15 - 7/16/15
NSString* outputString = [formatter stringFromDate:startDate toDate:endDate];
```