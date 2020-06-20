# Reverse-tools.sh
这份shell将为你安装逆向工程常用的几个工具包。

**注意**：本脚本默认用户已经为apt和pip换源。因为网络问题导致的包无法安装不是这个脚本的锅

## 运行方式

```shell
source Reverse-tools.sh
```

## 这份脚本会做的事情:

1. 安装符号执行框架angr
   - 在控制台输入`workon angr`进入angr的virtualenv
   - 在控制台输入`deactivate`退出angr的virtualenv
2. 安装curl
3. 安装net-tools
4. 安装约束求解引擎z3
5. **编译**安装大数运算框架gmpy2   2.0.8 （速度较慢）
   - m4   1.4.18
   - gmp 6.2.0
   - MPFR  4.0.2
   - MPC 1.11.0

## 目前已知的问题

没有写入检测机制

gmpy2安装速度太慢
