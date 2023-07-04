# How

[TOC]

## 一、动态程序分析方法

动态程序分析的应用场景可以大致分为两类：动态编译优化，动态软件分析。根据应用场景的不同，动态程序分析所需要获取的数据、获取数据的方法、分析的流程都有所区别。下面针对这两个场景分别进行分析。

### 动态编译优化

#### 1. 分析角度

为了实现高性能的Java虚拟机和JIT动态编译，需要利用在线收集的程序运行信息实现一个动态编译优化系统，并在编译开销和性能提升之间做出权衡[^1]。

下面分析几个常见的Java动态编译优化系统，它们都使用了某种的自动化、Profile数据驱动的自适应编译优化机制。可以从下面三个角度对这些编译系统进行分析[^2]：

1. 该系统是仅使用了编译的方法，还是也使用了一个解释器来允许解释执行和代码编译的混合模式？
2. 该系统是如何动态地监控应用程序，从而将某方法的编译优化等级进行提升的？
3. 该系统收集了哪些在线运行信息来供更高层优化机制使用？以及是如何收集的？

#### 2. 实例

-  Intel Open Runtime Platform (ORP)[^3]。它只使用了编译的方法，没有解释器。动态编译优化采取了两级模式：一个快速代码生成器，和一个优化编译器。重编译优化的触发有两种方式：

  	1. 插入代码来检测计数器的值。当计数器的值到达某个阈值后，代码会在执行线程内跳至重编译例程来进行编译优化。
  	1. 使用一个单独的线程来扫描计数器，寻找重编译的候选者，找到后和执行线程并行地进行编译优化。

  这两种方法都要在第一级编译代码的方法入口点和循环后向分支处插入计数器更新指令。这种插桩的缺点在于，虽然插桩代码不是在第二级编译代码中生成的，但它会导致持续的性能开销，除非插桩后的一级编译代码被确定为热点代码从而被重新编译。在那种大多数方法重要性都相近的程序中，这种方式下大多数代码都不会被优化，那么留在一级编译代码中的插桩代码就会严重影响性能。

  同时，也因为重编译生成的第二级编译代码不会被插桩，因此想要进一步优化编译后的代码是无法实现的。

- Jikes RVM （也叫Jalapeno）[^4]。它是一个用Java实现的Java虚拟机，只使用了编译的方法，没有解释器。采用多级编译框架，包括一个基础编译器和一个有三个优化等级的优化编译器，相比于非动态适应或单级的编译系统，它在启动阶段和稳定阶段都表现出很好的性能。该系统也使用了更先进的Profile-guided优化方法，使用了插桩采样的框架[^5]。为了采集分析数据，它使用了两种Profiling技术：

  1. 基于计数器的采样机制，用于找到代码中的热点方法。采样profiler在yield point (method prologues and loop back edges) 进行计数，利用了系统的线程准抢占式切换机制。
  2. 更复杂的插桩机制，用于收集热点方法的更多详细信息。

  但是由于采样贯穿于整个程序执行的生命周期，因此会有持续的底线开销。

- Java HotSpot Server[^6]。它使用了自适应的优化系统，并且包含了一个解释器，程序一开始就运行在解释器上。解释器使用了独立的计数器来统计方法调用数和loop back edges。当达到预设的阈值时就会将该方法或循环视为热点。同时，在解释执行的阶段，该系统还会在线收集接收者类型的Profile数据和进行类继承分析（CHA），用于代码优化。由于Profile信息是在早期的解释执行阶段收集的，它们可能并不能代表长期运行的结果，因此容易发生误判。

### 动态软件分析

#### 1. 分析指标



#### 2. 分析手段





## 参考文献

[^1]: Ball, T. (1999). The concept of dynamic analysis. *ACM SIGSOFT Software Engineering Notes*, *24*(6), 216-234.
[^2]: Suganuma, T., Yasue, T., Kawahito, M., Komatsu, H., & Nakatani, T. (2005). Design and evaluation of dynamic optimizations for a Java just-in-time compiler. *ACM Transactions on Programming Languages and Systems (TOPLAS)*, *27*(4), 732-785.
[^3]: Cierniak, M., Eng, M., Glew, N., Lewis, B., & Stichnoth, J. (2005). The Open Runtime Platform: a flexible high‐performance managed runtime environment. *Concurrency and Computation: Practice and Experience*, *17*(5‐6), 617-637.
[^4]: Burke, M. G., Choi, J. D., Fink, S., Grove, D., Hind, M., Sarkar, V., ... & Whaley, J. (1999, June). The Jalapeno dynamic optimizing compiler for Java. In *Proceedings of the ACM 1999 conference on Java Grande* (pp. 129-141).
[^5]: Arnold, M., & Ryder, B. G. (2001, May). A framework for reducing the cost of instrumented code. In *Proceedings of the ACM SIGPLAN 2001 conference on Programming language design and implementation* (pp. 168-179).
[^6]: Paleczny, M., Vick, C., & Click, C. (2001). The java {HotSpot™} server compiler. In *Java (TM) Virtual Machine Research and Technology Symposium (JVM 01)*.
