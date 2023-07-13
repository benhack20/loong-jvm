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



## 二、动态二进制插桩

动态二进制插桩（DBI）在程序运行时执行反汇编、分析和代码转换，具有这些优势[^21]：

- 不需要像静态二进制插桩（SBI）一样需要区分内容中的代码和数据。
- 不需要源码和补充信息就能覆盖全部代码。
- 不需要更改程序的二进制码。

一个标准的DBI工具包括[^21]：a. JIT编译器（用于反汇编、优化、插桩、重组装代码）。b. code cache来存储需要重新运行的插桩代码。 

下面探索几种常见的动态二进制插桩工具。

### PIN

Pin是IA-32、x86-64和MIC指令集体系结构的动态二进制插桩框架，可用于创建动态程序分析工具。使用Pin构建的一些工具是Intel VTune、Intel Inspector、Intel Advisor和Intel SDE。使用Pin创建的工具称为Pintools，可用于对Linux、Windows和macOS上的用户空间应用程序执行程序分析。作为一种动态二进制检测工具，检测是在运行时对已编译的二进制文件执行的。因此，它不需要重新编译源代码，并且可以支持检测动态生成代码的程序[^22]。

PIN3.28官网教程可以参考[^23]。

一些中文程[^24][^25]。



### DynamoRIO

DynamoRIO是一个运行时代码操控系统，在程序执行时支持程序任何部分的代码转换。DynamoRIO导出了一个用于构建各种用途的动态工具的接口：程序分析和理解、Profile分析、插桩、优化、翻译等。与许多动态工具系统不同，DynamoRIO并不局限于插入callouts / trampolines，并且支持IA-32/AMD64/ARM/AArch64指令操作库对应用程序指令进行任意修改，支持Windows、Linux或Android[^26]。

官方仓库参考[^27]。官网教程可以参考[^28]。

一些中文教程[^29][^30]。



### Valgrind

Valgrind是一个用于构建动态分析工具的工具框架。Valgrind工具可以自动检测许多内存管理和线程错误，并提供程序的详细profile。也可以使用Valgrind来构建新的工具。Valgrind发行版目前包括七个工具：内存错误检测器、线程错误检测器、一个缓存和分支预测profiler等。

官网用户手册参考[^31]。

一些中文教程[^32][^33]。



## 三、虚拟机Profile

JVM Tool Interface（JVMTI）[^34]是开发和监控工具使用的编程接口。它提供了一种检查状态和控制在Java虚拟机（VM）中运行的应用程序执行的方法。

JVM TI旨在为需要访问VM状态的所有工具提供VM接口，包括但不限于：profile、调试、监视、线程分析和覆盖率分析工具。可能不是在Java虚拟机的所有实现中都可用。

JVM TI是一个双向接口。JVM TI的客户端（以下称为agent）可以通过events通知感兴趣的事件。JVMTI可以通过许多functions查询和控制应用程序，这些函数要么响应事件，要么独立于事件。

agents与执行被检查的应用程序的虚拟机在同一进程中运行并直接通信。这种通信是通过本机接口（JVM TI）进行的。通常，agents相对集中，它们可以由一个单独的进程控制，该进程在不干扰目标应用程序正常执行的情况下实现工具的大部分功能。

英文教程[^35][^38]。

一些中文教程[^36][^37]。



### 四、AOP编程

AOP（Aspect-Oriented Programming）是一种编程范式，它通过将横切关注点（cross-cutting concern）从主要业务逻辑中分离出来，实现了代码的模块化和复用。在动态程序分析中，AOP有着广泛的应用。

1. 日志记录：通过AOP定义一个日志切面（Logging Aspect），并将其应用到系统的各个关键点，如方法调用或异常处理，减少代码的重复性，提高代码的可读性和可维护性。
2. 安全检查：通过AOP定义一个安全检查切面（Security Checking Aspect），并将其应用到敏感操作或关键方法上，集中管理安全检查的逻辑，并减少代码中的冗余安全检查代码。
3. 性能监控：通过AOP定义一个性能监控切面（Performance Monitoring Aspect），并将其应用到需要监控的方法或代码段上，收集并分析程序的性能数据，帮助开发人员优化程序的性能。
4. 异常处理：通过AOP定义一个异常处理切面（Exception Handling Aspect），并将其应用到需要处理异常的方法或代码段上，集中管理异常处理逻辑，并提高代码的健壮性和可靠性。

