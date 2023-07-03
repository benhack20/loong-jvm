# Why

[TOC]

## 一、静态程序分析

在`What.md`中已经分析了静态程序分析的应用场景，下面以gcc编译优化标志为例说明静态程序分析在编译优化中的应用。

### 1. gcc编译优化选项

根据gcc官方文档[^1]，如果没有任何编译优化，那么编译器的目标是“减少编译时间并让调试能够输出预期的结果”；打开编译优化选项后，编译器会尝试提升代码性能或缩小代码体积，代价就是牺牲了编译时间和调试程序的能力。

#### -O或-O1

目的是减小代码的体积和运行时间，但不会执行任何需要很长编译时间的优化。具体来说，该选项打开了下面的优化标志，以下是各个优化标志的作用[^1]：

| 优化标志                       | 作用                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| -fauto-inc-dec                 | 在地址自增和自减操作中使用较简洁的机器指令。                 |
| -fbranch-count-reg             | 使用“自减分支”指令简化用于分支判断的指令序列                 |
| -fcombine-stack-adjustments    | 通过合并堆栈调整操作，减少代码中不必要的堆栈操作次数。       |
| -fcompare-elim                 | 根据流程分析来消除冗余的比较操作。                           |
| -fcprop-registers              | 在寄存器之间传播常量值，减少内存操作次数。                   |
| -fdce                          | 消除未使用的变量和代码，减少程序中的死代码。                 |
| -fdefer-pop                    | 优化函数调用中的栈操作顺序，以减少弹出栈数据的指令次数。     |
| -fdelayed-branch               | 将条件分支指令移动到更远处执行，以提高指令流水线的效率。     |
| -fdse                          | 删除死存储器读写，并通过寄存器传播值来优化代码。             |
| -fforward-propagate            | 在编译时进行常量传播和表达式求值，以减少运行时的计算。       |
| -fguess-branch-probability     | 根据控制流分析猜测分支的概率，以优化代码布局和指令流水线效率。 |
| -fif-conversion                | 将条件跳转转换为没有分支的等价指令，包括conditional moves, min, max, set flags, abs等。 |
| -fif-conversion2               | 使用条件执行将条件跳转转换为没有分支的等价指令。             |
| -finline-functions-called-once | 对只被调用一次的函数进行内联展开，减少函数调用的开销。       |
| -fipa-modref                   | 基于可达性分析推导模块间的变量引用关系，以优化代码。         |
| -fipa-profile                  | 根据函数调用图和profile信息进行优化，以提高程序的性能。      |
| -fipa-pure-const               | 基于可达性分析，推导哪些函数可以安全地进行纯函数优化（即只依赖于输入参数）和常量传播。 |
| -fipa-reference                | 优化不会逃出编译单元的静态变量。                             |
| -fipa-reference-addressable    | 进一步优化变量引用关系，优化只读、只写或不可达的静态变量。   |
| -fmerge-constants              | 合并可合并的常量，减少内存占用。                             |
| -fmove-loop-invariants         | 将循环中的不变式移出循环，以减少重复计算。                   |
| -fmove-loop-stores             | 通过将循环内存写操作移出循环，减少循环迭代中的内存操作。     |
| -fomit-frame-pointer           | 省略函数框架指针，以减少函数调用的开销。                     |
| -freorder-blocks               | 重新排序基本块，以减少分支次数或提升代码局部性。             |
| -fshrink-wrap                  | 对函数进行收缩封装，只保存使用的寄存器状态，以减少函数调用时的寄存器操作。 |
| -fshrink-wrap-separate         | 进一步对函数进行分离收缩封装，以降低函数调用时的寄存器操作。 |
| -fsplit-wide-types             | 将宽类型分割为较窄类型，以提高内存访问效率。                 |
| -fssa-backprop                 | 在静态单赋值表达式中反向传播，优化变量使用和计算。           |
| -fssa-phiopt                   | 通过处理 phi 节点，进行静态单赋值(SSA)形式的代码优化。       |
| -ftree-bit-ccp                 | 使用传播常量和复制传播进行位级操作的优化。                   |
| -ftree-ccp                     | 运用简单的代码传播和常量传播优化进行计算。                   |
| -ftree-ch                      | 使用复制传播、合并常量和比较表达式优化进行计算。             |
| -ftree-coalesce-vars           | 合并局部变量，以减少内存访问次数。                           |
| -ftree-copy-prop               | 进行复制传播优化，减少内存读取次数和赋值操作。               |
| -ftree-dce                     | 删除未使用的代码和变量，减少程序大小和运行时开销。           |
| -ftree-dominator-opts          | 根据支配关系进行代码优化，提高执行效率。                     |
| -ftree-dse                     | 通过删除未使用的内存读写操作，减少不必要的访存。             |
| -ftree-forwprop                | 在编译时进行常量传播和表达式求值，减少运行时计算。           |
| -ftree-fre                     | 使用复制传播、表达式求值和条件消除优化进行计算。             |
| -ftree-phiprop                 | 通过 phi 节点进行复制传播和条件消除优化，减少内存访问次数。  |
| -ftree-pta                     | 利用指针类型分析优化指针运算。                               |
| -ftree-scev-cprop              | 基于可依赖性分析进行表达式求值和条件消除优化。               |
| -ftree-sink                    | 将循环不变式移出循环，以减少重复计算。                       |
| -ftree-slsr                    | 对溢出检查进行优化，减少重复计算。                           |
| -ftree-sra                     | 对移位操作进行优化，以提高执行效率。                         |
| -ftree-ter                     | 使用条件消除和复制传播进行计算优化。                         |
| -funit-at-a-time               | 允许整个编译单元的最优化，而不是逐个函数地进行优化。         |

