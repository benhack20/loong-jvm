# 针对二进制可执行文件进行分析

## 基于性能计数器的性能分析

### 性能计数器的定义

在计算机科学领域中，性能计数器（Performance Counter）指的是一种用于监测和记录计算机硬件或软件系统的性能和行为的组件[^1]，根据实现方式可将其分为硬件性能计数器（Hardware Performance Counter）和软件性能计数器（Software Performance Counter）。

其中，硬件性能计数器是普遍存在于现代通用微处理器内部（on-chip）的一组特殊的寄存器（Model Specific Registers，简称 MSR）[^2][^3]。一个典型的实现是 Intel 从奔腾（Pentium）系列处理器开始引入的性能监测计数器（Performance-Monitoring Counters，简称 PMC）[^4]。

而软件性能计数器则是指定义在操作系统内核或用户级别软件内部的特殊数据结构[^5][^6]。软件性能计数器既可以使用 PAPI[^7]、Perfctr[^8]、Perfmon2[^9] 等工具提供的硬件计数器映射接口实现，也可以是直接在软件层面定义的具有专门用途的实例（instance）[^10]。例如在 Linux 中，存在专门用于记录和修改系统运行时信息的 `/proc` 文件系统，可以通过 `cat /proc/stat` 查看从系统启动（boot）到当前时刻发生的上下文切换（ctxt）、启动进程（processes）、软件中断（softirq）等行为的数量[^11]，其中的部分数据使用内核中定义的软件性能计数器记录。

> 以 ctxt 数据的获取过程为例：每个 CPU 实例都会维护自己的运行队列数据结构体（Runqueue Data Structure），该结构体被定义在 `sched.h` 文件中。其中的 `nr_switches` 字段用于存储在当前 CPU 上发生过的上下文切换次数，这可以被看作是软件性能计数器的一种具体实现方式。当通过 `cat /proc/stat | grep ctxt` 查看全局上下文切换数据时，`show_stat()` 方法会调用 `kernel_stat.h` 文件中定义的 `nr_context_switches()` 方法，循环遍历所有的 `cpu_rq(i)->nr_switches` 并求和，最终打印出 ctxt 数据。

### 性能计数器的基础设施

性能计数器的一个主要用途是根据指定的性能事件（Performance Event）和采样周期，来记录处理器、操作系统以及应用程序的执行状况。其中，性能事件既包括微结构级别的分支预测成功率、缓存命中率、指令执行周期、提交的指令数量等硬件事件（Hardware Event）[^12]，也包括在应用软件和操作系统层面定义的函数调用、上下文切换、缺页错误等软件事件（Software Event）[^13]。

为了方便在软件层面设置要监听的硬件事件并获取对应的性能数据，在微处理器中需要提供能够封装性能事件分派、硬件性能计数器复位、硬件性能计数器溢出中断注册等功能的结构，该结构一般被称为性能监测单元（Performance Monitoring Unit，简称 PMU）[^14]。为了实现上述功能，PMU 内部至少需要包括用于捕获和分派事件的事件接口（Event Interface）、硬件计数器及其控制器、中断接口（Interrupt Interface）等核心组件，具体设计方案取决于处理器的应用场景[^15][^16]。以 Cortex-A72 中使用的 PMU 为例，其硬件结构如图 1 所示[^17]。

<div align="center">
<img src="https://documentation-service.arm.com/static/60368ce38f952d2e4134dc75"/>
<p>图1 ARMv8 PMUv3 的硬件结构图</p>
</div>

与微结构相对应的，在指令集中需要设计必要的 PMU 编程指令。例如：在 IA32 中提供了能够读取某些 PMC 值的 RDPMC、RDTSC 等指令[^4]，以及在 ARMv8 中可以通过 MSR 或 MRS 指令读取或修改与 PMU 相关的特殊寄存器的值[^17]。然而，常见指令集的 PMU 编程指令均需要在特权模式下执行，这意味着在用户态软件中直接操作 PMU 将需要频繁地陷入内核态以提升特权等级，从而影响性能监测的效率[^5]。因此，为了降低应用程序使用性能计数器的开销，操作系统需要提供内核级别的性能监测基础设施。

在 Linux 内核的 2.6.31 版本中，社区正式将 Linux 性能计数器（Performance Counters for Linux）子系统[^18]的相关代码合入主线，并在后续版本中将其逐步演进为 perf_events 子系统[^19]。

