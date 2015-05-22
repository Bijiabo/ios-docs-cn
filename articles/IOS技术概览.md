# IOS技术概览

<br>

## 一. Cocoa Touch Layer

### 1. 高级特征

#### (1) App Extensions

简介：iOS8允许你提供一个应用扩展，来扩展用户任务中的系统选中区域，实现定制功能。

iOS支持以下几方面的应用程序扩展：

* 分享内容到社交网站或其他地方

* 为当前内容执行一个简单的任务

* 在消息中心的今日视图里提供一个快速更新或简短的任务

* 在照片应用中执行编辑照片或视频

* 提供可以被其他应用程序访问的文件存储位置

* 提供自定义键盘

> 备注：每个扩展点都定义了自己的API，当您使用应用程序扩展模板进行开发时，你会得到一个包含所选择扩展点定义的方法和属性列表设置的默认目标。

***

#### (2) Handoff

简介：它使用户能够在一台设备开始一个动作，然后切换到另一台设备后，依然能在另一台设备保持相同的动作。

***

#### (3) Document Picker

简介：它授权用户访问自己应用程序沙箱之外的文件。

对应类：

* UIDocumentPickerViewController

***

#### (4) AirDrop

简介：它让用户与附近的设备分享照片、文档、URLS及其它类型的数据。

对应类：

* UIActivityViewController

***

#### (5) TextKit

简介：它是一个用于处理文字和排版的高级组类。

***

#### (6) UIKit Dynamics

简介：在实现UIDynamicItem协议的情况下，App可以给UIView对象和其他对象设置动态行为，目前支持以下四种行为：

* UIAttachmentBehavior

	说明：在两个dynamic item之间，或一个item和一个point之间指定一个连接。当其中一个移动时，另一个也会移动。

* UICollisionBehavior

	说明：允许dynamic item在指定的行为界限内相互碰撞。

* UIGravityBehavior

	说明：为dynamic items指定一个重力矢量。dynamic items会在矢量方向上加速，直到与其他items发生碰撞，或边界冲突。

* UIPushBehavior

	说明：为dynamic items指定一个连续或瞬时力矢量。

* UISnapBehavior

	说明：为dynamic item指定一个捕捉点。

> 备注：当你将动态行为添加到一个UIDynamicAnimator实例对象上时，动态行为就会被激活。UIDynamicAnimator实例对象为动态行为的执行
提供了上下文，一个给定的动态项目可以有多个行为，但这些行为必须由同一个UIDynamicAnimator实例对象来进行动画处理。

***

#### (7) Multitasking

简介：iOS中，多任务模式被设计用于保证APP完成关键工作的同时，最大限度的延长电池寿命。

***

#### (8) Auto Layout

简介：自动布局帮助你用很少的代码建立动态界面。

***

#### (9) Storyboards

简介：故事板，它是设计APP用户界面的推荐方式。你可以在故事板上设计APP的所有用户界面，看到所有的视图和视图控制器，从而理解它们是如何协作的。

> 备注：你可以使用一个故事板文件来存储应用程序的所有视图控制器和视图，或者使用多个故事板视图来组织你的界面部分。在构建时，Xcode取得故事板文件的内容，并把它们分割成独立的块，以便单独加载它们，确保更好的性能。

***

#### (10) UI State Preservation

简介：UI状态保存，当一个应用从前台退到后台时，它可以保存视图和视图控制器的状态。在应用再次回到前台时，它可以使用保存的状态使视图和视图控制器恢复到之前的配置，使应用看起来好像从未退出过。

***

#### (11) Apple Push Notification Service

简介：苹果的推送通知服务，它提供了一种方法来提醒用户有新信息，即使你的应用不处于活动状态。使用该服务，你可以随时向用户设备推送文本通知，在应用ICON上增加一个标记（通常是带数字的红圈），或触发声音警报。

***

#### (12) Local Notifications

简介：本地通知

> 备注：本地通知是独立于你的应用程序的，当一个本地通知被调度后，系统会管理它的发布，你的应用甚至都不用运行。

***

#### (13) Gesture Recognizers

简介：手势识别

***

#### (14) Standard System View Controllers

简介：许多系统框架都为标准系统界面提供了视图控制器，当你执行以下任务时，应该使用相应框架的视图控制器。

* 显示或编辑联系人信息（使用Address Book UI框架里的视图控制器）

* 创建或编辑日历事件（使用EventKit UI框架的视图控制器）

* 编写电子邮件或短信（使用Message UI框架的视图控制器）

* 打开或预览一个文件的内容（使用UIDocumentInteractionController）

* 拍照或从用户的照片库中选择照片（使用UIImagePickerController）

* 拍摄视频短片（使用UIImagePickerController）

***

<br>

### 2. Cocoa Touch Frameworks

#### (1) AddressBookUI.framework

简介：创建新联系人，或选择和编辑现有联系人。

***

#### (2) EventKitUI.framework

简介：查看和编辑日历相关的事件。

***

#### (3) GameKit.framework

简介：它实现了对游戏中心的支持，允许用户在线分享游戏相关的信息。

***

#### (4) iAd.framework

简介：让你在自己的应用里发布广告条。

***

#### (5) MapKit.framework

简介：它提供了一个可滚动的地图，你可以将它融入自己应用的用户界面中。你可以使用该框架的接口来自定义地图的内容和外观，可以对感兴趣的标志点使用注释，可以使用自定义的弹层来点缀自己的内容与地图内容。

***

#### (6) MessageUI.framework

简介：它支持在你的应用里写邮件或发短信。

***

#### (7) NotificationCenter.framework

简介：它支持创建在通知中心显示信息的部件支持。

***

#### (8) PushKit.framework

简介：它提供对VoIP应用（即网路电话应用）的注册支持。当手机有来电时，应用可以使用该框架来接收推送通知。

***

#### (9) UIKit.framework

简介：它提供关键的基础设施来实现图形化，事件驱动的应用。

<br><br>

## 二. Media layer

> 说明：多媒体层包含图形、音频和视频技术，你可以用于自己的应用中实现多媒体体验。

### 1. Graphics Technologies

### 2. Video Technologies

### 3. AirPlay

### 4. Media Layer Frameworks