#### -O2

几乎执行所有不涉及“用空间换时间”的优化选项，相比于-O1，在增加生成代码性能的同时也增加了编译时间。具体来说，该选项相比-O1额外打开了下面的优化标志，以下是各个优化标志的作用[^1]：

| 优化标志                              | 作用                                             |
| ------------------------------------- | ------------------------------------------------ |
| -falign-functions                     | 对函数进行对齐                                   |
| -falign-jumps                         | 为跳转指令对齐                                   |
| -falign-labels                        | 为分支目标标签对齐                               |
| -falign-loops                         | 为循环对齐                                       |
| -fcaller-saves                        | 使用寄存器传递参数来保存调用者的寄存器           |
| -fcode-hoisting                       | 通过提升可移动的计算到循环外部来进行代码优化     |
| -fcrossjumping                        | 通过交叉跳转来减少重复代码                       |
| -fcse-follow-jumps                    | 跟随跳转语句进行公共子表达式消除                 |
| -fcse-skip-blocks                     | 跳过基本块以进行更强大的公共子表达式消除         |
| -fdelete-null-pointer-checks          | 删除空指针检查，提高代码执行效率                 |
| -fdevirtualize                        | 对虚函数进行优化，将虚函数调用转换为直接函数调用 |
| -fdevirtualize-speculatively          | 通过猜测来使用虚函数调用的非虚函数版本           |
| -fexpensive-optimizations             | 打开所有昂贵的优化                               |
| -ffinite-loops                        | 假设循环不会无限执行                             |
| -fgcse                                | 进行公共子表达式消除                             |
| -fgcse-lm                             | 更激进的公共子表达式消除                         |
| -fhoist-adjacent-loads                | 提升相邻的加载指令                               |
| -finline-functions                    | 内联函数调用                                     |
| -finline-small-functions              | 内联小的函数调用                                 |
| -findirect-inlining                   | 对间接调用进行内联优化                           |
| -fipa-bit-cp                          | 基于位操作的常量传播                             |
| -fipa-cp                              | 函数间常量传播                                   |
| -fipa-icf                             | 函数间的冗余代码消除                             |
| -fipa-ra                              | 函数间寄存器分配优化                             |
| -fipa-sra                             | 函数间寄存器分配和重排优化                       |
| -fipa-vrp                             | 启用值范围传播                                   |
| -fisolate-erroneous-paths-dereference | 隔离错误路径以避免空指针解引用                   |
| -flra-remat                           | 重新材料化最近使用的值                           |
| -foptimize-sibling-calls              | 优化兄弟函数调用                                 |
| -foptimize-strlen                     | 优化strlen函数                                   |
| -fpartial-inlining                    | 部分内联                                         |
| -fpeephole2                           | 启用更强的微调                                   |
| -freorder-blocks-algorithm=stc        | 使用顺序表的算法重新排序基本块                   |
| -freorder-blocks-and-partition        | 重新排序基本块并进行分区                         |
| -freorder-functions                   | 重新排序函数                                     |
| -frerun-cse-after-loop                | 循环后运行公共子表达式消除                       |
| -fschedule-insns                      | 指令调度                                         |
| -fschedule-insns2                     | 更强大的指令调度                                 |
| -fsched-interblock                    | 在基础块之间进行指令调度                         |
| -fsched-spec                          | 使用特殊调度策略                                 |
| -fstore-merging                       | 合并存储操作                                     |
| -fstrict-aliasing                     | 执行严格的别名规则                               |
| -fthread-jumps                        | 在循环中进行线程跳转                             |
| -ftree-builtin-call-dce               | 删除无用的内建函数调用                           |
| -ftree-loop-vectorize                 | 循环向量化                                       |
| -ftree-pre                            | 预优化树                                         |
| -ftree-slp-vectorize                  | 向量化SLP（超级本地性）组                        |
| -ftree-switch-conversion              | 转换开关语句                                     |
| -ftree-tail-merge                     | 寻找相同代码序列，将一个替换为向另一个的跳转     |
| -ftree-vrp                            | 值范围传播                                       |
| -fvect-cost-model=very-cheap          | 启用very-cheap的向量化代价模型                   |

