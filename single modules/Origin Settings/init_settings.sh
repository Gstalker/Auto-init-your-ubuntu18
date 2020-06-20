#!/bin/sh


echo "This shell need your superuser password"
echo "Don't worry,I don't want to do something bad for your virtual machine."
echo -e "run this shell with : \E[1;31msource .\\init_your_ubuntu.sh\E[0m"

case $- in
    *i*) ;;
      *) return;;
esac


sudo echo -e "\033[32mOriginal Setting has been started! \033[0m"
# resolving apt-get & system upgrade

#     rm the lock
sudo rm /var/cache/apt/archives/lock-frontend
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" | sudo tee /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y upgrade 

# resolving python3-pip
sudo apt-get -y install python3-pip
sudo -H python3 -m pip install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple
sudo -H python3 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

#resolving python-pip
sudo apt-get -y install python-pip
sudo -H python -m pip install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple
sudo -H python -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# install git
sudo apt -y install git

#curl
sudo apt -y install curl

#net-tools
sudo apt -y install net-tools

sudo echo -e "\033[32mOriginal Setting has finished! \033[0m"
echo "    更换了apt软件源"
echo "    安装了python2-pip并更换了软件源"
echo "    安装了python3-pip并更换了软件源"
echo "    安装了git"
echo "    安装了curl"
echo "    安装了net-tools"
