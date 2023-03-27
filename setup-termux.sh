#!/bin/bash

echo 'alias h="cd ~/storage/shared"' >> ~/.zshrc
echo 'alias school="cd ~/storage/shared/School"' >> ~/.zshrc
echo 'alias config="cd ~/storage/shared/configs"' >> ~/.zshrc

echo "alias pu='pkg upgrade'" >> ~/.zshrc
echo "alias pi='pkg install'" >> ~/.zshrc
echo "alias ps='pkg search'" >> ~/.zshrc

# gets ip address
echo "alias ipa=\"sudo ip a | grep UP -A 2 | grep inet | grep wlan | sed \\\"s/\ .*inet \(.*\)\/.*/\1/\\\"\"" >> ~/.zshrc
echo "alias ipa2=\"echo -n "$(whoami)@" && sudo ip a | grep UP -A 2 | grep inet | grep wlan | sed \\\"s/\ .*inet \(.*\)\/.*/\1/\\\"\"" >> ~/.zshrc

