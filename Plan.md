## 性能分析方案

平台架构：x86_64等

测试命令：

```bash
jdk/bin/java -XX:-UseSuperWord -Xmx8g -Xms8g -jar SPECjvm2008.jar -ikv -ict -crf false -ctf false -chf false -i 1 -ops 50 compress
```

下面是选择的工具和要收集的数据。

### 1. 字节码插桩

方式：通过动态字节码插桩，在待测方法执行前后动态插入代码。

#### Javassist

- 方法（method）执行次数。
- 方法（method）运行时间。

### 2. 二进制插桩

方式：通过对二进制执行文件的动态插桩实现观测。

#### PIN

- 指令（instruction）数目。
- 基本块循环（BBL）数目。
- 过程（procedure）数目和执行时间。

#### DynamoRIO

- 各级缓存命中次数和缺失次数。
- 各级TLB命中次数和缺失次数。
- 访存的重用距离（reuse distance）和重用时间（reuse time）。
- 各类基本指令数目。
- 各类操作码数目。
- syscall数目。
- 热点基本块（hot basic block）。

### 3. 性能计数器

方式：使用 linux 性能检测工具。

#### Perf

- 执行的指令数目。
- 分支指令数目和预测miss。
- 缓存miss。

### 4. 虚拟机Profiler

方式：包装虚拟机提供的接口，或在虚拟机中植入插件，获取性能信息。

#### uber jvm-profiler

一个开源的 JVM 性能分析器，收集 JVM 的多维信息，具体可见[^1]，收集的数据分为以下四类：

- CPU and Memory。
- IO。
- Process Info。
- Stack Trace。

[^1]: [jvm-profiler/metricDetails.md at master · uber-common/jvm-profiler (github.com)](https://github.com/uber-common/jvm-profiler/blob/master/metricDetails.md)

#### QEMU plugins

方式：使用QEMU提供的以及额外编写的插件，获取监测数据[^2]。收集的数据：

- 各类指令执行次数。
- cache数据（数据和指令cache访问、缺失次数等）。

[^2]: [QEMU TCG Plugins — QEMU documentation](https://www.qemu.org/docs/master/devel/tcg-plugins.html)

### 5. APM工具

APM（Application Performance Monitoring）工具可以用来便捷、系统地监测和分析Java应用程序性能。

#### Arthas

Arthas 是阿里云的一款开源线上监控诊断工具，通过全局视角实时查看应用 load、内存、gc、线程的状态信息，并能在不修改应用代码的情况下，对业务问题进行诊断，包括查看方法调用的出入参、异常，监测方法执行耗时，类加载信息等[^3]。

收集的数据：

- monitor命令收集方法调用次数，成功次数，失败次数。
- trace命令收集方法执行路径节点上的耗时。
- async-profiler：
  - cpu占用情况，生成火焰图。
  - 缓存miss，分支miss，缺页，上下文切换等。
  - 内存分配情况（allocation profiling），生成火焰图。
  - wall-clock profiling，分析启动时间。

[^3]: [简介 | arthas (aliyun.com)](https://arthas.aliyun.com/doc/)

