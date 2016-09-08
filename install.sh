#!/bin/bash
# download pip, a Python package manager, in python 2.7 directory +
cd ~
rm -rf .cache
wget 'https://bootstrap.pypa.io/get-pip.py'
chmod 0400 "/home/ubuntu/get-pip.py" 
#install pip 
sudo -H python ~/get-pip.py
#install Python 2.7 development tools
sudo -H apt-get install python2.7-dev
#install numpy into cv virtual environment
sudo -H pip install numpy
#change to home directory, download opencv from github and checkout 3.0.0 version
rm -rf opencv
cd ~
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout 3.0.0
#change to home directory, download opencv_contrib(keypoint detectors) and checkout version
cd ~
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.0.0
#setup the build 
cd ~/opencv
mkdir build
cd build
sudo -H cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D INSTALL_C_EXAMPLES=ON \
  -D INSTALL_PYTHON_EXAMPLES=ON \
  -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
  -D BUILD_EXAMPLES=ON ..
#Compile opencv
sudo -H make
#install opencv 
sudo -H make install
#sym-link opencv into the site-packages directory 
cd /usr/local/lib/python2.7/site-packages
ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so