相比于在用户空间中实现的性能计数器抽象接口（例如： PAPI[^7]），perf_events 将事件调度、计数器管理、多路复用等核心功能集中在内核处理，对外仅暴露 `perf_event_open()` 系统调用和必要的配置接口，并依托 sysfs 文件系统实现了对性能事件的设备实体化（Device Entries），从而能够使用 `ioctl()` 控制性能计数器的启动或停止，还可以通过 `read()` 或 `mmap()` 读取性能计数器的数据[^5]。此外，为了兼容不同的处理器，perf_events 还设计了架构兼容层（Architecture Specific），并且支持针对微结构中的每个 PMU 进行独立抽象，以实现更为精细的计数器管理[^6]。综上所述，perf_events 的设计结构如图 2 所示。

<div align="center">
<img src="https://ieeexplore.ieee.org/mediastore_new/IEEE/content/media/7875333/7876994/7877112/7877112-fig-1-source-large.gif"/>
<p>图2 内核子系统 perf_events 的结构示意图</p>
</div>

尽管相比于直接访问 PMU 甚至 PMC 的方法，使用 perf_events 进行性能分析会带来额外的监测开销（Measurement Overhead）[^19]。但在用户空间直接操作性能计数器，可能面临更高的安全风险[^20]。此外，将性能计数器的相关基础设施构建在内核中，还可以有效监测内核的运行时数据，从而实现更细粒度的性能事件分类[^21]。

在 perf_events 的初始化阶段，当前系统支持的性能事件会被根据类别抽象成不同的设备（Device）进行管理。可通过 `tree /sys/bus/event_source/devices/` 查看已挂载的事件源（Event Source）设备，每个事件源对应一类性能事件，具体内容取决于硬件规格和内核版本，但至少应该包含如下类别：

* cpu：基于硬件性能计数器统计的 CPU 相关性能事件，如缓存命中、分支预测等。
* software：基于软件性能计数器统计的底层（low-level）软件事件，如上下文切换、页错误等。
* tracepoint：用于跟踪和监测内核中的特定功能的事件，如系统调用、中断请求等。
* kprobe：通过 Kernel Probes Frameworks 自定义的内核动态追踪事件。
* uprobe：通过 User-Space Probes Frameworks 自定义的用户空间动态追踪事件。

其中，tracepoint 事件是基于静态分析的跟踪技术（Static Tracing）的一种具体实现方式，通过在内核源码中静态插桩（Static Instrumentation）来收集用于性能分析的运行时数据[^22]。而 kprobe 事件和 uprobe 事件则都属于基于动态分析的跟踪技术（Dynamic Tracing）的具体实现方式，可通过动态插桩（Dynamic Instrumentation）并注册对应的性能事件来实现性能监测[^23]。

### 基于性能计数器的性能分析工具

伴随 perf_events 子系统共同合入内核主线的 perf 工具[^18]，经过十余年的迭代演进，目前已经被广泛应用于程序分析、系统调优、性能测试等场景，是 Linux 软件生态中重要的性能分析工具（Profiler）之一[^21]。作为一款基于性能计数器的性能分析工具，perf 的核心业务逻辑是通过对性能计数器进行维护和管理，实现在运行时统计被监测的性能事件的触发情况，并根据收集的计数或采样数据生成分析结果[^19]。

<div align="center">
<img src="https://www.oss.kr/files/attach/images/654916/575/667/db587d4835d8ed965d17099f8209b75d.png"/>
<p>图3 性能分析工具 perf 的设计结构</p>
</div>

perf 的实现涉及用户空间、系统内核、硬件三个层级，其整体设计结构如图 3 所示。在用户空间中，通过 perf commands 可以选择要监测的性能事件，并设置数据的采集和分析方式[^24]。在内核中，perf_events 负责维护 tracepoint、kprobes 等基于软件性能计数器的性能事件的数据，同时不断地从 PMU 中获取硬件性能事件的计数值，并根据采样（sample）的精度需求，保存性能事件触发时刻的上下文信息[^19]。此外，为了实现用户空间和内核空间的数据交互，perf_events 还会为每个被监测的 CPU 或线程（仅 per-thread 模式）维护一个用于存储运行时性能数据的环形缓冲区（ring buffer）[^25]。用户空间的应用可通过内存映射（mmap）的方式访问内核中缓存的性能数据，以满足计数（perf stat）、采样（perf record）、追踪（perf trace）等功能的数据需求[^18]。

