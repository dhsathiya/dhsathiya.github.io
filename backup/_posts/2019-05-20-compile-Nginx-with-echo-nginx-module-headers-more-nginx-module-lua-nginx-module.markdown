---
layout: post
title: "Compile Nginx with echo-nginx-module, headers-more-nginx-module, lua-nginx-module"
date: 2019-05-20
categories: nginx
tags: compile echo header lua module nginx
---
Compile and build Nginx with echo headers-more and lua modules

 > Get Nginx, modules and depencies from github. <br />
 > I wanted this article to be specific. 

Download these before you start
```
Nginx : 
Get it from Github.

Dependencies : 
LuaJIT-2.0.4  lua2.0  lua2.1  pcre-8.42  zlib-1.2.11 

Modules : 
echo-nginx-module  headers-more-nginx-module  lua-nginx-module
ngx_devel_kit
```
--- <br />
## Steps to be followed
Run make and make install in the following directories.
```
LuaJIT-2.0.4  lua2.0  lua2.1  pcre-8.42  zlib-1.2.11
```

Now you have to tell Nginx that where lua-2.0 and lua-2.1 are located.
```bash
# tell nginx's build system where to find LuaJIT 2.0:
export LUAJIT_LIB=/usr/local/lib/
export LUAJIT_INC=/usr/local/include/luajit-2.0

# tell nginx's build system where to find LuaJIT 2.1:
export LUAJIT_LIB=/usr/local/lib/
export LUAJIT_INC=/usr/local/include/luajit-2.1
```
Go to Nginx directory and run the following commands.
```bash
LUAJIT_LIB=/usr/local/lib LUAJIT_INC=/usr/local/include/luajit-2.0 \
./configure \
--user=nobody \
--group=nobody \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--with-http_gzip_static_module \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-pcre \
--with-file-aio \
--with-http_realip_module \
--without-http_scgi_module \
--without-http_uwsgi_module \
--without-http_fastcgi_module ${NGINX_DEBUG:+--debug} \
--with-cc-opt=-O2 --with-ld-opt='-Wl,-rpath,/usr/local/lib' \
--add-module=../modules/echo-nginx-module \
--add-module=../modules/headers-more-nginx-module \
--add-module=../modules/ngx_devel_kit \
--add-module=../modules/lua-nginx-module
```
```bash
make install
```

--- <br />
## Test the build
To test if all this works or not

```bash
nginx -t
```
if you get this message below
```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok 
nginx: configuration file /etc/nginx/nginx.conf test is successful
then the installation was successful.
```
Check the installed modules by running
```bash
nginx -V
```
To test the echo and lua modules add these line to your nginx.conf file after location / { }

``` 
location /echo {
        echo hello;
        echo world;
}
location /sum {
    content_by_lua_block {
        local args = ngx.req.get_uri_args();
        ngx.say(args.a + args.b)
    }
}
```
Restart Nginx and hit the following command to test echo

```bash
curl "http://localhost:<your-port>/echo"
```
and for lua
```bash
curl "http://localhost:<your-port>/sum/?a=10&b=20"
```

---<br />
If you find that there is something missing then you can contact me through

[instagram][instagram], email or twitter link given below.

[instagram]: https://instagram.com/d.vlpr

