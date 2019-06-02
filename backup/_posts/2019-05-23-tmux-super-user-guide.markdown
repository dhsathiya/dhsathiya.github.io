---
layout: post
title: "Tmux super user guide"
date: 2019-05-23
categories: ubuntu
tags: tmux oh-my-zsh terminal
---
Tmux gives hacker like feel to a terminal and other than that it has some super cool features as well (explore on your own !).

This guide will provide you steps to make the Tmux UX even better.

---<br />
## Install Zsh and oh-my-zsh
Zsh is an extended Bourne shell with a large number of improvements, including some features of Bash, ksh, and tcsh.

Zsh alongside oh-my-zsh provides custom themes to the terminal to get the best view.

To install Zsh and oh-my-zsh use the following commands:
```
$ sudo apt install zsh

$ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
You can also use oh-my-zsh website to get the installation instructions : [https://ohmyz.sh/][https://ohmyz.sh/]

---<br />
## Configure tmux for custom shortcuts
tmux comes with pre configured shortcuts such as C-b as prefix. But in most of the cases they seems lengthy.

To overcome these situation we can also create our custom shortcuts.

# Create .tmux.conf
In most of the cases (whenever I installed tmux) I never got a .tmux.conf file.

Use the following command to create one
```
touch ~/.tmux.conf
```
# Add custom shortcuts
To add custom shortcut open up .tmux.conf file in your preferred editor (such as vim or nano) and add the following code blocks as per your requirements.
```
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# split panes using h and v
bind h split-window -h
bind v split-window -v
unbind '"'
unbind %

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

# switch panes using Alt(M here)-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

---<br />
## What Next ?
I am not going to explain every bit of code here to make you to explore more.

Go and try out other changes. Play with it to make yourself more clear about the things going on here ! 🙂

[https://ohmyz.sh/]: https://ohmyz.sh/

