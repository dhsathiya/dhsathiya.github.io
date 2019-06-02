#!/bin/bash
rsync -avzh ~/HDD/dhsathiya.github.io/_site/* .
rsync -avzh ~/HDD/dhsathiya.github.io/_posts/* ./_posts 
rsync -avzh ~/HDD/dhsathiya.github.io/_config.yml .
rsync -avzh ~/HDD/dhsathiya.github.io/ backup
git add .
git commit -m "auto backup $(date)"
git push origin master