#### -O3

在-O2的基础上更进一步，该选项相比-O2额外打开了下面的优化标志，以下是各个优化标志的作用：

以下是与 `-O3` 优化选项额外打开的优化标志及其作用的表格[^1]：

| 优化标志                    | 作用                                                         |
| --------------------------- | ------------------------------------------------------------ |
| -fgcse-after-reload         | 在寄存器分配之后进行公共子表达式消除，提高代码中重复计算的效率。 |
| -fipa-cp-clone              | 使用过程分析进行克隆函数优化，减少函数调用的开销。           |
| -floop-interchange          | 交换循环中的迭代次序，优化数据访问模式以提高缓存的命中率。   |
| -floop-unroll-and-jam       | 展开循环并将多个并行的迭代结合在一起，提高指令级并行和缓存局部性。 |
| -fpeel-loops                | 对循环进行部分展开，以减少分支和循环迭代的次数。             |
| -fpredictive-commoning      | 预测公共子表达式并将其保存在寄存器中，避免重复计算。         |
| -fsplit-loops               | 将循环拆分为多个较小的循环，以提高指令级并行性和缓存命中率。 |
| -fsplit-paths               | 拆分循环路径以改善指令级并行性，从而提高程序执行效率。       |
| -ftree-loop-distribution    | 在循环内部进行有关循环分布的代码转换，以增加指令级并行和缓存局部性。 |
| -ftree-partial-pre          | 部分预先计算，将表达式的结果存储在临时变量中以减少重复计算。 |
| -funswitch-loops            | 对循环进行开关优化，根据循环迭代次数使用条件语句或展开循环。 |
| -fvect-cost-model=dynamic   | 动态向量化成本模型，根据运行时的数据特征来评估向量化的收益。 |
| -fversion-loops-for-strides | 为循环的步长版本生成更高效的代码，以改善循环迭代指令的局部性。 |

### 2. 静态程序分析的局限性

理论上，一个程序分析器的作用就是将其他程序作为输入并确定该程序是否具有某种性质[^2]。然而，Rice定理指出所有关于程序输出行为性质的问题都是图灵不可判定的[^3]，因此程序分析只能获得问题的近似解。

实践中，更加精确的程序分析需要消耗大量的时间或空间成本（正如gcc编译优化选项从-O1到-O3的时间、空间开销越来越大），因此精度和成本的权衡是程序分析本质上的局限。由于静态分析不需要运行程序就可以进行分析，开销相对较少，因此获得的信息也少，因此往往只能给出近似解，精确度不高[^4]。

当涉及到程序优化或可靠性分析时，有些必需的信息只能在运行中获得，比如分析动态语言（如java）的运行时特征（如动态绑定、多态、多线程等），静态程序分析无法获得这些信息[^5]。



## 二、动态程序分析

### 1. JIT编译优化

#### 概念

- AOT：代码编译发生在程序执行前，即load-time编译。
- JIT：代码编译发生在代码被运行时，可能编译所有或部分程序，即run-time编译[^10]。

以Java为例，具体来说[^11]，Java程序由类组成，这些类包含平台无关的字节码，JVM可以在许多不同的计算机体系结构上解释执行这些字节码。在运行时，JVM加载类文件，确定每个单独字节码的语义，并执行适当的计算。解释过程中额外的CPU和内存使用意味着Java应用程序的执行速度比本地应用程序慢。JIT编译器通过在运行时将字节码编译成本机代码来帮助提高Java程序的性能。

JIT编译器在默认情况下处于启用状态。当一个方法被编译后，JVM会直接调用该方法的编译代码，而不是对其进行解释执行。在实践中，方法不是在第一次调用时编译的。对于每个方法，JVM都会维护一个调用计数，该计数从预定义的编译阈值开始，每次调用该方法时都会递减。当调用计数达到零时，将触发该方法的JIT编译。因此，经常使用的方法是在JVM启动后不久编译的，而较少使用的方法则是在很久之后编译的，或者根本不编译。JIT编译阈值有助于提升性能的同时保证JVM快速启动。

#### JIT编译为何适合动态程序分析

由于动态编译的编译时间开销是在运行时而非运行前，因此需要谨慎地选择哪些方法需要编译以及什么时候编译它们。更具体地说，只有当编译所花费的额外时间可以被编译后代码获得的性能提升所补偿的时候，才可以选择对这个方法进行编译[^10]。这就要求动态地分析代码运行开销。

