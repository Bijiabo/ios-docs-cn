# UIAlertController

简介：它用于向用户显示一个警告信息，从iOS8开始，它代替了 UIActionSheet 和 UIAlertView。

注意：该类不支持子类化

示例：

```
UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                               message:@"This is an alert."
                               preferredStyle:UIAlertControllerStyleAlert];
 
UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {}];
 
[alert addAction:defaultAction];
[self presentViewController:alert animated:YES completion:nil];
```