---
layout: post
title: "How to setup Github pages blog"
date: 2019-05-25 23:53:11 +0530
tags: github blog jekyll
---
I was planning to write this post since a while but could not because of I was busy finding a way to make a docker image to handle the building ofjekyll. I finally done it.

Here are the steps to make your own GitHub hosted blog:

1. Create a repository named : `<your-gh-user-name>.github.io`
> I mainly use docker container for building my Jekyll files and I would suggest to use the same to keep your system clean and staying out of trouble.
2. clone that repository on your local machine.
3. make a directory with any name that you want. For example : `mkdir myblog`
4. run the following command in order to make a jekyll site and serve it to local machine so that you can make changes locally.
```
docker run -d -v /media/devarshi/HDD/dhsathiya.github.io:/content --name=blog -p 127.0.0.1:4000:4000 dhsathiya/ghblog
```
> You can find the dockerfile on [Dockerfile][Dockerfile].
5. Now once run the command you can check your blog running on `127.0.0.1:4000` in your browser.
> Every changes that you want to do in the blog can be done at `myblog` directory.<br/>
> If your changes does not appear after a refresh or more then you have to restart the container by `docker container restart blog`
6. To publish the blog copy the contents of the `myblog/_site/` to your cloned Github repository
7. `git add && git commit && git push`
> I know the answer why to do the step 6 manually? Not quite sure. <br/>
> If you find any permission issues on step 7 restart the container and do step 6.

I hope the steps mentioned above worked out for you as well.

If not you can email me or send a DM or twitter.
 
[Dockerfile]: https://github.com/dhsathiya/docker/tree/master/dockerfiles/ghblog
 
