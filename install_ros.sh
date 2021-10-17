#!/bin/zsh
# Configure your Ubuntu repositories
# save link below to source.list
# deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties
# deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted
# deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties
# deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted
# deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties
# deb http://mirrors.aliyun.com/ubuntu/ xenial universe
# deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
# deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse
# deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse
# deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties
# deb http://archive.canonical.com/ubuntu xenial partner
# deb-src http://archive.canonical.com/ubuntu xenial partner
# deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted
# deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties
# deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
# deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse

echo "=====Setup your sources.list"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "=====Set up your keys"
sudo apt install curl # if you haven't already installed curl
sudo apt-key add ros.ascrv

echo "=====Installation"
sudo apt update
sudo apt-get install ros-kinetic-desktop

echo "=====Environment setup"
echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

echo "=====Dependencies for building packages"
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

echo "=====Initialize rosdep"
sudo apt install python-rosdep
sudo rosdep init
rosdep update
