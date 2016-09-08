#!/bin/bash
#install sqlite3 (pip install sqlite3) 
sudo apt-get install sqlite3 libsqlite3-dev
#install flask
pip install flask
#install wand
pip install wand
#install imagemagick
apt-get install -y libmagickwand-dev
#install npm and nodejs
sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get -y install npm
cd /home/ubuntu/opencv/mineye
#npm install should be inside mineye to find the package.json
npm install
#install webpack to use webpack command
npm install webpack -g
ln -s /usr/bin/nodejs /usr/bin/node
#before executing webpack change home.jsx jQuery to jquery
webpack
webpack --watch
