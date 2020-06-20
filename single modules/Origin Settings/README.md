# init_settings.sh
为刚装好的虚拟机设置apt和pip，顺带安装git

## 运行方式

```shell
source ./init_settings.sh
```

## 这份脚本会做的事情:

1. 更换apt软件源为阿里云源
2. 安装python3-pip并更换pip3为清华源
3. 安装python2-pip并更换pip 为清华源
4. 安装git         （代码仓库管理工具）
5. 安装curl
6. 安装net-tools

## 目前已知的问题

没有写入检测机制
