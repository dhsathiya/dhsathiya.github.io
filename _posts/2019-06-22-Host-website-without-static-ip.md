---
layout: post
title: "Host website without static IP"
date: 2019-05-21 
categories: hosting
tags: free hosting raspberry IP
---

I always wanted to try to setup a home based server. So I created a setup with Raspberry Pi, TP-link Router and a free Dynamic DNS service.

Stuff that you need :
1. Raspberry Pi / Laptop / PC [I am using Raspberry Pi with Debian based OS]
2. Cludflare or DNS service
3. Own domain name [If you have]
4. Working internet connection

**Step 1:**

Install Nginx or any web server in Raspberry Pi.

**Step 2:**

Use a DDNS service like [freemyip.com][freemyip.com]

Go to freemyip.com and check your domain is available or not.

If available claim it and store the credentials.

Save the URL that appears on your screen.

**Step 3:**

Setup Dynamic DNS in your router. [Not necessary maybe I was not able to test without that due to clear field is not option available]

**Step 4:**

Get your IP address by running this command 

```bash
curl -4 icanhazip.com
```

**Step 5:**

Update the DNS record with your IP

```bash
# replace <> with your values
curl https://freemyip.com/update?token=<your token here>&domain=<your-ddns.freemyip.com>&myip=<your IP here>
```

Cool now you can access the server with the Domain you created with DDNS service. [In here freemyip.com]

**Step 6:**

If you have a domain and want to point that to new server then add a CNAME record.

```
CNAME your-domain.com your-ddns.freemyip.com
```

**Step 7:**

Now we don't have static IP so it will keep changing after a while.

To update that you can create a cron to keep the things updated every minute.

> Get connected with me on Instagram : [@d.vlpr][@d.vlpr] and Twitter : [dhsathiya][dhsathiya]


[freemyip.com]: https://freemyip.com
[@d.vlpr]: https://instagram.com/d.vlpr
[dhsathiya]: https://twitter.com/dhsathiya
