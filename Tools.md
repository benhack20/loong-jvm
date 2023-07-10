# 动态程序分析工具

本文探索一些常用动态程序分析工具，主要涉及：字节码插桩、二进制码插桩、虚拟机Profile、AOP编程等。基于动态模型图的方法更适用代码开发早期，这里不讨论；对源码的插桩要求程序源码，现实中可行性不高，因此也暂不考虑。

## 一、Java字节码插桩

对Java程序的字节码插桩本质上是动态代理的一种具体形式。具体探讨可以参考这些地方[^1][^2][^3]。

**静态代理**也就是在程序运行前就已经存在代理类的字节码文件，代理类和真实主题角色的关系在运行前就确定了。

**动态代理**的代码是在程序运行期间由JVM根据反射等机制动态生成的，所以在运行前并不存在代理类的字节码文件。**动态代理**就是想办法，根据接口或目标对象，生成出代理类的字节码，然后再加载到JVM中使用。这里探讨常用的几个工具：

- Javassist
- ObjectWeb ASM
- JDK proxy
- CGLIB (Code Generation Library)

### Javassist

Javassist是一个开源的Java字节码操作库，用于在运行时动态编辑和修改Java字节码。它简单易用，并被广泛应用于开发框架、应用服务器和ORM工具等领域。通过Javassist，开发者可以在程序运行时动态地修改类的行为，而无需重新编译源代码。它提供了类型安全的API，支持多种字节码操作，如修改方法、字段和构造函数等。

官网教程参考[^4]。

一些中文教程[^3][^5][^6][^7][^8]。

### ASM

ASM是一个 Java 字节码操控框架。它能被用来动态生成类或者增强既有类的功能。ASM 可以直接产生二进制 class 文件，也可以在类被加载入 Java 虚拟机之前动态改变类行为。

操作的级别是底层JVM的汇编指令级别，要求ASM使用者要对class组织结构和JVM汇编指令有一定的了解。性能高。

ASM官网[^11]。

一些中文教程[^2][^3][^9][^10][^12]。

### JDK Proxy

JDK动态代理是Java中一种实现动态代理的机制，基于Java的反射机制实现，可以在不修改原始类的情况下，通过代理对象对方法调用进行拦截和增强。这些拦截和增强的操作包括在方法调用前后执行额外操作、对方法参数进行验证或修改、统计方法调用次数等。

它使用`java.lang.reflect.Proxy`类和`java.lang.reflect.InvocationHandler`接口来创建和管理代理对象。要求目标类必须实现接口，并在调用方法时将方法调用转发给`InvocationHandler`实现类进行处理。

英文教程[^14][^13]。

一些中文教程[^1][^15]。

### CGLIB

CGLIB（Code Generation Library）是一个代码生成库，用于在运行时扩展Java类。它通过生成被代理类的子类，并重写父类中的方法，实现代理功能。CGLIB可以在运行时创建动态代理对象，通常是代理非接口类型的类。与Java标准库中的动态代理相比，CGLIB提供了更高的灵活性。

官方仓库[^16]。

一些教程[^17][^18][^19][^20]。



[^1]: [深入理解Java动态代理 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/347141071)
[^2]: [什么？你还不知道字节码插桩！ - 掘金 (juejin.cn)](https://juejin.cn/post/6977571720215396366)
[^3]: [字节码操纵技术探秘_Java_Victor Grazi_InfoQ精选文章](https://www.infoq.cn/article/Living-Matrix-Bytecode-Manipulation)
[^4]: [Javassist by jboss-javassist](http://www.javassist.org/)
[^5]: [关于Java字节码编程javassist的详细介绍 | w3cschool笔记](https://www.w3cschool.cn/article/35230124.html)
[^6]: [Java字节码编程之非常好用的javassist - 掘金 (juejin.cn)](https://juejin.cn/post/6952765170544279566)
[^7]: [javassist使用全解析 - rickiyang - 博客园 (cnblogs.com)](https://www.cnblogs.com/rickiyang/p/11336268.html)
[^8]: [Javassist篇四 - CodeGuide_程序员编码指南 - SegmentFault 思否](https://segmentfault.com/a/1190000022622614)
[^9]: [ASM 库的介绍和使用 - 简书 (jianshu.com)](https://www.jianshu.com/p/905be2a9a700)
[^10]: [字节码增强技术探索 - 美团技术团队 (meituan.com)](https://tech.meituan.com/2019/09/05/java-bytecode-enhancement.html)
[^11]: [ASM (ow2.io)](https://asm.ow2.io/)
[^12]: [最通俗易懂的字节码插桩实战（Gradle + ASM）—— 自动埋点 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/392249132)
[^13]: [A Guide To Java Dynamic Proxies And It In Coding. (xperti.io)](https://xperti.io/blogs/java-dynamic-proxies-introduction/)
[^14]: [Dynamic Proxy Classes (oracle.com)](https://docs.oracle.com/javase/8/docs/technotes/guides/reflection/proxy.html)
[^15]: [Java | JDK 动态代理的原理其实很简单 - 掘金 (juejin.cn)](https://juejin.cn/post/6974018412158664734)
[^16]: [cglib/cglib: cglib - Byte Code Generation Library is high level API to generate and transform Java byte code.](https://github.com/cglib/cglib)
[^17]: [CGLIB(Code Generation Library) 介绍与原理 | 菜鸟教程 (runoob.com)](https://www.runoob.com/w3cnote/cglibcode-generation-library-intro.html)
[^18]: [CGLib: The Missing Manual - DZone](https://dzone.com/articles/cglib-missing-manual)
[^19]: [cglib 入门前篇 - 掘金 (juejin.cn)](https://juejin.cn/post/6889429768039890958)
[^20]: [cglib入门后篇 - 掘金 (juejin.cn)](https://juejin.cn/post/6893462192953491469)
