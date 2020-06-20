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

# install pwntools 3.12.2 in python2
sudo -H python -m pip install pwntools==3.12.2

# install pwntools(the latest version) in python3
sudo -H python3 -m pip install pwntools


# install angr
sudo apt-get -y install python3-dev libffi-dev build-essential virtualenvwrapper
sudo -H python3 -m pip install virtualenvwrapper
sudo -H python3 -m pip install setuptools

sudo -H python3 -m pip install -U virtualenv
sudo -H python3 -m pip install -U setuptools

echo "export WORKON_HOME=~/.environments" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc
mkvirtualenv --python=$(which python3) angr && python3 -m pip install angr -i https://pypi.tuna.tsinghua.edu.cn/simple
deactivate

#ropper
sudo -H python3 -m pip install capstone
sudo -H python3 -m pip install filebytes
sudo -H python3 -m pip install ropper

#onegadget
sudo apt -y install ruby
sudo gem install one_gadget


#curl
sudo apt -y install curl

#net-tools
sudo apt -y install net-tools

#z3
sudo -H python3 -m pip install z3

#gmpy2
#    m4 1.4.18
mkdir m4
cd m4
wget http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz
tar -zxf m4-1.4.18.tar.gz
cd m4-1.4.18
./configure -prefix=/usr/local
make
make check       #FAIL: test-update-copyright.sh    : can be ignore
sudo make install
cd ..
cd ..
rm -rf ./m4


#    gmp 6.2.0
mkdir gmp
cd gmp
wget https://gmplib.org/download/gmp/gmp-6.2.0.tar.bz2
tar -jxvf gmp-6.2.0.tar.bz2 && cd gmp-6.2.0
./configure --prefix=$HOME/static --enable-static --disable-shared --with-pic
make
make check
make install
cd ..
cd ..
rm -rf ./gmp


#    MPFR 4.0.2
mkdir mpfr
cd mpfr
wget http://www.mpfr.org/mpfr-current/mpfr-4.0.2.tar.xz
tar xf mpfr-4.0.2.tar.xz && cd mpfr-4.0.2
./configure --prefix=$HOME/static --enable-static --disable-shared --with-pic --with-gmp=$HOME/static
make
make check
make install
cd ..
cd ..
rm -rf mpfr

#    MPC 1.1.0
mkdir MPC
cd MPC
wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
tar -zxvf mpc-1.1.0.tar.gz && cd mpc-1.1.0
./configure --prefix=$HOME/static --enable-static --disable-shared --with-pic --with-gmp=$HOME/static --with-mpfr=$HOME/static
make
make check
make install
cd ..
cd ..
rm -rf MPC

#    complie gmpy2 2.0.8
mkdir gmpy2
cd gmpy2
wget https://files.pythonhosted.org/packages/90/f4/9a2e384b325b69bc5827b9a6510a8fb4a51698c915c06a3f25a86458892a/gmpy2-2.0.8.zip
unzip gmpy2-2.0.8.zip && cd gmpy2-2.0.8
sudo -H python3 setup.py build_ext --static-dir=$HOME/static install
cd ..
cd ..
rm -rf ./gmpy2

# result
echo
echo
echo -e "\033[32mOriginal Setting has been finished! \033[0m\n"
echo -e "\033[32mEnjoy! \033[0m\n"
echo "installed:"
echo "    python3-pip"
echo "    python2-pip"
echo "    git"
echo "    OneGadget"
echo "    curl"
echo "    net-tools"
echo "    m4     1.4.18"
echo "    gmp    6.2.0"
echo "    MPFR   4.0.2"
echo "    MPC    1.1.0"
echo -e "    pwntools 3.12.2              \033[33m in python2 \033[0m"
echo -e "    pwntools(the latest version) \033[36m in python3 \033[0m"
echo -e "    ropper                       \033[36m in python3 \033[0m"
echo -e "    angr                         \033[36m in python3 \033[0m"
echo -e "    gmpy2    2.0.8               \033[36m in python3 \033[0m"
echo -e "    z3                           \033[36m in python3 \033[0m"
echo 
