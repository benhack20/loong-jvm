# 针对二进制可执行文件进行分析

## 基于硬件性能计数器的性能分析

### 基本原理

硬件性能计数器（Hardware Performance Counters，简称 HPCs）是一种普遍存在于现代微处理器内部（on-chip）的特殊寄存器。[^1]

HPCs 通常是可编程的，其主要用途是根据指定的性能事件（Performance Event）和采样周期，来记录处理器、操作系统以及应用程序的执行状况。其中，性能事件既包括在微结构层面定义的分支预测成功率、缓存命中率、指令周期、指令数量等硬件事件（Hardware Event），也包括在操作系统和应用层面定义的上下文切换、函数调用、非对齐访存、缺页错误等软件事件（Software Event）。[^2][^3]

基于 HPCs 的性能分析工具的工作过程如下：[^4]

### 案例
Oprofile、PAPI、VTune、Perf

## 基于模拟器的性能分析
### 案例
QEMU

## 基于二进制插桩的性能分析
### 案例
Gprof、DynamoRIO、Valgrind、Pin

## 性能分析技术对比

## 参考文献

[^1]: Weaver, Vincent M., Dan Terpstra, and Shirley Moore. "Non-determinism and overcount on modern hardware performance counter implementations." _2013 IEEE International Symposium on Performance Analysis of Systems and Software (ISPASS)_. IEEE, 2013.
[^2]: Khoshbakht, Saman, and Nikitas Dimopoulos. "A new approach to detecting execution phases using performance monitoring counters." _Architecture of Computing Systems-ARCS 2017: 30th International Conference, Vienna, Austria, April 3–6, 2017, Proceedings 30_. Springer International Publishing, 2017.
[^3]: Yang, Yihao, et al. "Exploration and Exploitation of Hidden PMU Events." _arXiv preprint arXiv:2304.12072_ (2023).
[^4]: Zaparanuks, Dmitrijs, Milan Jovic, and Matthias Hauswirth. "Accuracy of performance counter measurements." _2009 IEEE International Symposium on Performance Analysis of Systems and Software_. IEEE, 2009.
