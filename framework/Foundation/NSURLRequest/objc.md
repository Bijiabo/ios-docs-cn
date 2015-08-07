# NSURLRequest

简介：它表示一个独立于协议和URL格式的URL加载请求。

备注：

* 它是可扩展的，通过添加类别可以支持额外的协议。

* 它只用于封装一个URL请求信息，必须使用其他类（如：NSURLSession 或 NSURLConnection）将其发送到服务器。