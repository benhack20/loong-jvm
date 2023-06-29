# 针对二进制可执行文件进行分析

## 基于性能计数器的性能分析

在计算机科学领域中，性能计数器（Performance Counter）指的是一种用于监测和记录计算机硬件或软件系统的性能和行为的组件[^1]，根据实现方式可将其分为硬件性能计数器（Hardware Performance Counter）和软件性能计数器（Software Performance Counter）。

其中，硬件性能计数器是普遍存在于现代通用微处理器内部（on-chip）的一组特殊的寄存器（Model Specific Registers，简称 MSR）[^2][^3]。一个典型的实现是 Intel 从奔腾（Pentium）系列处理器开始引入的性能监测计数器（Performance-Monitoring Counters，简称 PMC）[^4]。

而软件性能计数器则是指定义在操作系统内核或用户级别软件内部的特殊数据结构[^5][^6]。软件性能计数器既可以使用 PAPI[^7]、Perfctr[^8]、Perfmon2[^9] 等工具提供的硬件计数器映射接口实现，也可以是直接在软件层面定义的具有专门用途的实例（instance）[^10]。例如在 Linux 中，存在专门用于记录和修改系统运行时信息的 `/proc` 文件系统，可以通过 `cat /proc/stat` 查看从系统启动（boot）到当前时刻发生的上下文切换（ctxt）、启动进程（processes）、软件中断（softirq）等行为的数量[^11]，其中的部分数据使用内核中定义的软件性能计数器记录。

> 以 ctxt 数据的获取过程为例：每个 CPU 实例都会维护自己的运行队列数据结构体（Runqueue Data Structure），该结构体被定义在 `sched.h` 文件中，其中的 `nr_switches` 字段用于存储在当前 CPU 上发生过的上下文切换次数，这就是软件性能计数器的一种具体实现方式。当通过 `cat /proc/stat | grep ctxt` 查看全局上下文切换数据时，`show_stat()` 方法会调用 `kernel_stat.h` 文件中定义的 `nr_context_switches()` 方法，循环遍历所有的 `cpu_rq(i)->nr_switches` 并求和，最终打印出 ctxt 数据。

性能计数器的一个主要用途是根据指定的性能事件（Performance Event）和采样周期，来记录处理器、操作系统以及应用程序的执行状况。其中，性能事件既包括微结构级别的分支预测成功率、缓存命中率、指令执行周期、提交的指令数量等硬件事件（Hardware Event）[^12]，也包括在操作系统和应用层面定义的上下文切换、函数调用、非对齐访存、缺页错误等软件事件（Software Event）[^13]。

为了方便在软件层面设置要监听的硬件事件并获取对应的性能数据，在微处理器中需要提供能够封装性能事件分派、硬件性能计数器复位、硬件性能计数器溢出中断注册等功能的结构，该结构一般被称为性能监测单元（Performance Monitoring Unit，简称 PMU）[^14]。为了实现上述功能，PMU 内部至少需要包括用于捕获和分派事件的事件接口（Event interface）、硬件计数器及其控制器、中断接口（Interrupt interface）等核心组件，具体设计方案取决于 CPU 的应用场景[^15][^16]。以 Cortex-A72 中使用的 PMU 为例，其硬件结构如图 1 所示[^17]。

<div align="center">
<img src="https://documentation-service.arm.com/static/60368ce38f952d2e4134dc75"/>
<p>图1 ARMv8 PMUv3 的硬件结构图</p>
</div>

与微结构相对应的，在指令集中需要设计必要的 PMU 操作指令或编辑方式。例如：IA32 中提供的 RDPMC、RDTSC 等指令，以及在 ARMv8 中通过 MSR 或 MRS 指令修改 PMU 相关寄存器的值。但是这些指令都属于特权指令，在用户态使用时需要先陷入内核态提升特权等级，如果大量调用则会显著影响性能。因此，为了降低性能计数器的使用开销，在操作系统层面需要提供必要的性能监测基础设施。在 Linux 内核的 2.6.31 版本中，正式引入了 perf 工具和与之配套的 Linux 性能计数器（Performance Counters for Linux，简称 PCL）子系统，并在接下来的 2.6.32 版本中将其升级为 perf_events 子系统。

The perf_event interface differs from previous Linux performance counter implementations, primarily in the amount of functionality handled by the operating system kernel. Many of the tasks perf_event does in-kernel were previously done in userspace libraries, impacting measurement overhead.

典型的基于性能计数器的性能分析工具 perf 的工作过程如图 2 所示。

