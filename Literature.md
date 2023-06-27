# 文献阅读

## A Survey of Dynamic Program Analysis Techniques and Tools [^1]

### 一、对比

相比静态分析，动态分析的优势：

- 能分析面向对象语言的运行时特性（如动态绑定，多态，线程）。
- 更加精确。

缺点是需要程序运行起来，因此只针对特定运行，且开销较大。

### 二、技术分类

#### 1. Instrumentation Based

根据Instrument时机的不同，分为三类：

- **Source Code Instrumentation**。在源码中插入修改，通常利用一些元编程框架（比如Proteus，DMS）。优点是针对性强，缺点是和目标语言紧密相关，处理具体的语言特性时会有问题。

- **Binary Instrumentation**。更改或重写已经编译好的机器码。分为两类：
  - 静态：调用库和API，重写二进制码。如EEL，ATOM。
  - 动态：在程序已经被加载进内存后、执行前。如MDL，DynInst。优点是不需要重新编译、链接、运行，更灵活。

- **Bytecode Instrumentation**。对象是已经编译好的字节码，更难实现，但是记录更全面。分为两类：
  - 静态：离线更改编译好的代码，如BCEL，ASM，Javaassist。无法Instrument动态生成和加载的代码。
  - 动态：在程序运行时在线进行Instrument，如BIT，IBM的Jikes Bytecode Toolkit。

#### 2. VM Profiling Based

使用特定虚拟机提供的Profiling工具（尤其是分析memory和heap的使用）。如针对.NET框架的Microsoft CLR Profiler，针对Java SDK的JPDA。它们以接口（如JPDA的JVMTI）的形式提供服务，Profiler插件的开发者只需实现接口即可。

SpecJVM是一个用于黑盒测试的Benchmark。

#### 3. Aspect Oriented Programming

无需添加Instrumentation Code，因为它是AOP的内在属性。

AOP引入了这些概念：aspect，join-point，point-cut，advice。因此对程序的profiling可以被抽象为一个包含point-cuts和advice的aspect。

C++和Java都有aspect-oriented extensions。也有框架使用AOP来支持对字节码的Instrumentation。

缺点是额外掌握AOP框架费时费力，并且无法profile方法内部情况。优点是可以提高code instumentation抽象级别（编程语言级别），并且运行时开销更小，因此越来越流行。

> PS：我没有接触过AOP（面向切面编程），所以还不是很懂这里具体的做法和意义。 



[^1]: A. Gosain and G. Sharma, “A survey of dynamic program analysis techniques and tools,” presented at the Proceedings of the 3rd International Conference on Frontiers of Intelligent Computing: Theory and Applications (FICTA) 2014: Volume 1, 2015, pp. 113–122.



## Optimizing binary translation of dynamically generated code[^2]

按照上文的分类方法，本文探讨的binary translation可以应用于动态的Binary Instrumentation。同时，通过优化二进制翻译，论文中介绍的方法可以提高动态程序分析工具的性能，更准确地分析和监测这些代码的行为。而自动推断技术则可以减少对用户工具链的干扰，使动态程序分析工具更加稳定和可靠。

本文介绍了两种优化二进制翻译（DBT）的方法，以提高即时编译器（JIT）和其他动态代码生成器的性能：

- 方法一，使用高效的源代码注释系统，允许开发人员标记动态代码区域并识别其中的代码更改。
- 方法二，是通过自动推断技术，自动检测JIT的存在并对其写指令进行翻译一致性操作。这些方法在DynamoRIO中实现，并在JIT应用程序上展示了高达7.3倍的性能改进。



[^2]: B. Hawkins, B. Demsky, D. Bruening, and Q. Zhao, “Optimizing binary translation of dynamically generated code,” presented at the 2015 IEEE/ACM International Symposium on Code Generation and Optimization (CGO), 2015, pp. 68–78.



## 其他相关文献：

- [Evaluation of Dynamic Analysis Tools for Software Security](https://www.semanticscholar.org/paper/Evaluation-of-Dynamic-Analysis-Tools-for-Software-Lescisin-Mahmoud/1a9beb24129f6dcfe45b53b344fe54bc569ed81d)
  - 2018年，比较了用于软件安全的动态分析工具。
  - 主要针对两方面：内存安全和输入验证。

- [A dynamic size measure for object oriented software](https://www.semanticscholar.org/paper/A-dynamic-size-measure-for-object-oriented-software-Gosain-Sharma/f2d951183baac0b0b1f1f181dae7d88d292a3a7e)
  - 动态分析面向对象的软件的size。
  - 使用AspectJ，即Java的Aspect Oriented Programming。

- [Time-Aware Dynamic Binary Instrumentation](https://www.semanticscholar.org/paper/Time-Aware-Dynamic-Binary-Instrumentation-Arafa/1a7a3382b2fffb0695cdcef462a0dcec0358b779)
  - 使用动态binary instrumentation。
  - 对时序有要求的实时程序，将instrumentation的开销限制在一定范围，同时尽可能满足更高的覆盖率。
- [Dynamic Weaving of ASPECTs in C/C++ using PIN](https://www.semanticscholar.org/paper/Dynamic-Weaving-of-ASPECTs-in-C-C%2B%2B-using-PIN-Chatterjee-Bose/20d5e57566fa237474520cd826cea324cbde50f1)
  - 使用动态binary instrumentation。
  - 对ASPECTs进行进一步抽象，使使用者更不必考虑太多实现细节。
- [Machine Learning-Based Analysis of Program Binaries: A Comprehensive Study](https://www.semanticscholar.org/paper/Machine-Learning-Based-Analysis-of-Program-A-Study-Xue-Sun/300be38e8eb24178902e193b81f4a67ab8424d61)
  - 2019年，探讨机器学习在程序分析中的作用。

- [Dynamic Software Metrics for Object Oriented Software: A Review](https://www.semanticscholar.org/paper/Dynamic-Software-Metrics-for-Object-Oriented-A-Gosain-Sharma/cd5fed2cd4f64fb72df82b1733eb7d82e13d5a3d)
  - 2015年，和survey作者相同。
  - 主要侧重metrics，之前那篇侧重tools和techniques。