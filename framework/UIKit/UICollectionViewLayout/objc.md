# UICollectionViewLayout

简介：它是一个抽象基类，你可以使用其子类为集合视图生成布局信息。布局对象的工作是在集合视图的边界内确定单元格、辅助视图、装饰视图的位置，且在集合视图需要时报告这些信息。集合视图将提供的布局信息应用于相应的视图，使它们可以呈现在屏幕上。



**集合视图包含三类需要被布局的视觉元素：**

* 单元格
* 辅助视图，它用于实现一个章节的页眉和页脚，不是必须的，无法被用户选中。
* 装饰视图，它用于视觉装饰，不是必须的，无法被用户选中。


**`UICollectionViewLayout`的子类应该实现下面的方法：**

* 为集合视图提供基本的布局信息

	* collectionViewContentSize
	* layoutAttributesForElementsInRect:
	* layoutAttributesForItemAtIndexPath:
	* layoutAttributesForSupplementaryViewOfKind:atIndexPath:（如果你的布局支持辅助视图）
	* layoutAttributesForDecorationViewOfKind:atIndexPath:（如果你的布局支持装饰视图）
	* shouldInvalidateLayoutForBoundsChange:

* 当集合视图出现变更时（添加、删除、移动项目），更新布局信息

	* initialLayoutAttributesForAppearingItemAtIndexPath:
	* initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:
	* initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:
	* finalLayoutAttributesForDisappearingItemAtIndexPath:
	* finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:
	* finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:



**使用无效上下文优化布局性能**

一个失效上下文允许你指定哪些部分的布局发生了改变，布局对象可以使用这些信息来减少重新计算的数据量。通过子类化`UICollectionViewLayoutInvalidationContext`类，可以为你的布局对象自定义一个失效上下文。你可以在这个子类中定义一个自定义属性，用于表示那些可以独立地重新计算的布局数据。当你需要在运行时让你的布局无效，可以实例化你的自定义子类并设置自定义属性来记录发生了改变的布局信息，然后将该实例传给布局对象的`invalidateLayoutWithContext:`方法，该方法便会使用失效上下文中的信息为发生了改变的部分重新计算布局。

如果你为布局对象定义了一个自定义失效上下文类，你应该覆盖`invalidationContextClass`方法且返回你的自定义失效上下文类。因为当集合视图需要一个失效上下文时，总是用你指定的类创建实例，所以从`invalidationContextClass`方法返回你的自定义失效上下文类，可以确保你的布局对象拥有预期的失效上下文。



**注意**

* 在使用它之前必须对其进行子类
* 布局对象不会为其工作的对象创建视图

<br>
