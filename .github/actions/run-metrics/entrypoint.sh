#!/bin/bash

cd $GITHUB_WORKSPACE/$ACTION_WORKSPACE/src

cp -r $GITHUB_WORKSPACE/pull-request-data . 

pwd
ls

python3 main.py
