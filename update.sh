#!/bin/bash

git add .
git commit -m "auto backup $(date)"
git push origin master
