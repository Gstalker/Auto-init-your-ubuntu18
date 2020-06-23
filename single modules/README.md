# single modules
这个目录下的各个文件夹对应不同种类的需求

这份文档只是一个简介。各个模块的详细内容在文件夹内另外有文档说明

内容不是一成不变的，随着需求会逐渐增多

## Origin Settings

刚装好的虚拟机可以使用

如果你只是单纯的想换个源，装个pip和git，并不想要哪些花里胡哨的工具包

那就运行这份shell吧！

## Reverse-modules

逆向工程可能用到的模块

主要是用来解方程和符号执行的

## Pwn-modules

pwn需要用的工具。

Onegadget，pwntools……

有这些常用工具才能打pwn呀

## Install-gmpy2-by-compling-it

这个文件夹里头的是通过编译安装gmpy2脚本。

用户反馈说gmpy2安装太慢了。

我排查了一下原因：gmpy2编译安装需要从gnu的服务器上搞下来源码，速度很慢

于是把各个脚本中安装gmpy2的方法改成了从apt获取软件源。

如果想要在自己的电脑上编译安装gmpy2，可以尝试这个文件夹里头的脚本。
