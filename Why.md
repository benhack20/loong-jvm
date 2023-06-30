# Why

    Why
      为什么研究动态程序分析
        静态程序分析的适用场景和局限性
          o1 o2 o3 编译优化选项都做了什么
          缺少运行时信息有什么问题
        动态程序分析的适用场景和局限性
          jit编译优化为什么更适合使用动态程序分析
          额外开销 实现难度 优化难度 编译系统复杂性

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



## 动态程序分析

### 1. JIT编译优化



### 2. 动态程序分析的局限性





## 参考文献

[^1]: *Options That Control Optimization.* retrieved June, 2023, from [Optimize Options (Using the GNU Compiler Collection (GCC))](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#Optimize-Options) 
[^2]: Møller, A., & Schwartzbach, M. I. (2012). Static program analysis. *Notes. Feb*.
[^3]: Kozen, D. C. (2006). *Theory of computation* (Vol. 170). Heidelberg: Springer.
[^4]: Ball, T. (1999). The concept of dynamic analysis. *ACM SIGSOFT Software Engineering Notes*, *24*(6), 216-234.
[^5]: Gosain, A., & Sharma, G. (2015). A survey of dynamic program analysis techniques and tools. In *Proceedings of the 3rd International Conference on Frontiers of Intelligent Computing: Theory and Applications (FICTA) 2014: Volume 1* (pp. 113-122). Springer International Publishing.