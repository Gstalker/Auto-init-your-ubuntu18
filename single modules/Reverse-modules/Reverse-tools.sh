#!/bin/sh


echo "This shell need your superuser password"
echo "Don't worry,I don't want to do something bad for your virtual machine."
echo -e "run this shell with : \E[1;31msource .\\Reverse-tools.sh\E[0m"

case $- in
    *i*) ;;
      *) return;;
esac


sudo echo -e "\033[32mInstalling Reverse-tools! \033[0m"

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
#gmpy2 installed!

sudo echo -e "\033[32mReverse-tools Installation finished! \033[0m"
echo -e "\033[32mEnjoy! \033[0m\n"

echo "installed:"
echo "    curl"
echo "    net-tools"
echo "    m4     1.4.18"
echo "    gmp    6.2.0"
echo "    MPFR   4.0.2"
echo "    MPC    1.1.0"
echo -e "    angr                         \033[36m in python3 \033[0m"
echo -e "    gmpy2    2.0.8               \033[36m in python3 \033[0m"
echo -e "    z3                           \033[36m in python3 \033[0m"
echo 
