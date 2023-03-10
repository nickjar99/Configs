#!/bin/sh

rm -rf *
cd ..
rm -rf configs
rm -rf Configs

git clone https://github.com/nickjar99/configs.git
cd configs
echo "Done!"
