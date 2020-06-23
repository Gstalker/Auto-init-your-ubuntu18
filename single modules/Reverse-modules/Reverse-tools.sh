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
sudo apt-get install python3-gmpy2

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
