#!/bin/bash

git config --global credential.helper store
git config --global pull.rebase false
git config --global user.email "nickjar99@gmail.com"
git config --global user.name "nickjar99"
git config --global http.postBuffer 2097152000
git config --global https.postBuffer 2097152000
git config --global --add safe.directory '*'
