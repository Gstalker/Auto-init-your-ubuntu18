#!/bin/sh
echo "This shell need your superuser password"
echo "Don't worry,I don't want to do something bad for your virtual machine."
echo -e "run this shell with : \E[1;31msource .\\Pwn-tools.sh\E[0m"

case $- in
    *i*) ;;
      *) return;;
esac


sudo echo -e "\033[32mInstalling Pwn-tools! \033[0m"

#ropper
sudo -H python3 -m pip install capstone
sudo -H python3 -m pip install filebytes
sudo -H python3 -m pip install ropper

#onegadget
sudo apt -y install ruby
sudo gem install one_gadget

# install pwntools 3.12.2 in python2
sudo -H python -m pip install pwntools==3.12.2

# install pwntools(the latest version) in python3
sudo -H python3 -m pip install pwntools


#curl
sudo apt -y install curl

#net-tools
sudo apt -y install net-tools


sudo echo -e "\033[32mPwn-tools Installation finished! \033[0m"
echo -e "\033[32mEnjoy! \033[0m\n"

echo "installed:"
echo "    curl"
echo "    net-tools"
echo "    OneGadget"
echo -e "    ropper                       \033[36m in python3 \033[0m"
echo -e "    pwntools 3.12.2              \033[33m in python2 \033[0m"
echo -e "    pwntools(the latest version) \033[36m in python3 \033[0m"
echo 