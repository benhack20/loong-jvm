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



## 动态程序分析文献

- Backes, M., Bugiel, S., Schranz, O., von Styp-Rekowsky, P., & Weisgerber, S. (2017, April). Artist: The android runtime instrumentation and security toolkit. In *2017 IEEE European Symposium on Security and Privacy (EuroS&P)* (pp. 481-495). IEEE.
  - 2017年，介绍一种基于编译器的插桩技术，针对安卓。
- M. Harman, & P. O'Hearn. (2018). From start-ups to scale-ups: Opportunities and open problems for static and dynamic program analysis. Paper presented at the *- 2018 IEEE 18th International Working Conference on Source Code Analysis and Manipulation (SCAM),* pp. 1-23. doi:10.1109/SCAM.2018.00009
  - 2018年，关于如何将程序静态、动态分析的成功应用到工业界的主旨演讲。
- ["dynamic program analysis" - Google 学术搜索](https://scholar.google.com/scholar?start=0&q="dynamic+program+analysis"&hl=zh-CN&scisbd=1&as_sdt=0,5)
  - 待看





## AOT vs. JIT: impact of profile data on code quality[^3]

### JIT编译和AOT编译

JIT编译可以在程序执行时动态地生成优化的本地代码，而AOT编译则是在软件安装时生成本地代码。然而，由于动态程序分析技术的使用，JIT编译优化更加适合动态程序分析，因为它可以利用当前运行时的profile数据来进行优化，而AOT编译则需要依赖于静态程序分析。 

### HotSpot JVM实验

使用了HotSpot JVM来进行实验，比较了AOT和JIT编译在不同profile数据下的性能表现。

- profile数据对于JIT编译优化的性能有着显著的影响，而AOT编译则无法获得这种优势。
- 即使只有很少的profile数据，也可以显著地提高生成的代码质量。

### Profile数据的特性

进一步探讨了profile数据的特性，以及如何最大化其对于PGO（Profile-Guided Optimization）的指导作用。

作者发现，profile数据的特性需要足够准确，以适应当前程序输入。其他的一些问题：

- 如何在无法进行在线分析的AOT系统中提取准确的profile数据，并根据不同的输入行为定制生成的二进制文件。

- 是否可以将程序行为分类为有限的行为类型，是否可以改进离线分析中的profile数据收集，以覆盖所有可能的程序行为，以及是否可以构建高级静态分析技术来提高离线分析输入的覆盖范围。

### 实现结果

使用创新的VM框架来探究profile数据的特性。

- 即使只有很少的profile数据，也可以显著提高生成的代码质量。
- 此外，profile数据的准确性对于PGO的最大潜力的实现至关重要。即使有大量的profile数据，如果数据不准确，也会对优化过程产生负面影响。

### 总结

传统的JIT编译模型可以利用当前运行时的profile信息来指导优化过程，从而生成高质量的本地代码。相比之下，AOT编译在生成代码时无法利用动态运行时的信息，因此无法像JIT编译那样进行精细的优化。

此外，profile数据的准确性对于优化过程的效果至关重要。即使有大量的profile数据，如果数据不准确，也会对优化过程产生负面影响。研究结果对于VM开发人员和研究人员构建综合利用AOT和JIT编译优势的编译系统具有重要的指导意义。



[^3]: Wade, A. W., Kulkarni, P. A., & Jantz, M. R. (2017, June). AOT vs. JIT: impact of profile data on code quality. In *Proceedings of the 18th ACM SIGPLAN/SIGBED Conference on Languages, Compilers, and Tools for Embedded Systems* (pp. 1-10).