此外，perf 还允许在指定性能事件时额外添加事件修饰符（Event Modifiers），以实现对性能事件更细致的配置和限制。常用事件修饰符对应的功能如下：

* u - 仅统计在用户空间中触发的性能事件
* k - 仅统计在内核中触发的性能事件
* p - 控制性能事件采样的精度级别

现代微处理器普遍基于超标量（superscalar）、深流水（superpipelined）、乱序执行（out-of-order）等技术来提升整体性能[^25]，但复杂的微结构设计也增加了获取精确采样结果的难度[^26]。以 `perf record -e cycles:u -c 1000` 的工作过程为例，其核心功能的调用逻辑如图 4 所示。

<div align="center">
<img src="https://shaojiemike.oss-cn-hangzhou.aliyuncs.com/img/20220801152818.png"/>
<p>图4 perf 的核心功能调用逻辑</p>
</div>

在初始化阶段，系统调用 `sys_perf_event_open()` 负责将 PMC 配置为用于记录用户空间的指令周期数，并通过 `mmap()` 将内核中的环形缓冲区（ring buffer）映射到 perf commands 可访问的内存地址[^27]。在执行阶段，当 PMC 的计数值达到设定的采样阈值（`-c 1000`）时，PMU 会生成一个性能监视中断（Performance Monitoring Interrupt，简称 PMI）以提示 PMC 溢出[^28]。内核会捕获 PMI 中断请求（Interrupt Request，简称 IRQ）并交由 perf_events 解析 CPU 现场[^19]。指令地址、线程号、函数名等上下文信息将在解析完成后被写入环形缓冲区，随后 PMC 的值将被重置以准备执行下一轮采样[^29]。

理想情况下，采样数据应当能够精确描述 PMC 溢出时刻（timestamp）的 CPU 现场。但在实际执行过程中，从 PMI 生成到内核处理 IRQ 的期间，不可避免地会存在时间延迟（delay）[^26]。因此，在采样时获取的指令地址通常并非指向实际触发性能事件的指令，这种现象被称为事件打滑（Event Skid，简称 skid）[^30]。采样数据的偏离程度取决于流水线的数量和深度，以及在 skid 期间的指令执行情况。如果恰好发生了分支跳转，被采样的指令地址可能会与实际触发性能事件的指令地址之间相差数百个字节，解析出的函数名、指令名、指令参数等数据的正确性将难以保证[^24]。

<div align="center">
<img src="https://ieeexplore.ieee.org/mediastore_new/IEEE/content/media/71/10075651/10068807/sason1-3257105-large.gif"/>
<p>图5 Intel PEBS 的工作过程</p>
</div>

在 Nehalem 架构中，Intel 首次应用了事件驱动的精确采样（Precise Event-Based Sampling，简称 PEBS）机制[^31]，其工作过程如图 5 所示[^32]。启用 PEBS 支持后，PEBS 辅助模块（assist）将在 PMC 溢出时被激活。等到被监测的性能事件再次发生时，PEBS 辅助模块会将当前时刻的上下文信息暂存到 PEBS 缓冲区中，并重置 PMC 的值以准备执行下一轮采样。当 PEBS 缓冲区中存储的数据量达到设定的阈值时，会触发一个硬件中断以通知内核读取采样数据[^32]。

与基于 PMI 的采样方法相比，使用 PEBS 能够避免因 IRQ 处理延迟导致的 skid，被采样的指令地址的偏移程度得以有效控制。基于 PEBS，perf 能够获得更精确的采样结果，可以通过添加不同数量的事件修饰符 `p` 来指定性能事件的采样精度。每个精度级别对应的描述如下：

* 0 - 不限制指令地址的偏移程度
* 1 - 必须保证指令地址的偏移量为常数级别
* 2 - 尽量保证指令地址的偏移量为 0（插入 lfence 屏障）
* 3 - 必须保证指令地址的偏移量为 0（清空流水线，但已经提交的指令无法撤回）

精度级别为 0 时，perf 不限制因 skid 造成的指令地址偏移的数量级。当精度级别为 1 到 3 时，perf 会通过 PEBS 机制降低 skid 的影响，以实现高精度的事件采样。

但因为 shadow effect 的存在，使用 PEBS 只能尽量保证 skid 为 0，第三级精度仅能在某些特定情况下实现，例如全局仅采样单个事件。

