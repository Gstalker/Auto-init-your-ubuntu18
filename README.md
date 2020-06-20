# Auto-init-your-ubuntu18
一键配置你的ubuntu18！

注意！本仓库中的脚本需要superuser权限。如果担心这份shell会利用你的电脑做一些奇奇怪怪的事情，那么请无视这个项目=。=

## 运行方式
下载`init_your_ubuntu`,并把它复制到你的虚拟机中
```shell
source init_your_ubuntu.sh
```

## 这份脚本会做的事情:

1. 更换apt软件源为阿里云源
2. 安装python3-pip并更换pip3为清华源
3. 安装python2-pip并更换pip 为清华源
4. 安装git         （代码仓库管理工具）
5. 安装ropper （pwn工具）
6. 安装curl
7. 安装net-tools
8. 安装gmpy2前置需求：
   - m4 1.4.18
   - gmp 6.2.0
   - MPFR 4.0.2
   - MPC 1.1.0
9. 安装python2工具包  ： pwntools 3.12.2
10. 安装python3工具包
    - pwntools （the latest version）
    - angr （ in Vritualenv)
      - 在控制台输入 `workon angr`以进入安装了angr的虚拟环境
      - 在angr虚拟环境中输入`deactivate`退出angr虚拟环境
    - ropper
    - z3 约束求解引擎
    - gmpy2 大数计算框架 **（编译安装，速度较慢）**

## 目前已知的问题

没有写入检测机制。后续更新会逐渐整进去

# 文件夹single modules

如果你只是想换个源，不想安装哪些花里呼哨的工具包

或者你并不想换源，只是单纯的想安装几个工具包，

又或者你只是想安装某个方面特长的工具包

那就看看这个文件夹吧，里边对init_your_ubuntu.sh中的指令进行了分类

# 还想要什么工具包？
直接在issue里头提吧！

也欢迎各位为这个项目添砖加瓦
