# UIActivity

简介：它是一个抽象类，其子类用于实现特定的应用服务，它与UIActivityViewController对象一起使用，负责向用户提供服务。

备注：仅当你需要向用户提供自定义服务时，才需要子类化`UIActivity`。系统已经提供了许多标准服务，例如：标准的活动视图控制器支持电子邮件数据，发布内容到社交媒体账户等，可以通过UIActivityViewController对象使用他们。

注意：

* 子类化`UIActivity`时，必须覆盖如下方法：

  * activityType

  * activityTitle

  * activityImage

  * canPerformWithActivityItems:

  * prepareWithActivityItems:

  * activityCategory