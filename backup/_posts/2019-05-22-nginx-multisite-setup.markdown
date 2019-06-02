---
layout: post
title: "Nginx multisite setup"
date: 2019-05-22
categories: nginx
tags: multisite nginx setup
---

> You’ll get to make Nginx multisite setup on your local machine. Which further can be expanded to on your live servers !

Website default configurations which are used by Nginx to point which site to access and where the root of that website resides at /etc/nginx/sites-available/default who’s symlink is created at /etc/nginx/sites-enabled/.

---<br />
## Creating two websites to test
Run the following command to create Index files and inserting some dummy text inside them.
```bash
mkdir /var/www/html/one.test/public_html/ &&
touch /var/www/html/one.test/public_html/index.html &&
echo "one.test" > /var/www/html/one.test/public_html/index.html &&
mkdir /var/www/html/two.test/public_html/ &&
touch /var/www/html/two.test/public_html/index.html &&
echo "two.test" > /var/www/html/two.test/public_html/index.html
```
This will create two directories (here websites) named one.test and two.test and the same names as their respective content.

---<br />
## Configure the default file
Now we have to tell Nginx that on request which directory to consider.

For this replace the content of default file with the below code.
```
server {
        listen 80;
        listen [::]:80;

        root /var/www/html/one.test/public_html/;

        index index.html index.htm index.nginx-debian.html;

        server_name one.test;

        location / {
                try_files $uri $uri/ =404;
        }
}
server {
        listen 80 ;
        listen [::]:80 ;

        root /var/www/html/two.test/public_html/;

        index index.html index.htm index.nginx-debian.html;

        server_name two.test;

        location / {
                try_files $uri $uri/ =404;
        }
}
```
>The best way to learn is explore on your own.<br />
>So please try to fetch the things up on your own. Just Google them out.

Now restart Nginx with `sudo service nginx restart` .

---<br />
## Configure your /etc/hosts list
I am using a virtual machine to setup all of these. This virtual machine is runnig at 192.168.33.78 IP address inside my host machine .

You can change it according to your requirements.

Add the following line to `/etc/hosts` file.
```
192.168.33.78 one.test two.test 
```

---<br />
That’s it ! Go to your browser and hit any of one.test or two.test .