### 优势与局限

优势：利用硬件性能计数器，能够用较低代价监测处理器内部的实际执行情况，并且通过与软件性能计数器结合，能够分析程序实际运行时的热点代码、性能瓶颈（访存、IO、ALU 计算），针对热点进行优化往往效果最好。

局限：但基于性能计数器的性能分析方法也存在一定的局限性。首先，硬件性能计数器的配置过程较为繁琐，需要监听的硬件事件数量过多则需要配置复用[^35]，此外，不容易保证多线程读写同步，而且分析 MPI 程序非常困难。计数器多路复用、线程上下文切换保存计数器等必要功能都会带来额外的测量开销，perf 工具的测量开销是客观存在的，尽管针对大型程序来说，这种开销可能微不足道，但这也可能影响小型程序的性能分析结果[^36]。此外，PMU 没有定义的、操作系统也无法收集的数据，就无法通过基于性能计数器的性能分析工具收集。例如指令的逐条分类统计。

## 基于模拟器的性能分析

QEMU

## 基于二进制插桩的性能分析

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
[^18]: T. Gleixner and I. Molnar, "Performance counters for Linux", 2009.
[^19]: Weaver, Vincent M. "Linux perf_event features and overhead." _The 2nd international workshop on performance analysis of workload optimized systems, FastPath_. Vol. 13. 2013.
[^20]: Carelli, Alberto, Alessandro Vallero, and Stefano Di Carlo. "Performance Monitor Counters: interplay between safety and security in complex Cyber-Physical Systems." _IEEE Transactions on Device and Materials Reliability_ 19.1 (2019): 73-83.
[^21]: Gregg, Brendan. "Linux Performance Analysis New Tools and Old Secrets." _Usenix Lisa 2014 conference_. 2014.
[^22]: Giraldeau, Francis, et al. "Recovering system metrics from kernel trace." _Linux Symposium_. Vol. 109. 2011.
[^23]: Rostedt, Steven, and Red Hat. "Ftrace kernel hooks: more than just tracing." _Linux Plumbers Conference_. 2014.
[^24]: "Perf_events tutorial", 2012, [online] Available: http://perf.wiki.kemel.org/.
[^25]: "Modern Microprocessors: A 90-Minute Guide!", 2016, [online] Available: https://www.lighterra.com/papers/modernmicroprocessors/
[^26]: Yi, Jifei, et al. "On the precision of precise event based sampling." _Proceedings of the 11th ACM SIGOPS Asia-Pacific Workshop on Systems_. 2020.
[^27]: "Diving into Linux Perf Ring Buffer", 2021, [online] Available: https://people.linaro.org/~leo.yan/debug/perf/Diving_into_Linux_Perf_Ring_Buffer.pdf.
[^28]: Sprunt, Brinkley. "Pentium 4 performance-monitoring features." _Ieee Micro_ 22.04 (2002): 72-82.
[^29]: Akiyama, Soramichi, and Takahiro Hirofuchi. "Quantitative evaluation of intel pebs overhead for online system-noise analysis." _Proceedings of the 7th International Workshop on Runtime and Operating Systems for Supercomputers ROSS 2017_. 2017.
[^30]: Intel VTune Amplifier XE 2011 Getting Started Tutorials for Linux OS, 2010. Section Key Concept: Event Skid.
[^31]: Intel, “Intel Microarchitecture Codename Nehalem Performance Monitoring Unit Programming Guide,” https://software.intel.com/sites/default/files/m/5/2/c/f/ 1/30320-Nehalem-PMU-Programming-Guide-Core.pdf, 2010.
[^32]: Sasongko, Muhammad Aditya, et al. "Precise Event Sampling on AMD Versus Intel: Quantitative and Qualitative Comparison." _IEEE Transactions on Parallel and Distributed Systems_ 34.5 (2023): 1594-1608.

[^35]: Zaparanuks, Dmitrijs, Milan Jovic, and Matthias Hauswirth. "Accuracy of performance counter measurements." _2009 IEEE International Symposium on Performance Analysis of Systems and Software_. IEEE, 2009.
[^36]: V. Salapura, K. Ganesan, A. Gara, M. Gscwind, J. Sexton and R. Walkup, "Next-generation performance counters: Towards monitoring over thousand concurrent events", _Proc. IEEE International Symposium on Performance Analysis of Systems and Software_, pp. 139-146, Apr. 2008.
