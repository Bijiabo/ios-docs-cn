# UIControl

**简介**

它是控制对象的基类，如按钮和滑动条。它的主要作用是定义一个接口和事件发生时将动作消息派发给目标对象的基本实现。


**关于子类化**

在以下两种情况下，你可能需要扩展一个`UIControl`子类：

* 观察或修改派发到目标对象的特定事件的动作消息，此情况下，可以通过覆盖`sendAction:to:forEvent:`方法来实现。

* 提供自定义的跟踪行为（如：更改高亮外观），覆盖这些方法中的一个或全部：`beginTrackingWithTouch:withEvent:`，`continueTrackingWithTouch:withEvent:`，`endTrackingWithTouch:withEvent:`。


**注意**

你不能直接使用它来实例化一个控制对象。