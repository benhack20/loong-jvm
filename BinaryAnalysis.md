# 针对二进制可执行文件进行分析

## 基于硬件性能计数器的性能分析
### 基本原理
硬件性能计数器（Hardware Performance Counters，简称 HPCs）是现代微处理器中被设计用于监测处理器行为的特殊电路结构。[^1]

HPCs 通常是可编程的，以实现对不同的预定义性能事件（Performance Event）进行周期性采样。[^2]

例如在微结构为  Sandy Bridge  的 Intel Core i7 处理器中，就存在名为性能监测单元（Performance Monitor Unit，简称 PMU）的硬件设施，其中包含 3 个可编程的 HPCs 组，每组包含 4 个可以监测并统计不同性能事件的 HPCs。[^3]

HPCs 所采集到的数据可以被用于分析处理器、操作系统以及应用程序的执行状况，进而

### 局限性
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

[^1]: V. M. Weaver, D. Terpstra and S. Moore, "Non-determinism and overcount on modern hardware performance counter implementations," 2013 IEEE International Symposium on Performance Analysis of Systems and Software (ISPASS), Austin, TX, USA, 2013, pp. 215-224, doi: 10.1109/ISPASS.2013.6557172.
[^2]: D. Zaparanuks, M. Jovic and M. Hauswirth, "Accuracy of performance counter measurements," 2009 IEEE International Symposium on Performance Analysis of Systems and Software, Boston, MA, USA, 2009, pp. 23-32, doi: 10.1109/ISPASS.2009.4919635.
[^3]: Intel 64 and IA-32 Architectures Software Developer’s Manual: Volume 3. https://www.intel.com/content/www/us/en/architecture-and-technology/64-ia-32-architectures-software-developer-system-programming-manual-325384.html.