但基于性能计数器的性能分析方法也存在一定的局限性。首先，硬件性能计数器的配置过程较为繁琐，需要监听的硬件事件数量过多则需要配置复用[^19]，此外，不容易保证多线程读写同步，而且分析 MPI 程序非常困难，may not be programmable or readable from user-level code, and can not discriminate between events caused by different software threads. Various software infrastructures address this problem, providing access to per-thread counters from application code. However, such infrastructures incur a cost: the software instructions executed to access a counter, or to maintain a per-thread counter, may perturb that same counter. While this perturbation is presumably small, its significance depends on the specific measurement: it may be irrelevant for a marathon-length measurement, but it could significantly perturb the measurement of a sprint.[^18]

## 基于模拟器的性能分析
### 案例
QEMU

## 基于二进制插桩的性能分析
### 案例
Gprof、DynamoRIO、Valgrind、Pin

## 性能分析技术对比

## 参考文献

[^1]: Huffman, Clint. _Windows Performance Analysis Field Guide_. Elsevier, 2014.
[^2]: Sprunt, Brinkley. "The basics of performance-monitoring hardware." _IEEE Micro_ 22.4 (2002): 64-71.
[^3]: Weaver, Vincent M., Dan Terpstra, and Shirley Moore. "Non-determinism and overcount on modern hardware performance counter implementations." _2013 IEEE International Symposium on Performance Analysis of Systems and Software (ISPASS)_. IEEE, 2013.
[^4]: Intel Corporation. "22.37.5 - Performance-Monitoring Counters." _Intel® 64 and IA-32 Architectures Software Developer's Manual Volume 3B: System Programming Guide, Part 2_, September 2016, pp. 22-36. Intel Corporation.
[^5]: Weaver, Vincent M. "Self-monitoring overhead of the Linux perf_ event performance counter interface." _2015 IEEE International Symposium on Performance Analysis of Systems and Software (ISPASS)_. IEEE, 2015.
[^6]: Dimakopoulou, Maria, et al. "Reliable and efficient performance monitoring in linux." _SC'16: Proceedings of the International Conference for High Performance Computing, Networking, Storage and Analysis_. IEEE, 2016.
[^7]: S. Browne, J. Dongarra, N. Garner, G. Ho and P. Mucci, "A portable programming interface for performance evaluation on modern processors", _International Journal of High Performance Computing Applications_, vol. 14, no. 3, pp. 189-204, 2000.
[^8]: M. Pettersson, "The perfctr interface", 1999, [online] Available: http.z/user.it.uu.se/r-mikpe/linux/perfctr/2.6/.
[^9]: S. Eranian, "Perfmon2: a flexible performance monitoring interface for Linux", _Proc. 2006 Ottawa Linux Symposium_, pp. 269-288, Jul. 2006.
[^10]: Eberius, David, Thananon Patinyasakdikul, and George Bosilca. "Using software-based performance counters to expose low-level open MPI performance information." _Proceedings of the 24th European MPI Users' Group Meeting_. 2017.
[^11]: Bishop, Andrew M. "The/proc file system and procmeter." _Linux Journal_ 1997.36es (1997): 5-es.
[^12]: Yang, Yihao, et al. "Exploration and Exploitation of Hidden PMU Events." _arXiv preprint arXiv:2304.12072_ (2023).
[^13]: Khoshbakht, Saman, and Nikitas Dimopoulos. "A new approach to detecting execution phases using performance monitoring counters." _Architecture of Computing Systems-ARCS 2017: 30th International Conference, Vienna, Austria, April 3–6, 2017, Proceedings 30_. Springer International Publishing, 2017.
[^14]: Contreras, Gilberto, and Margaret Martonosi. "Power prediction for Intel XScale® processors using performance monitoring unit events." _Proceedings of the 2005 international symposium on Low power electronics and design_. 2005.
[^15]: Poister, Theodore H. "Performance monitoring." _Handbook of practical program evaluation_ 2 (2004): 99-125.
[^16]: Zheng, Shiying, et al. "Design of Low-Cost Micro-PMU Based on e-IpDFT." _The proceedings of the 16th Annual Conference of China Electrotechnical Society: Volume I_. Singapore: Springer Singapore, 2022.
[^17]: ARM, A. "Cortex®-a72 mpcore processor technical reference manual (revision r0p3)."
[^18]: Zaparanuks, Dmitrijs, Milan Jovic, and Matthias Hauswirth. "Accuracy of performance counter measurements." _2009 IEEE International Symposium on Performance Analysis of Systems and Software_. IEEE, 2009.
[^19]: V. Salapura, K. Ganesan, A. Gara, M. Gscwind, J. Sexton and R. Walkup, "Next-generation performance counters: Towards monitoring over thousand concurrent events", _Proc. IEEE International Symposium on Performance Analysis of Systems and Software_, pp. 139-146, Apr. 2008.
