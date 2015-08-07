# NSURLResponse

简介：它以一种独立于协议和URL格式的方式，封装URL加载请求的响应元数据。

备注：当你创建一个HTTP请求时，你获得的`NSURLResponse`对象，实际上是`NSHTTPURLResponse`类的一个实例，这个实例表示一个HTTP URL加载请求的响应并储存额外的特定协议信息（如响应头）。