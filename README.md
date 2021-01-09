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
3. 安装git         （代码仓库管理工具）
4. 安装ropper （pwn工具）
5. 安装curl
6. 安装net-tools
7. 安装python3工具包
    - pwntools （the latest version）
    - angr （ in Vritualenv)
      - 在控制台输入 `workon angr`以进入安装了angr的虚拟环境
      - 在angr虚拟环境中输入`deactivate`退出angr虚拟环境
    - ropper
    - z3 约束求解引擎
    - gmpy2 大数计算框架

## 更新内容
移除了所有有关python2的内容
增加了检测机制:可以告诉用户哪些模块成功安装了，哪些模块未被安装

## 目前已知的问题
在某些版本的ubuntu中，angr似乎不能很好的被安装。
 
# 文件夹single modules

如果你只是想换个源，不想安装哪些花里呼哨的工具包

或者你并不想换源，只是单纯的想安装几个工具包，

又或者你只是想安装某个方面特长的工具包

那就看看这个文件夹吧，里边对init_your_ubuntu.sh中的指令进行了分类

# 还想要什么工具包？
直接在issue里头提吧！

也欢迎各位为这个项目添砖加瓦
