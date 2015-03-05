### 一. GameKit

简介：iOS7之前的蓝牙通讯框架，从iOS7开始过期，但是目前多数应用还是基于此框架。

特点：

* 仅支持IOS设备

* 传输内容仅限于沙盒或照片库中用户选择的文件

* 只能在同一个应用之间传输（即两个设备必须安装同一个应用）

示例：

* [在同一个应用之间传输照片（需要在两个设备商运行该应用）](../demo/Bluetooth/GameKitDemo)

<br>

### 二. MultipeerConnectivity

简介：它是一种支持Wi-Fi网络、P2P Wi-Fi 以及蓝牙个人局域网的通信框架，从iOS7开始引入，用于取代GameKit。

特点：

* 仅支持IOS设备

* 可以在不同的应用之间传输数据

* 可以安全的传递信息、流或者其他文件资源

示例：

* [负责广播服务的app](../demo/Bluetooth/MultipeerConnectivityBroadCast)
* [负责发现服务的app](../demo/Bluetooth/MultipeerConnectivityFinder)

<br>

### 三. CoreBluetooth

简介：功能强大的蓝牙开发框架，要求设备必须支持蓝牙4.0。

特点：

* 可以通过iOS设备向Android、Windows Phone以及其他装有蓝牙4.0芯片的智能设备传输。

* 可以在不同的应用之间传输数据。