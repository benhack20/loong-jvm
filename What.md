# What
## 一、程序分析的定义

### 程序分析

程序分析是指自动分析一个程序的包括正确性、安全性和性能等特征的过程[^1]。可以用于编译优化、提供告警信息等。



### 静态程序分析

静态程序分析是指不必运行程序就能对程序进行的分析[^2]。

它的一些应用场景如下[^3]：

- 程序优化。要想优化编译器，就需要分析被编译的程序的诸多性质（如是否存在dead code，某变量的值是否依赖输入等）。
- 程序正确性分析。程序测试只能说明程序存在bug，但正确性分析要求证明bug不存在，这要求对程序的诸多性质进行分析（如数据是否始终不越界、是否会抛出异常、并发情况下是否有数据竞争等）。
- 程序开发。现代IDE使用静态程序分析来支持代码调试、代码重构、代码理解，辅助代码开发。

静态分析方法包括但不限于：数据流分析、抽象解释、符号分析、类型分析、控制流分析、指针分析等[^2][^3]。



### 动态程序分析

动态程序分析是指分析运行中程序的性质[^4]。它使用程序在运行时或运行后获取的信息，对程序的性质进行分析，分为online和offline：online是指在程序运行过程中分析程序行为，offline是指记录程序运行行为，在运行结束后再进行分析[^5]。

动态程序分析的技术可以分为三类[^6]：

- 程序插桩。包括修改源码、修改机器码、修改字节码。后两者根据是否在运行时插桩，都可以分为静态和动态两种。
- 虚拟机profiling。使用特定虚拟机提供的Profiling工具。如针对Java SDK的JPDA。它们以接口（如JPDA的JVMTI）的形式提供服务，Profiler插件的开发者只需实现接口即可。
- AOP。使用面向切面编程，从编程语言的高级层次，对程序的profiling可以被抽象为一个包含point-cuts和advice的aspect。



### 动态/静态程序分析的区别

两者的区别见下表[^6]：

 ![image-20230628114144762](pics/What.assets/image-20230628114144762.png)





## 参考文献

[^1]: Nielson, F., Nielson, H. R., & Hankin, C. (2015). Principles of program analysis. Springer.
[^2]: Wögerer, W. (2005). *A survey of static program analysis techniques*. Tech. rep., Technische Universität Wien.
[^3]: Møller, A., & Schwartzbach, M. I. (2012). Static program analysis. *Notes. Feb*.
[^4]: Ball, T. (1999). The concept of dynamic analysis. *ACM SIGSOFT Software Engineering Notes*, *24*(6), 216-234.
[^5]: Jackson, D., & Rinard, M. (2000, May). Software analysis: A roadmap. In *Proceedings of the Conference on the Future of Software Engineering* (pp. 133-145).
[^6]: Gosain, A., & Sharma, G. (2015). A survey of dynamic program analysis techniques and tools. In *Proceedings of the 3rd International Conference on Frontiers of Intelligent Computing: Theory and Applications (FICTA) 2014: Volume 1* (pp. 113-122). Springer International Publishing.