常见的AOP工具在此处有详细的介绍[^39]。主要分析了APT，Javassist，AspectJ。前文提到的java字节码插桩工具基本都使用了AOP编程的思想。

此外，在Spring框架中也有AOP特性，SpringAOP在[^40][^41]中有详细的介绍。





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
[^21]: Priyadarshan, S. (2019). A study of Binary Instrumentation techniques.
[^22]: [Pin - A Dynamic Binary Instrumentation Tool (intel.com)](https://www.intel.com/content/www/us/en/developer/articles/tool/pin-a-dynamic-binary-instrumentation-tool.html)
[^23]: [Pin: Pin 3.28 User Guide (intel.com)](https://software.intel.com/sites/landingpage/pintool/docs/98749/Pin/doc/html/index.html)
[^24]: [Pin 学习参考手册 (seebug.org)](https://paper.seebug.org/1742/)
[^25]: [(109条消息) Intel pin小小小例子_pin例子_无名氏a的博客-CSDN博客](https://blog.csdn.net/shanlijia/article/details/107047507)
[^26]: [Home (dynamorio.org)](https://dynamorio.org/)
[^27]: [DynamoRIO/dynamorio: Dynamic Instrumentation Tool Platform (github.com)](https://github.com/DynamoRIO/dynamorio)
[^28]: [Tutorials (dynamorio.org)](https://dynamorio.org/page_tutorials.html)
[^29]: [深入浅出——基于DynamoRIO的strace和ltrace-安全客 - 安全资讯平台 (anquanke.com)](https://www.anquanke.com/post/id/169257)
[^30]: [cbwang505/DIYDynamoRIO - 码云 - 开源中国 (gitee.com)](https://gitee.com/cbwang505/diydynamorio)
[^31]: [Valgrind User Manual](https://valgrind.org/docs/manual/manual.html)
[^32]: [valgrind检测内存泄漏、越界访问、野指针访问实验_千册的博客-CSDN博客](https://blog.csdn.net/yueni_zhao/article/details/131493762)
[^33]: [valgrind基本功能介绍、基础使用方法说明_HNU Latecomer的博客-CSDN博客](https://blog.csdn.net/weixin_45518728/article/details/119865117)
[^34]: [JVM(TM) Tool Interface 1.2.3 (oracle.com)](https://docs.oracle.com/javase/8/docs/platform/jvmti/jvmti.html)
[^35]: [Creating a Debugging and Profiling Agent with JVMTI (oracle.com)](https://www.oracle.com/technical-resources/articles/javase/jvmti.html)
[^36]: [基于JVMTI 实现性能监控 - 掘金 (juejin.cn)](https://juejin.cn/post/6942782366993612813)
[^37]: [Java JVMTI和Instrumention机制介绍_instrumentation机制_疯狂哈丘的博客-CSDN博客](https://blog.csdn.net/u013332124/article/details/88367630)
[^38]: [Building a Super Simple JVMTI Agent - Saurabh Badhwar](https://saurabhbadhwar.xyz/blog/2019/02/18/building-super-simple-jvmti-agent/)
[^39]: [一文读懂 AOP | 你想要的最全面 AOP 方法探讨 - 掘金 (juejin.cn)](https://juejin.cn/post/6844903728525361165)
[^40]: [Spring AOP——Spring 中面向切面编程 - SharpCJ - 博客园 (cnblogs.com)](https://www.cnblogs.com/joy99/p/10941543.html)
[^41]: [Aspect Oriented Programming with Spring](https://docs.spring.io/spring-framework/docs/3.2.x/spring-framework-reference/html/aop.html)
