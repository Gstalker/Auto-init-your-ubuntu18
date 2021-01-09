#!/bin/sh
function python3_check(){
  if python3 -c "import $1" >/dev/null 2>&1
  then
      echo "true"
  else
      echo "false"
  fi
}

function command_check(){
  if command -v $1 > /dev/null;then
    echo "true"
  else
    echo "false"
  fi
}

echo "This shell need your superuser password"
echo "Don't worry,I don't want to do something bad for your virtual machine."
echo -e "run this shell with : \E[1;31msource .\\init_your_ubuntu.sh\E[0m"

case $- in
    *i*) ;;
      *) return;;
esac

result=$(sudo whoami)
if test "${result}" == "root";then
  echo -e "\033[32mOriginal Setting has been started! \033[0m"
  unset result
else
  echo "ERROR!"
  exit 1
fi

# installing apt-get & system upgrade
#     rm the lock
sudo rm /var/cache/apt/archives/lock-frontend
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

# get the system version
version=$(lsb_release -r)
if [[ "${version}" =~ "16.04" ]];then
  code="xenial"
elif [[ "${version}" =~ "16.10" ]];then
  code="yakkety"
elif [[ "${version}" =~ "17.04" ]];then
  code="zesty"
elif [[ "${version}" =~ "17.10" ]];then
  code="artful"
elif [[ "${version}" =~ "18.04" ]];then
  code="bionic"
elif [[ "${version}" =~ "18.10" ]];then
  code="cosmic"
elif [[ "${version}" =~ "19.04" ]];then
  code="disco"
elif [[ "${version}" =~ "19.10" ]];then
  code="eoan"
elif [[ "${version}" =~ "20.04" ]];then
  code="focal"
elif [[ "${version}" =~ "15.10" ]];then
  code="wily"
elif [[ "${version}" =~ "15.04" ]];then
  code="vivid"
elif [[ "${version}" =~ "14.10" ]];then
  code="utopic"
elif [[ "${version}" =~ "14.04" ]];then
  code="trusty"
fi

# bak the original list
sudo cp -ra /etc/apt/sources.list /etc/apt/sources.list.bak

echo "deb http://mirrors.aliyun.com/ubuntu/ ${code} main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${code}-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${code}-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${code}-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ ${code}-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${code} main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${code}-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${code}-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${code}-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${code}-backports main restricted universe multiverse" | sudo tee /etc/apt/sources.list

sudo apt-get update
sudo apt-get -y upgrade 

# install python3-pip
sudo apt-get -y install python3-pip
sudo -H python3 -m pip install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple
sudo -H python3 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# check python3-pip
success_python3_pip=$(python3_check pip)

# install git
sudo apt -y install git
success_git=$(command_check pip)

# install pwntools(the latest version) in python3
sudo -H python3 -m pip install pwntools
success_python3_pwn=$(python3_check pwn)

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

if workon angr >/dev/null 2>&1;then
  success_angr="true"
  deactivate
else 
  success_angr="false"
fi

#ropper
sudo -H python3 -m pip install capstone
sudo -H python3 -m pip install filebytes
sudo -H python3 -m pip install ropper
success_ropper=$(command_check ropper)

#onegadget
sudo apt -y install ruby
sudo gem install one_gadget
success_one_gad_get=$(command_check one_gadget)
#curl
sudo apt -y install curl
success_curl=$(command_check curl)

#net-tools
sudo apt -y install net-tools
success_net_tools=$(command_check ifconfig)

#z3
sudo -H python3 -m pip install z3
success_z3=$(python3_check z3)

#gmpy2
sudo apt -y install python3-gmpy2
success_gmpy2=$(python3_check gmpy2)


# result
echo
echo
echo -e "\033[32mOriginal Setting has been finished! \033[0m\n"
echo -e "\033[32mEnjoy! \033[0m\n"
echo "result:"
echo -e "\033[31mred\033[0m : failed in installation\n\n"
if test "${success_python3_pip}" == "true" ;then
  echo "    python3-pip"
else
  echo -e "    \033[31mpython3-pip\033[0m"
fi

if test "${success_git}" == "true" ;then
  echo "    git"
else
  echo -e "    \033[31mgit\033[0m"
fi

if test "${success_one_gad_get}" == "true" ;then
  echo "    OneGadget"
else
  echo -e "    \033[31mOneGadget\033[0m"
fi

if test "${success_curl}" == "true" ;then
  echo "    curl"
else
  echo -e "    \033[31mcurl\033[0m"
fi

if test "${success_net_tools}" == "true" ;then
  echo "    net-tools"
else
  echo -e "    \033[31mnet-tools\033[0m"
fi

if test "${success_python3_pwn}" == "true" ;then
  echo -e "    pwntools(the latest version) \033[36m in python3 \033[0m"
else
  echo -e "    \033[31mpwntools(the latest version)\033[0m  \033[36m in python3 \033[0m"
fi

if test "${success_ropper}" == "true" ;then
  echo -e "    ropper                       \033[36m in python3 \033[0m"
else
  echo -e "    \033[31mropper\033[0m                       \033[36m in python3 \033[0m"
fi

if test "${success_angr}" == "true" ;then
  echo -e "    angr                         \033[36m in python3 \033[0m"
else
  echo -e "    \033[31mangr\033[0m                       \033[36m in python3 \033[0m"
fi

if test "${success_gmpy2}" == "true" ;then
  echo -e "    gmpy2                        \033[36m in python3 \033[0m"
else
  echo -e "    \033[31mgmpy2\033[0m                         \033[36m in python3 \033[0m"
fi

if test "${success_z3}" == "true" ;then
  echo -e "    z3                           \033[36m in python3 \033[0m"
else
  echo -e "    \033[31mz3\033[0m                               \033[36m in python3 \033[0m"
fi
echo 