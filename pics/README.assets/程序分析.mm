
<map version="0.9.0">
    <node CREATED="0" ID="628bb529dbf0483dab87e0115a8fe9f0" LINK="https://github.com/benhack20/loong-jvm" MODIFIED="0" TEXT="程序分析">
        <richcontent TYPE="NOTE">
            <html>
                <head></head>
                <body>&lt;h1&gt;程序分析&lt;/h1&gt;&lt;p&gt;具体文档可参考仓库https://github.com/benhack20/loong-jvm&lt;/p&gt;&lt;p&gt;贡献者：舒沛谙，孙旭&lt;/p&gt;</body>
            </html>
        </richcontent>
        <node CREATED="0" ID="f2434da35a284f83a84d7f42ffc89f88" MODIFIED="0" POSITION="right" TEXT="程序分析的含义">
            <node CREATED="0" ID="ac64f1e543704ae3b704e922f78858db" MODIFIED="0" TEXT="程序分析">
                <richcontent TYPE="NOTE">
                    <html>
                        <head></head>
                        <body>&lt;p&gt;&lt;strong&gt;程序分析&lt;/strong&gt;是指自动分析一个程序的包括正确性、安全性和性能等特征的过程。可以用于编译优化、提供告警信息等。&lt;/p&gt;</body>
                    </html>
                </richcontent>
                <node CREATED="0" ID="8484776bfb55472ea9d6bc95a9fddebc" MODIFIED="0" TEXT="​参考书">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;参考书：Principles of program analysis&lt;/p&gt;&lt;p&gt;作者：Nielson, F., Nielson, H. R., &amp;amp; Hankin, C.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src="https://img2.doubanio.com/view/subject/s/public/s34352471.jpg" alt="程序分析原理"&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
            </node>
            <node CREATED="0" ID="9433ac646cdd4145b4e003707ebd8196" MODIFIED="0" TEXT="静态程序分析的含义">
                <richcontent TYPE="NOTE">
                    <html>
                        <head></head>
                        <body>&lt;p&gt;&lt;strong&gt;静态程序分析&lt;/strong&gt;是指不必运行程序就能对程序进行的分析。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;程序优化：要想优化编译器，就需要分析被编译的程序的诸多性质（如是否存在dead code，某变量的值是否依赖输入等）。&lt;/li&gt;&lt;li&gt;正确性分析：程序测试只能说明程序存在bug，但正确性分析要求证明bug不存在，这要求对程序的诸多性质进行分析。&lt;/li&gt;&lt;li&gt;程序开发：现代IDE使用静态程序分析来支持代码调试、代码重构、代码理解，辅助代码开发。&lt;/li&gt;&lt;/ul&gt;</body>
                    </html>
                </richcontent>
                <node CREATED="0" ID="e6a8bcdd4ea04a8591bbb67de16cf604" MODIFIED="0" TEXT="​参考书">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;参考书：Static program analysis&lt;/p&gt;&lt;p&gt;作者：Møller, A., &amp;amp; Schwartzbach, M. I.&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="5eb54de52ab54c0ea1e92587be10816c" LINK="https://ranger-nju.gitbook.io/static-program-analysis-book/" MODIFIED="0" TEXT="​电子书和视频">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;中文电子书：https://ranger-nju.gitbook.io/static-program-analysis-book/&lt;/p&gt;&lt;p&gt;来源：南京大学《软件分析》课程（李樾、谭添）&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
            </node>
            <node CREATED="0" ID="88c09026c6d243a7930fa490f83e607e" MODIFIED="0" TEXT="动态程序分析的含义">
                <richcontent TYPE="NOTE">
                    <html>
                        <head></head>
                        <body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;动态程序分析&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;是指分析运行中程序的性质。它使用程序在运行时或运行后获取的信息，对程序的性质进行分析，分为online和offline：&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;online是指在程序运行过程中分析程序行为，&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;offline是指记录程序运行行为，在运行结束后再进行分析。&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;</body>
                    </html>
                </richcontent>
            </node>
            <node CREATED="0" ID="6212802261d94ff1b15799be8f49fee3" MODIFIED="0" TEXT="静态/动态程序分析对比">
                <richcontent TYPE="NOTE">
                    <html>
                        <head></head>
                        <body>&lt;p&gt;&lt;img src="/res/c/9/1688541216579555191.png"&gt;&lt;/p&gt;</body>
                    </html>
                </richcontent>
                <node CREATED="0" ID="b8a4100de42b4284b5e9798d500af541" MODIFIED="0" TEXT="​程序是否需要运行"/>
                <node CREATED="0" ID="f56e7d2f854e4a0ab4649e29551a14ba" MODIFIED="0" TEXT="​精确度"/>
                <node CREATED="0" ID="c38cf07db12c409fbe64dc2e7093fa58" MODIFIED="0" TEXT="​是否适用全部情况"/>
                <node CREATED="0" ID="62fb763df552480b91b78516727e983a" MODIFIED="0" TEXT="​是否适用动态属性">
                    <node CREATED="0" ID="82396bd263ce462cac93753266479815" MODIFIED="0" TEXT="​继承"/>
                    <node CREATED="0" ID="8a3d6b8d137b4edab23886558c26269d" MODIFIED="0" TEXT="​多态"/>
                    <node CREATED="0" ID="046736b56ff14aef887a88648307fcce" MODIFIED="0" TEXT="​动态绑定"/>
                    <node CREATED="0" ID="f466f9acf42e4a95bd72584481636148" MODIFIED="0" TEXT="​多线程"/>
                </node>
                <node CREATED="0" ID="197d4e26922d48ccba67c3d0443e04c8" MODIFIED="0" TEXT="​开销"/>
            </node>
        </node>
        <node CREATED="0" ID="e4614b16f4d7412cb9697a73f9f15343" MODIFIED="0" POSITION="right" TEXT="​程序分析的手段">
            <node CREATED="0" ID="702ea9d15e4d4bacbba1a0688013668e" MODIFIED="0" TEXT="静态分析方法">
                <node CREATED="0" ID="9e211cc47df4415d90a272d0ed246087" MODIFIED="0" TEXT="数据流分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong&gt;数据流分析&lt;/strong&gt;用于确定程序中数据的流动方式。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;通过追踪变量的赋值和使用，数据流分析可以计算出程序执行时各个变量的值和关系，以及可能的错误或漏洞。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;它有助于检测未初始化变量、空指针解引用、不安全的类型转换等问题。&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="131089b2449245eb9229ad329dfaea79" MODIFIED="0" TEXT="​抽象解释">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;一个程序可以有无数种具体的运行时状态，静态分析不可能穷举完。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;抽象解释&lt;/strong&gt;通过定义抽象域和抽象操作来模拟程序执行过程，从而得到程序的近似行为。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;最简单的例子就是把无限的整数的具体值抽象成正、负、0这三个有限的抽象值。&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="c44de09c7bec4fba9f1bf81894391b28" MODIFIED="0" TEXT="​符号分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong style="color: rgb(36, 41, 47);"&gt;符号执行&lt;/strong&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;将程序中的变量和表达式表示为符号，而不是具体的数值。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;可以用于求解程序中的约束条件，发现无法满足的约束条件。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;﻿&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="6cb540668a084272baedba13348a2ec3" MODIFIED="0" TEXT="​类型分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong style="color: rgb(36, 41, 47);"&gt;类型分析&lt;/strong&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;用于推断程序中变量和表达式的类型信息。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;通过分析赋值语句、函数调用等代码结构，确定变量的可能类型。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;﻿它有助于发现类型不匹配、隐式类型转换和类型错误等问题。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="2d468cd1149f4295ab02213f34e8f442" MODIFIED="0" TEXT="​控制流分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong style="color: rgb(36, 41, 47);"&gt;控制流分析&lt;/strong&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;用于理解程序的执行路径。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;通过分析条件语句、循环语句和函数调用等控制结构，构建程序的控制流图（CFG），帮助我们理解程序的逻辑结构，检测代码中的死代码和不可达代码等问题。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="16e865a52952474db3a8c917580ca413" MODIFIED="0" TEXT="​指针分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong style="color: rgb(36, 41, 47);"&gt;指针分析&lt;/strong&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;用于推断程序中指针的指向关系和可能的指针操作。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;通过分析指针的赋值、传递和解引用等操作，可以确定指针变量可能指向的内存位置，从而检测潜在的空指针解引用和内存泄漏问题。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                </node>
                <node CREATED="0" ID="5ffae911051d4351bf04ba56e237739c" MODIFIED="0" TEXT="​……"/>
            </node>
            <node CREATED="0" ID="5d048af1ad454d8f96910ad5e199314a" MODIFIED="0" TEXT="动态分析方法">
                <node CREATED="0" ID="eef19db0c48a4aa8a5df47da62cd5db6" MODIFIED="0" POSITION="right" TEXT="​基于Profile数据">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Profile &lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;是在程序实际运行过程中收集的有关程序运行状态的信息。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;Profiler（性能分析器）通常用于调查软件系统的性能或内存需求。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;Debugger（调试器）通常用于以非常细粒度的方式逐步分析软件系统，以揭示出现意外行为的原因。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;通常，虚拟机或其他环境的性能分析器和调试器在执行的某些阶段发送事件，然后可以通过虚拟机或环境的插件捕获这些事件并将其存储在执行踪迹中。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;可以捕获的典型事件包括方法调用、变量访问、方法返回等&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                    <node CREATED="0" ID="cbaf023d3a6f443ab5cc262ba8491ddc" MODIFIED="0" TEXT="程序插桩">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;strong style="color: rgb(36, 41, 47);"&gt;插桩&lt;/strong&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;（instrumentation）是一种将额外代码嵌入到待分析程序中的技术。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;插桩可以用于收集程序执行期间的各种信息，例如函数调用、变量访问、内存操作等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;这些额外的代码被称为&lt;/span&gt;&lt;strong style="color: rgb(36, 41, 47);"&gt;插桩代码&lt;/strong&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;，它们会在程序执行过程中被执行，从而提供有关程序行为的详细信息。&lt;/span&gt;&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                        <node CREATED="0" ID="b6b13e4cf4c1456dbd4fe7bf1987cdd3" MODIFIED="0" POSITION="right" TEXT="​JVM插桩">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;通过对开源的JVM进行插桩，可以全面地获得Java程序运行各个方面的信息。主要的缺点在于需要开源的JVM代码以及对JVM内核的底层理解，繁琐不灵活。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="0c094e5dba4b493b807b607b1c135223" MODIFIED="0" POSITION="right" TEXT="​源码插桩">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;在源码中插入修改，通常利用一些元编程框架（如Proteus，DMS）。优点是针对性强，缺点是和目标语言紧密相关，处理具体的语言特性时会有问题。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="2e56cdbaaf65492c8ee46e48d9041a73" MODIFIED="0" POSITION="right" TEXT="​机器码插桩">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;更改或重写已经编译好的二进制码（机器码）。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="81b8d330418741edbcb968a345ef82e6" MODIFIED="0" POSITION="right" TEXT="​静态">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;调用库和API，重写二进制码，然后重新编译。&lt;/span&gt;&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                            <node CREATED="0" ID="24735f97747f44d6ae1a5f402dd0e2a2" MODIFIED="0" POSITION="right" TEXT="​动态">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;发生在程序已经被加载进内存后、执行。优点是不需要重新编译、链接、运行，更灵活。&lt;/span&gt;&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                        </node>
                        <node CREATED="0" ID="7de97def722b4b658bf3ce1f8b9315cf" MODIFIED="0" POSITION="right" TEXT="​字节码插桩">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;插桩对象是已经编译好的字节码，更难实现，但是记录更全面。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="246076fa8ff444d98f85e1a2a962e109" MODIFIED="0" POSITION="right" TEXT="​静态">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;离线更改编译好的代码，如Javaassist。无法插桩动态生成和加载的代码。&lt;/span&gt;&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                            <node CREATED="0" ID="b6c89f76fba24d71b8b2fca2cc06b7ac" MODIFIED="0" POSITION="right" TEXT="​动态">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;在程序运行时在线进行插桩。&lt;/span&gt;&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                        </node>
                    </node>
                    <node CREATED="0" ID="7f2afbb720d84d129fcfad68b9f4721c" MODIFIED="0" TEXT="虚拟机profiler">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Profiler是&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;指特定虚拟机提供的性能分析工具。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;﻿&lt;/span&gt;虚拟机的 Profiler 通常提供以下功能：&lt;/p&gt;&lt;ol&gt;&lt;li&gt;函数级别的统计信息：函数的调用次数、执行时间和平均执行时间等。这使开发人员能够了解哪些函数是程序中的热点，哪些函数可能需要进行性能优化。&lt;/li&gt;&lt;li&gt;代码覆盖率分析：程序执行期间经过的代码路径，以确定哪些代码已经执行过，哪些代码未被执行到。&lt;/li&gt;&lt;li&gt;内存分析：某些 Profiler 可以提供对内存使用情况的分析，有助于发现内存泄漏、不良的内存使用模式等问题。&lt;/li&gt;&lt;li&gt;线程分析：线程的数量、同步机制的使用情况和线程间的竞争情况等。有助于发现并行性问题和死锁等。&lt;/li&gt;&lt;/ol&gt;</body>
                            </html>
                        </richcontent>
                        <node CREATED="0" ID="de8da2d080a04ea7b481a865087e0b44" MODIFIED="0" TEXT="​JPDA">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;针对Java SDK的JPDA，它以接口（JVMTI）的形式提供服务，Profiler插件的开发者只需实现接口即可。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;在此基础上，可以使用SpecJVM等Benchmark进行运行时的黑盒测试分析。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                    </node>
                </node>
                <node CREATED="0" ID="ffe436132b8c43cb8e4f98918fd7d123" MODIFIED="0" POSITION="right" TEXT="​基于动态模型图">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;该方法基于可执行模块和交互图来模拟运行时行为。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                    <node CREATED="0" ID="ed2dd71f392b424b89f7234220a89517" MODIFIED="0" TEXT="​分析指标">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;本节涉及的分析指标主要针对软件（特别是面向对象的软件）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;动态分析指标&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;和&lt;/span&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;动态分析&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;是紧密关联的，动态分析指标被用来测量程序、组件、系统的运行时性质，采集动态分析指标就是动态分析流程中的一个部分。&lt;/span&gt;&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                        <node CREATED="0" ID="0a4ca59dec8b4ccfac8cba793d01eb0f" MODIFIED="0" POSITION="right" TEXT="​大小"/>
                        <node CREATED="0" ID="a6218695162f4a54bad216f208cedc35" MODIFIED="0" POSITION="right" TEXT="​复杂度"/>
                        <node CREATED="0" ID="47a5c10bab4a449eb78e6ad9103b4236" MODIFIED="0" POSITION="right" TEXT="​耦合度"/>
                        <node CREATED="0" ID="f23d03a088be4305a824e60f6c1af380" MODIFIED="0" POSITION="right" TEXT="​内聚度"/>
                        <node CREATED="0" ID="3ba36ad1cb42489ab0a3b2fc9460ddba" MODIFIED="0" POSITION="right" TEXT="​继承"/>
                        <node CREATED="0" ID="a5a742dcb2a54c5fb18c2d68bf87c735" MODIFIED="0" POSITION="right" TEXT="​多态"/>
                    </node>
                    <node CREATED="0" ID="baf3829434164cffb0991b87c3a2d249" MODIFIED="0" POSITION="right" TEXT="​模型">
                        <node CREATED="0" ID="33fd9049f25e45a1a92b276c19b6d35b" MODIFIED="0" POSITION="right" TEXT="​UML">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;统一建模语言&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;（UML）提供了描述面向对象系统动态属性的手段，包括状态图、序列图、协作图和活动图等多种不同的图表。可以根据这些动态 UML 模型推测动态指标。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="f454613dfd6446af82576e092aaecd8c" MODIFIED="0" POSITION="right" TEXT="​ROOM">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;ROOM&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;指实时面向对象建模（&lt;/span&gt;Real-Time Object-Oriented Modeling&lt;span style="color: rgb(51, 51, 51);"&gt;）。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;ROOM 提供了一套结构化的建模概念和符号，用于描述实时系统中的对象、消息传递、并发行为以及时间约束等重要方面。它强调对实时性能和可靠性的建模和分析，并支持对系统的实时属性进行验证和优化。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(36, 41, 47);"&gt;ROOM 作为一种建模语言和方法，可以与其他软件工程技术结合使用，如 UML（Unified Modeling Language），用于描述实时系统的静态结构；SysML，用于系统级建模；以及不同的实时编程语言和框架。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                    </node>
                    <node CREATED="0" ID="795969bbd4fc4cbabd5e3b866f582ea6" MODIFIED="0" POSITION="right" TEXT="​优点">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;﻿能在设计的早期估算动态指标，因为可以利用这些信息进行早期决策。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;例如，可以基于UML图表推导测试用例并计算与每个测试用例相关联的动态耦合度，具有高耦合度的测试用例可以先执行，因为预计它们可以发现更多的错误。&lt;/span&gt;&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                </node>
                <node CREATED="0" ID="58c0a4316163407c9280e4d20bad36dd" MODIFIED="0" TEXT="基于AOP编程">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;strong&gt;AOP（Aspect-Oriented Programming）&lt;/strong&gt;是指面向切面编程。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;在AOP编程中，无需添加插桩代码，因为编程语言内部提供了内置的构造来实现插桩能力。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                    <node CREATED="0" ID="f12499ff89fa45349d5808d0f819dce4" MODIFIED="0" TEXT="横切关注点">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;AOP编程的主要思想是将&lt;strong&gt;横切关注点&lt;/strong&gt;（Cross-cutting Concerns）（例如日志记录、性能监视、安全检查、异常处理等）从主要业务逻辑中分离出来。&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                    <node CREATED="0" ID="0f60b567a0344febb4f1de507e814045" MODIFIED="0" TEXT="​切面">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;strong&gt;切面&lt;/strong&gt;（Aspect）包含了实现横切关注点的逻辑代码。通过 AOP 技术，将日志切面&lt;strong&gt;织入&lt;/strong&gt;（Weave）到程序的各个关键点中（例如函数调用前、函数调用后等），从而实现在主要业务逻辑中无需显式编写日志代码，却能达到日志记录的效果。&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                    <node CREATED="0" ID="a80c4f3d03ff4003b6e6bdd9e5e7a07b" MODIFIED="0" TEXT="Extensions">
                        <node CREATED="0" ID="0684067861c345138a974eeadb8da97c" MODIFIED="0" TEXT="​AspectC++"/>
                        <node CREATED="0" ID="e906484231d246ab920f3638249d3460" MODIFIED="0" TEXT="​AspectJ"/>
                    </node>
                    <node CREATED="0" ID="5d7e0bd94bd140c0902440dfec926197" MODIFIED="0" TEXT="​优势">
                        <node CREATED="0" ID="d7b5559b8596451388e390af4c873c66" MODIFIED="0" TEXT="​独立于系统的实际运行"/>
                        <node CREATED="0" ID="aa788c8cce134b488c6813152cbeaf26" MODIFIED="0" TEXT="​随时启动或禁用"/>
                        <node CREATED="0" ID="b586c4cc93f6417fb433f3a4be5cab6f" MODIFIED="0" TEXT="​提升插桩的抽象层次"/>
                    </node>
                </node>
            </node>
        </node>
        <node CREATED="0" ID="34bb7d4334d4426c8a62c74c57893c93" MODIFIED="0" POSITION="right" TEXT="程序分析的应用场景">
            <node CREATED="0" ID="eeaea640f7884a8dabe192c8106da9da" MODIFIED="0" TEXT="编译优化">
                <richcontent TYPE="NOTE">
                    <html>
                        <head></head>
                        <body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;编译优化&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;和&lt;/span&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;程序分析&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;的关系在于：&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;在编译器能够改进代码之前，它必须在程序中找到更改后可以提升运行性能的点。&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;并且编译器必须证明在这些点更改代码是安全的。&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;这两项任务都需要更深入地分析和理解代码。为了定位程序中的优化点并证明这些优化的合理性，编译器会使用程序分析。&lt;/span&gt;&lt;/p&gt;</body>
                    </html>
                </richcontent>
                <node CREATED="0" ID="cc90829c72e148909608d0d4ee652aca" MODIFIED="0" TEXT="静态优化">
                    <node CREATED="0" ID="bf5db9573a1f4308bb9b80691c45ae11" MODIFIED="0" TEXT="​编译早期">
                        <node CREATED="0" ID="425fa2eee63b40b6a068c9324b2240e3" MODIFIED="0" TEXT="​常量折叠">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;常量折叠（Constant Folding）将常量表达式替换为其计算结果。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;举例：&lt;/p&gt;&lt;p&gt;&lt;span class="hljs-built_in"&gt;int&lt;/span&gt; x = &lt;span class="hljs-number"&gt;1&lt;/span&gt; + &lt;span class="hljs-number"&gt;2&lt;/span&gt; * &lt;span class="hljs-number"&gt;3&lt;/span&gt;;&lt;/p&gt;&lt;p&gt;替换为&lt;/p&gt;&lt;p&gt;&lt;span class="hljs-built_in"&gt;int&lt;/span&gt; x = &lt;span class="hljs-number"&gt;7&lt;/span&gt;;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="d5279edf9ab446c08343a74eb37b4cfc" MODIFIED="0" TEXT="​常量传播">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong style="color: rgb(18, 18, 18);"&gt;常量传播 &lt;/strong&gt;&lt;span style="color: rgb(18, 18, 18);"&gt;使用前向数据流分析（forward data-flow analysis）确定某个常量能被传播到哪些使用点，然后用常量替代。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;举例：&lt;/p&gt;&lt;p&gt;&lt;span class="hljs-built_in"&gt;int&lt;/span&gt; x = &lt;span class="hljs-number"&gt;40&lt;/span&gt;;&lt;/p&gt;&lt;p&gt;&lt;span class="hljs-built_in"&gt;int&lt;/span&gt; y = x + &lt;span class="hljs-number"&gt;2&lt;/span&gt;;&lt;/p&gt;&lt;p&gt;替换为：&lt;/p&gt;&lt;p&gt;&lt;span class="hljs-built_in"&gt;int&lt;/span&gt; x = &lt;span class="hljs-number"&gt;40&lt;/span&gt;;&lt;/p&gt;&lt;p&gt;&lt;span class="hljs-built_in"&gt;int&lt;/span&gt; y = &lt;span class="hljs-number"&gt;40&lt;/span&gt; + &lt;span class="hljs-number"&gt;2&lt;/span&gt;;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="fb8fab36b4f849fa919c563695e283a1" MODIFIED="0" TEXT="逃逸分析">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong&gt;逃逸分析&lt;/strong&gt;（Escape Analysis）用于确定在函数调用中创建的对象是否会“逃逸”出函数的作用域。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;如果一个对象被确定不会逃逸出函数作用域，那么编译器可以将其分配在栈上，而不是在堆上。&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="c682bac85c16497190f826ae5efd9fba" MODIFIED="0" TEXT="​标量替换">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;strong&gt;标量&lt;/strong&gt;可以理解成不可分解的变量，如Java内部的基本数据类型、引用类型等。与之对应的聚合量是可以被拆解的，如对象。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;当通过&lt;strong&gt;逃逸分析&lt;/strong&gt;一个对象只会作用于方法内部，虚拟机可以通过使用标量替换来进行优化。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;举例如下：&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;public &lt;span class="hljs-keyword"&gt;class&lt;/span&gt; &lt;span class="hljs-title"&gt;EscapeAnalysis&lt;/span&gt; {&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;public Person p;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;// 发生逃逸，对象被返回到方法作用域以外，被方法外部，线程外部都可以访问&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span class="hljs-keyword"&gt;public&lt;/span&gt; &lt;span class="hljs-keyword"&gt;void&lt;/span&gt; &lt;span class="hljs-title"&gt;escape&lt;/span&gt;&lt;span class="hljs-params"&gt;()&lt;/span&gt;{&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;p = new Person(26, "TomCoding escape");&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;}&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;// 不会逃逸，对象在方法内部&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span class="hljs-keyword"&gt;public&lt;/span&gt; &lt;span class="hljs-keyword"&gt;String&lt;/span&gt; &lt;span class="hljs-title"&gt;noEscape&lt;/span&gt;&lt;span class="hljs-params"&gt;()&lt;/span&gt;{&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Person person = new Person(26, "TomCoding noEscape");&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return person.name;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;}&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;// 对不会逃逸的对象进行标量替换&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span class="hljs-keyword"&gt;public&lt;/span&gt; &lt;span class="hljs-keyword"&gt;String&lt;/span&gt; &lt;span class="hljs-title"&gt;noEscape&lt;/span&gt;&lt;span class="hljs-params"&gt;()&lt;/span&gt;{&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;int age = 26;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;String name = "TomCoding noEscape";&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return name;&lt;/p&gt;&lt;p&gt;}&lt;/p&gt;&lt;p&gt;}&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                        </node>
                        <node CREATED="0" ID="89dbd7f435ef4bb9b2be3e19502cb24a" MODIFIED="0" TEXT="……"/>
                    </node>
                    <node CREATED="0" ID="965445b4b46e4109b44ff614a3f772f1" MODIFIED="0" TEXT="​冗余消除">
                        <node CREATED="0" ID="0b1513c311d84f6dadf0970a44c7fa1d" MODIFIED="0" TEXT="​公共子表达式消除">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong&gt;公共子表达式消除&lt;/strong&gt;（Common Subexpression Elimination，CSE）在代码中消除重复计算的表达式以提高运行时的效率。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;公共子表达式&lt;/strong&gt;指的是在程序中多次出现的具有相同操作数和运算符的表达式。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;举例：&lt;/p&gt;&lt;p&gt;int x = a + b * c;&lt;/p&gt;&lt;p&gt;int y = a + b * c;&lt;/p&gt;&lt;p&gt;替换为：&lt;/p&gt;&lt;p&gt;int temp = b * c;&lt;/p&gt;&lt;p&gt;int x = a + temp;&lt;/p&gt;&lt;p&gt;int y = a + temp;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="20d4115934044c1d9893e93d6c682519" MODIFIED="0" TEXT="​循环不变代码外提">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;举例：&lt;/p&gt;&lt;p&gt;int sum = 0;&lt;/p&gt;&lt;p&gt;for (int i = 0; i &amp;lt; N; i++) {&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;int temp = a[i] * b[i];&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;sum += temp;&lt;/p&gt;&lt;p&gt;}&lt;/p&gt;&lt;p&gt;替换为：&lt;/p&gt;&lt;p&gt;int sum = 0;&lt;/p&gt;&lt;p&gt;int temp;&lt;/p&gt;&lt;p&gt;for (int i = 0; i &amp;lt; N; i++) {&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;temp = a[i] * b[i];&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;sum += temp;&lt;/p&gt;&lt;p&gt;}&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="c4de912d29f34e6cb6e5beb8f6639b1e" MODIFIED="0" TEXT="​无用代码消除">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong&gt;无用代码消除&lt;/strong&gt;（Dead Code Elimination）用于在程序中识别和删除永远不会执行或不会对程序结果产生影响的代码。&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                    </node>
                    <node CREATED="0" ID="68337da155164b058701ee972c3bb660" MODIFIED="0" TEXT="gcc编译优化选项">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;根据gcc官方文档：&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;如果没有任何编译优化，那么编译器的目标是“减少编译时间并让调试能够输出预期的结果”；&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;打开编译优化选项后，编译器会尝试提升代码性能或缩小代码体积，代价就是牺牲了编译时间和调试程序的能力。&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#Optimize-Options&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                        <node CREATED="0" ID="628e53d64c0e4be397c9bed2bc4ca286" MODIFIED="0" TEXT="-O或-O1">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;-O1：启用基本级别的优化。编译器将执行一些常见的优化，如消除无用代码、提取循环不变量、函数内联等。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;此级别的优化会相对较快完成，并且通常可以提高代码的执行速度，但不会执行任何需要很长编译时间的优化。&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="52a231f6cb5f4760bcae69c1e1206c1b" MODIFIED="0" TEXT="减小代码体积和运行时间"/>
                        </node>
                        <node CREATED="0" ID="3413a6f72be847cdb1a25cefa1a4af7e" MODIFIED="0" TEXT="-O2">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;-O2：启用更高级别的优化。除了 -O1 中的优化之外，编译器还会执行更多的优化，如循环展开、调整代码顺序以提高指令级并行性、更激进的内联等。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;此级别的优化可能需要更长的时间来完成，但通常可以显著提高代码的执行速度。&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="628a4db40a394c40ae868789503f89de" MODIFIED="0" TEXT="执行几乎所有不涉及&quot;用空间换时间&quot;的优化选项"/>
                        </node>
                        <node CREATED="0" ID="03a1e936f3164aab9147e36c20a56e6a" MODIFIED="0" TEXT="-O3">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;-O3：启用最高级别的优化。除了 -O2 中的优化之外，编译器将执行更多的优化，如更激进的循环优化、矢量化优化等。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;此级别的优化可能需要更长的时间来完成，并且可能会增加编译时间和代码大小。&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="ae4b3ebcb6984fc9ade3736a0f30da83" MODIFIED="0" TEXT="在O2的基础上进一步优化"/>
                        </node>
                    </node>
                </node>
                <node CREATED="0" ID="6bdf5ed0cc2849b299b501c03d48a272" MODIFIED="0" TEXT="JIT动态编译优化">
                    <node CREATED="0" ID="61dd6ee2e768412bb30935e0d885cf02" MODIFIED="0" TEXT="概念">
                        <node CREATED="0" ID="7bb7d23a1dda49269966a25be3a3e987" MODIFIED="0" TEXT="AOT">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong&gt;Ahead-Of-Time&lt;/strong&gt;。&lt;span style="color: rgb(51, 51, 51);"&gt;代码编译发生在程序执行前，即load-time编译。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="a82428a49dd04e9a8c8e02340f2c1b8c" MODIFIED="0" TEXT="​load-time编译"/>
                        </node>
                        <node CREATED="0" ID="e80f72d1a6854fd8a7bea67fc12eb1fb" MODIFIED="0" TEXT="JIT">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong&gt;Just-In-Time。&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;代码编译发生在代码被运行时，可能编译所有或部分程序，即runtime编译。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;以Java为例。Java程序由class组成，这些class包含平台无关的字节码。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;在&lt;strong&gt;解释执行&lt;/strong&gt;时，JVM加载类文件，确定每条字节码的语义，然后执行运算。解释过程中额外的CPU和内存使用意味着Java应用程序的执行速度比本地应用程序慢。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;JIT编译器&lt;/strong&gt;通过在运行时将字节码编译成本机代码来帮助提高Java程序的性能，默认情况下处于启用状态。当一个方法被编译后，JVM会直接调用该方法的编译代码，而不是对其进行解释执行。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;在实践中，方法不是在第一次调用时编译的。对于每个方法，JVM都会维护一个调用计数，该计数从预定义的编译阈值开始，每次调用该方法时都会递减。当调用计数达到零时，将触发该方法的JIT编译。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;因此，经常使用的方法是在JVM启动后不久编译的，而较少使用的方法则是在很久之后编译的，或者根本不编译。&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="0236e67ed4374c0c8eee701552439e27" MODIFIED="0" TEXT="​run-time编译"/>
                        </node>
                    </node>
                    <node CREATED="0" ID="d4b8e592695d4a899c4c53a6756de855" MODIFIED="0" TEXT="动态程序分析">
                        <node CREATED="0" ID="e35be121eb3f439d85995c146759477a" MODIFIED="0" TEXT="热点分析">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;只有当编译所花费的额外时间可以被编译后代码获得的性能提升所补偿的时候，才可以选择对这个方法进行编译。这就要求动态地分析代码运行开销，找到热点代码。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="5c35dba06005494582fe5c69ad8d99ba" MODIFIED="0" TEXT="​基于采样的热点探测">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;strong&gt;基于采样的热点探测&lt;/strong&gt;（Sample Based Hot Spot Detection）。周期性检查各个线程的栈顶，经常出现在栈顶的方法是热点方法。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;优点：简单高效，可以获取方法调用关系（将调用堆栈展开即可）。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;缺点：很难精确确认方法热度，容易受到线程阻塞等外界因素影响。&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                            <node CREATED="0" ID="b4dc40c6215e46ac84006ed52075ec2a" MODIFIED="0" TEXT="​基于计数器的热点探测">
<richcontent TYPE="NOTE">
    <html>
        <head></head>
        <body>&lt;p&gt;&lt;strong&gt;基于计数器的热点探测&lt;/strong&gt;（Counter Based Hot Spot Detection）。为每个方法（甚至代码块）建立计数器，统计方法调用次数，如果执行超过阈值就认为是热点方法。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;优点：结果更精确。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;缺点：实现较为困难，开销大。&lt;/p&gt;</body>
    </html>
</richcontent>
                            </node>
                        </node>
                        <node CREATED="0" ID="5614559a5e3443d98448b74e99ac5828" MODIFIED="0" TEXT="分层编译">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;strong&gt;启动延迟 vs 优化程度&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;HotSpot JVM结合了解释执行和JIT编译，程序最开始被解释执行，从而获得较快的启动速度，之后针对被频繁执行的部分进行JIT编译优化，提升程序性能。&lt;/p&gt;&lt;p&gt;JIT编译又有两种模式：Client模式通过执行较少的编译优化来实现较低的启动延迟，Server模式进行了大量的编译和优化，牺牲了启动时间但最大化了运行后的程序性能。这种分层编译的选择机制需要依赖动态程序分析。&lt;/p&gt;</body>
</html>
                            </richcontent>
                            <node CREATED="0" ID="de3fc18356d6401ead1deb4ccf8a4bca" MODIFIED="0" TEXT="​解释执行"/>
                            <node CREATED="0" ID="fd4ff062163f49cbbaa1b35082df9469" MODIFIED="0" TEXT="​Client (C1) 模式"/>
                            <node CREATED="0" ID="2257d6b7a15a4cc9833ccebb43adc189" MODIFIED="0" TEXT="​Server (C2) 模式"/>
                        </node>
                        <node CREATED="0" ID="ff82afc615114742927297f7bdd4199c" MODIFIED="0" TEXT="PGO编译优化">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;使用JIT编译时，虚拟机可以采集profile数据来理解和利用每次程序运行的行为，JIT编译器可以利用这些profile data来进行&lt;/span&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;PGO&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;（profile-guided optimization），从而为每一次程序的输入定制编译本地机器码，从而提升程序性能。甚至还可以让虚拟机进行更为激进并可能不安全的投机式优化，这种编译优化后的代码可以在后续条件不满足时反编译回来。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                    </node>
                </node>
            </node>
            <node CREATED="0" ID="2df400234ca34ad4b5a9c0cbca8f01fd" MODIFIED="0" TEXT="程序安全">
                <node CREATED="0" ID="67cf914ab1084a4da03f330e22b82ea1" MODIFIED="0" TEXT="可靠性分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;程序分析可以帮助检测并修复代码中的各种类型的bug，例如缓冲区溢出、整数溢出、资源泄漏等。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                    <node CREATED="0" ID="9bf86a8d7ac44805821b59ef231a1f3a" MODIFIED="0" TEXT="FindBugs">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;FindBugs&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt; 就将程序bug总结出若干pattern（如返回值未检查、空指针解引用等等），然后用&lt;/span&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;静态程序分析&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;的办法（控制流分析、数据流分析等）对bug进行检测。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;Hovemeyer, D., &amp;amp; Pugh, W. (2004). Finding bugs is easy. &lt;/span&gt;&lt;em style="color: rgb(51, 51, 51);"&gt;Acm sigplan notices&lt;/em&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;, &lt;/span&gt;&lt;em style="color: rgb(51, 51, 51);"&gt;39&lt;/em&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;(12), 92-106.&lt;/span&gt;&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                    <node CREATED="0" ID="bc7c7ae85ac64da58718465ec34626d0" MODIFIED="0" TEXT="Coverity">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Coverity&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt; 作为一款&lt;/span&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;静态程序分析&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;工具，可以检测C、C++、Java等编程语言中的各种类型的bug。它使用了多种静态分析技术，包括数据流分析和符号执行，以发现潜在的缓冲区溢出、空指针解引用、资源泄漏等问题。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;*Coverity static analysis data sheet.* Retrieved June, 2023, from https://www.synopsys.com/content/dam/synopsys/sig-assets/datasheets/SAST-Coverity-datasheet.pdf&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                    <node CREATED="0" ID="ab48ad35988041a7b97f0e91326f9e79" MODIFIED="0" TEXT="Valgrind">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Valgrind &lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;是一套广泛使用的&lt;/span&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;动态程序分析&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;工具，用于检测内存错误、线程问题、性能问题等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;它提供了多个工具，比如：&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Memcheck&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;。检测内存错误，如使用未初始化的内存、读写已释放的内存、内存泄漏等。&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Helgrind&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;。检测多线程程序中的竞争条件和死锁问题。&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;strong style="color: rgb(51, 51, 51);"&gt;Cachegrind&lt;/strong&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;。它对CPU中的I1、D1和L2缓存执行详细的模拟，因此可以准确地确定代码中缓存未命中的来源。&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;</body>
                            </html>
                        </richcontent>
                        <node CREATED="0" ID="0ac82a95fdeb4c8c8e73ee14763bcaec" MODIFIED="0" TEXT="​Memcheck"/>
                        <node CREATED="0" ID="02ff00ec95d3403382c0beb4ec653714" MODIFIED="0" TEXT="​Cachegrind"/>
                        <node CREATED="0" ID="8f6d98193ca845ad8b68d94c91194538" MODIFIED="0" TEXT="​Helgrind"/>
                    </node>
                </node>
                <node CREATED="0" ID="615f270d30c14876924d71c623f0a889" MODIFIED="0" TEXT="安全性分析">
                    <richcontent TYPE="NOTE">
                        <html>
                            <head></head>
                            <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;静态分析和动态分析或者两者的混合运用都可以用于恶意软件检测。&lt;/span&gt;&lt;/p&gt;</body>
                        </html>
                    </richcontent>
                    <node CREATED="0" ID="8671e79eda72446990695eaf040c5a94" MODIFIED="0" TEXT="​静态分析">
                        <node CREATED="0" ID="b157a42255f4443083eb65627a47c644" MODIFIED="0" TEXT="​分析可执行文件">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;在不运行可执行二进制文件的情况下对其进行分析。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;往往依靠提取和识别过往恶意程序数据库中的pattern来获取可疑二进制文件相关的元数据。因此，恶意软件可以通过混淆、插入无用代码、压缩等方式绕过静态二进制文件分析。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="a0df9b1b034d4a13866ad976c4b8bd9b" MODIFIED="0" TEXT="​分析源码">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;对代码的分析，首先要对程序进行反汇编获取源代码，然后分析其中可能被恶意利用的漏洞。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                    </node>
                    <node CREATED="0" ID="06506104ed7d4872a473f9e0d4ac2146" MODIFIED="0" TEXT="​动态分析">
                        <node CREATED="0" ID="e1eb982c68b34249a578b489797d7816" MODIFIED="0" TEXT="​分析可执行文件">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;对二进制可执行文件，可以将它隔离在安全的环境中运行，然后使用自动工具检测它的行为。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;虽然二进制可执行文件的代码和结构会频繁变化，但恶意软件的行为却往往相似，因此大部分恶意软件族可以用动态程序分析的方式进行检测。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                        <node CREATED="0" ID="7e586383703b472492e4f55076c7453d" MODIFIED="0" TEXT="​分析源码">
                            <richcontent TYPE="NOTE">
<html>
    <head></head>
    <body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;对源代码的动态分析，需要针对不同的输入执行代码，在真实或虚拟的环境中对程序运行过程进行检测。&lt;/span&gt;&lt;/p&gt;</body>
</html>
                            </richcontent>
                        </node>
                    </node>
                </node>
            </node>
            <node CREATED="0" ID="cd3e4bf390a34a7d8199783326964ae7" MODIFIED="0" TEXT="程序开发">
                <node CREATED="0" ID="d18678510d9943c18c42f5a711ed7961" MODIFIED="0" TEXT="IDE使用的程序分析技术">
                    <node CREATED="0" ID="4924bfae84bf412cbb351510b9046055" MODIFIED="0" TEXT="函数调用分析"/>
                    <node CREATED="0" ID="0abbd099859647dd953e88f705d08120" MODIFIED="0" TEXT="变量赋值分析"/>
                    <node CREATED="0" ID="c544d587fea64a5c948082dd20333ff2" MODIFIED="0" TEXT="变量类型分析"/>
                    <node CREATED="0" ID="d9694cea07fd47edb736d49538d6e04e" MODIFIED="0" TEXT="​……"/>
                </node>
                <node CREATED="0" ID="86b93ff15f07472c9c17f5aed66a0f90" MODIFIED="0" TEXT="​实例">
                    <node CREATED="0" ID="b5406381856f46f0b1015a97f1f1caa1" MODIFIED="0" TEXT="VScode的IntelliSense">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;VScode的IntelliSense可以提供代码补全、智能提醒和自动修复等功能。它通过分析源代码的结构、上下文和语义，提供准确的代码建议和错误检查。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;https://code.visualstudio.com/docs/editor/intellisense#_intellisense-for-your-programming-language&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                    <node CREATED="0" ID="2f4a4ef13833472a89e4212101d42866" MODIFIED="0" TEXT="Xcode的Instruments插件">
                        <richcontent TYPE="NOTE">
                            <html>
<head></head>
<body>&lt;p&gt;&lt;span style="color: rgb(51, 51, 51);"&gt;Xcode的Instruments插件可以对程序进行动态分析。它是一个集成在IDE内的强大而灵活的性能分析和测试工具，可以使用插桩来生成profile，检测内存泄漏和性能问题。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;https://help.apple.com/instruments/mac/current/#/dev7b09c84f5&lt;/p&gt;</body>
                            </html>
                        </richcontent>
                    </node>
                </node>
            </node>
        </node>
    </node>
</map>
