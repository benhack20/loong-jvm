# What
## 一、程序分析的定义

### 1. 程序分析

程序分析是指自动分析一个程序的包括正确性、安全性和性能等特征的过程[^1]。可以用于编译优化、提供告警信息等。



### 2. 静态程序分析

静态程序分析是指不必运行程序就能对程序进行的分析[^2]。

它的一些应用场景如下[^3]：

- 程序优化。要想优化编译器，就需要分析被编译的程序的诸多性质（如是否存在dead code，某变量的值是否依赖输入等）。
- 程序正确性分析。程序测试只能说明程序存在bug，但正确性分析要求证明bug不存在，这要求对程序的诸多性质进行分析（如数据是否始终不越界、是否会抛出异常、并发情况下是否有数据竞争等）。
- 程序开发。现代IDE使用静态程序分析来支持代码调试、代码重构、代码理解，辅助代码开发。

静态分析方法包括但不限于：数据流分析、抽象解释、符号分析、类型分析、控制流分析、指针分析等[^2][^3]。



### 3. 动态程序分析

动态程序分析是指分析运行中程序的性质[^4]。它使用程序在运行时或运行后获取的信息，对程序的性质进行分析，分为online和offline：online是指在程序运行过程中分析程序行为，offline是指记录程序运行行为，在运行结束后再进行分析[^5]。

动态程序分析的技术可以分为三类[^6]：

- 程序插桩。包括修改源码、修改机器码、修改字节码。后两者根据是否在运行时插桩，都可以分为静态和动态两种。
- 虚拟机profiling。使用特定虚拟机提供的Profiling工具。如针对Java SDK的JPDA。它们以接口（如JPDA的JVMTI）的形式提供服务，Profiler插件的开发者只需实现接口即可。
- AOP。使用面向切面编程，从编程语言的高级层次，对程序的profiling可以被抽象为一个包含point-cuts和advice的aspect。



### 4. 动态/静态程序分析的区别

两者的区别见下表[^6]：

 ![image-20230628114144762](pics/What.assets/image-20230628114144762.png)

关于精度问题，由于静态分析往往只能对性质做出估计，并且有可能考虑了许多实际运行中根本不会发生的路径，因此=可能出现太多false positive，而动态分析因为针对具体运行，因此不会出现这个问题，但随之而来的缺陷就是结论无法覆盖所有执行情况。

此外，动态分析的范围更大，能检测程序执行路径中相距很远的两者之间的语义关系，但是静态分析通常局限于较小的范围内[^4]。

---



##  二、程序分析的应用场景

### 1. 编译优化

#### 静态优化

编译静态优化和程序分析的关系在于：在编译器能够改进代码之前，它必须在程序中找到更改后可以提升运行性能的点，并且编译器必须证明在这些点更改代码是安全的。这两项任务都需要更深入地理解代码。为了定位程序中的优化点并证明这些优化的合理性，编译器会使用某种形式的静态分析[^7]。

在编译优化的不同阶段，程序分析都发挥重要作用[^8]：比如，在编译早期阶段的优化方法中，常量折叠、标量替代、代数化简与重关联需要对程序进行分析，数值编号、复制传递、稀疏条件常数传播等需要依赖数据流分析来保证有效性和正确性。之后，在进行冗余消除的过程中，公共子表达式消除、循环不变代码外提、死码消除等也需要数据流分析[^9]。

#### 动态优化

由于动态语言（如java）在执行时进行及时编译，因此JIT编译器可以使用运行过程中收集的profile信息进行动态编译优化[^10]。

比如，在代码运行的过程中根据代码被调用执行的频率收集代码运行的“热点”，然后针对这些热点进行编译优化，提升整体性能[^11]。

动态分支预测需要通过动态收集和分析分支指令的执行历史、监测每个分支指令的执行结果，预测分支是被正确预测还是错误预测[^12]。这种程序分析技术涉及到对程序执行过程的实时追踪和记录，以便构建预测模型并根据历史执行结果进行准确的预测。

再比如，分层编译也利用运行时信息。它分为多个编译层次，每个层次都具有不同的编译策略和优化程度。在开始阶段，程序会经过解释执行或者轻量级编译（例如 JIT 编译）来尽快启动。随着程序的运行，一旦检测到某些代码被频繁执行，它会将这些代码升级到更高层次的编译阶段，优化技术会更加充分地使用[^13]。

相比于静态优化，动态优化利用了程序运行时的反馈信息，有如下优势[^14]：

- 突破了静态优化无法推测动态运行信息的限制。
- 当条件变化时可以随时调整、恢复策略。
- 运行时动态绑定使得软件系统更加灵活可变。



### 2. 程序安全

#### 可靠性分析



#### 安全性分析



### 3. 程序理解





## 三、动态程序分析相关研究进展

### 1. 主要研究机构



### 2. 研究方向和趋势







## 参考文献

[^1]: Nielson, F., Nielson, H. R., & Hankin, C. (2015). Principles of program analysis. Springer.
[^2]: Wögerer, W. (2005). *A survey of static program analysis techniques*. Tech. rep., Technische Universität Wien.
[^3]: Møller, A., & Schwartzbach, M. I. (2012). Static program analysis. *Notes. Feb*.
[^4]: Ball, T. (1999). The concept of dynamic analysis. *ACM SIGSOFT Software Engineering Notes*, *24*(6), 216-234.
[^5]: Jackson, D., & Rinard, M. (2000, May). Software analysis: A roadmap. In *Proceedings of the Conference on the Future of Software Engineering* (pp. 133-145).
[^6]: Gosain, A., & Sharma, G. (2015). A survey of dynamic program analysis techniques and tools. In *Proceedings of the 3rd International Conference on Frontiers of Intelligent Computing: Theory and Applications (FICTA) 2014: Volume 1* (pp. 113-122). Springer International Publishing.
[^7]: Cooper, K. D., & Torczon, L. (2011). *Engineering a compiler*. Elsevier.
[^8]: Muchnick, S. (1997). *Advanced compiler design implementation*. Morgan kaufmann.
[^9]: Kennedy, K. (1979). *A survey of data flow analysis techniques*. IBM Thomas J. Watson Research Division.
[^10]: Suganuma, T., Yasue, T., Kawahito, M., Komatsu, H., & Nakatani, T. (2001). A dynamic optimization framework for a Java just-in-time compiler. *ACM SIGPLAN Notices*, *36*(11), 180-195.
[^11]: Paleczny, M., Vick, C., & Click, C. (2001, April). The java hotspottm server compiler. In *Proceedings of the Java Virtual Machine Research and Technology Symposium* (Vol. 1, pp. 1-12).
[^12]: Mittal, S. (2019). A survey of techniques for dynamic branch prediction. *Concurrency and Computation: Practice and Experience*, *31*(1), e4666.
[^13]: Jantz, M. R., & Kulkarni, P. A. (2013). Exploring single and multilevel JIT compilation policy for modern machines. *ACM Transactions on Architecture and Code Optimization (TACO)*, *10*(4), 1-29.
[^14]: Smith, M. D. (2000, January). Overcoming the challenges to feedback-directed optimization (keynote talk). In *Proceedings of the ACM SIGPLAN workshop on Dynamic and adaptive compilation and optimization* (pp. 1-11).