由于需要加载和编译字节码，JIT编译造成了初始执行阶段的“启动延迟”。一个JIT编译器需要在启动延迟和优化程度之间做出权衡。Sun的HotSpot JVM结合了解释执行和JIT编译，程序最开始被解释执行，从而获得较快的启动速度，之后针对被频繁执行的部分进行JIT编译优化，提升程序性能。JIT编译又有两种模式：Client模式通过执行较少的编译优化来实现较低的启动延迟，Server模式进行了大量的编译和优化，牺牲了启动时间但最大化了运行后的程序性能。这种分层编译的选择机制需要用到动态程序分析[^12]。

使用JIT编译时，虚拟机可以采集profile数据来理解和利用每次程序运行的行为，JIT编译器可以利用这些profile data来进行PGO（profile-guided optimization），从而为每一次程序的输入定制编译本地机器码，从而提升程序性能，并且还可以让虚拟机进行更为激进并可能不安全的投机式优化，这种编译优化后的代码可以在后续条件不满足时反编译回来[^6]。

#### Profile数据的作用

- 动态程序分析获得的Profile data可以被用来找到程序中被频繁执行的热点代码，这些信息可以被编译器用来聚焦于热码的编译和优化，比如很多java虚拟机使用选择编译，即只编译和优化热点代码，从而减小JIT的运行时开销[^7]。
- Profile数据还可以用来随机化、多样化冷代码（不常被执行的代码）来减小开销[^7]、提升JVM的代码缓存管理[^8]、在垃圾回收阶段提升堆数据的局部性[^9]等。



### 2. 动态程序分析的局限性

- 相比于静态程序分析，动态分析需要程序运行起来，增加了额外的运行时开销。同时，用于动态程序分析的插桩等操作也可能对程序的性能造成影响。
- 动态程序分析只对特定的运行有效，这既是它的优点（可以确保该执行路径是可达的），也造成了它无法适用于所有情况的局限性。
- 使用动态分析的编译系统设计和实现更加复杂，比如JIT编译的分层体系相比于AOT编译（一次编译，不再改变）更加复杂。





## 参考文献

[^1]: *Options That Control Optimization.* retrieved June, 2023, from [Optimize Options (Using the GNU Compiler Collection (GCC))](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#Optimize-Options) 
[^2]: Møller, A., & Schwartzbach, M. I. (2012). Static program analysis. *Notes. Feb*.
[^3]: Kozen, D. C. (2006). *Theory of computation* (Vol. 170). Heidelberg: Springer.
[^4]: Ball, T. (1999). The concept of dynamic analysis. *ACM SIGSOFT Software Engineering Notes*, *24*(6), 216-234.
[^5]: Gosain, A., & Sharma, G. (2015). A survey of dynamic program analysis techniques and tools. In *Proceedings of the 3rd International Conference on Frontiers of Intelligent Computing: Theory and Applications (FICTA) 2014: Volume 1* (pp. 113-122). Springer International Publishing.
[^6]: Wade, A. W., Kulkarni, P. A., & Jantz, M. R. (2017, June). AOT vs. JIT: impact of profile data on code quality. In *Proceedings of the 18th ACM SIGPLAN/SIGBED Conference on Languages, Compilers, and Tools for Embedded Systems* (pp. 1-10). 
[^7]: Homescu, A., Neisius, S., Larsen, P., Brunthaler, S., & Franz, M. (2013, February). Profile-guided automated software diversity. In *Proceedings of the 2013 IEEE/ACM International Symposium on Code Generation and Optimization (CGO)* (pp. 1-11). IEEE.
[^8]: Robinson, F. J., Jantz, M. R., & Kulkarni, P. A. (2016). Code cache management in managed language VMs to reduce memory consumption for embedded systems. *ACM SIGPLAN Notices*, *51*(5), 11-20.
[^9]: Huang, X., Blackburn, S. M., McKinley, K. S., Moss, J. E. B., Wang, Z., & Cheng, P. (2004). The garbage collection advantage: Improving program locality. *ACM SIGPLAN Notices*, *39*(10), 69-80.
[^10]: Suganuma, T., Yasue, T., Kawahito, M., Komatsu, H., & Nakatani, T. (2001). A dynamic optimization framework for a Java just-in-time compiler. *ACM SIGPLAN Notices*, *36*(11), 180-195.
[^11]: *The JIT Compiler.* Retrieved July, 2023, from [The JIT compiler - IBM Documentation](https://www.ibm.com/docs/en/sdk-java-technology/8?topic=reference-jit-compiler)
[^12]: *The Java HotSpot Performance Engine Architecture.* Retrieved July, 2023, from [The Java HotSpot Performance Engine Architecture (oracle.com)](https://www.oracle.com/java/technologies/whitepaper.html)