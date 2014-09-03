---
author: simon
comments: true
date: 2014-08-28 14:12:38+00:00
layout: post
title: DNSMASQ IN OSX
categories:
- osx
- vagrant
wordpress_id: 27
---

## Installing Dnsmasq





    brew up && brew install dnsmasq






The installation process will output several commands that you can use to start Dnsmasq automatically with a default configuration. I used the following commands but you should use whichever commands brew tells you to:





## Configuring Dnsmasq





Now that you have Dnsmasq installed and running, it’s time to configure it! The configuration file lives at `/usr/local/etc/dnsmasq.conf` by default, so open this file in your favourite editor.





One the many, many things that Dnsmasq can do is compare DNS requests against a database of patterns and use these to determine the correct response. I use this functionality to match any request which ends in .dev and send `10.200.200.10` in response. The Dnsmasq configuration directive to do this is very simple:





    address=/dev/10.200.200.10






Insert this into your `/usr/local/etc/dnsmasq.conf` file (I put it near the example `address=/double-click.net/127.0.0.1` entry just to keep them all together) and save the file.





You may need to restart Dnsmasq to get it to recognise this change. Restarting Dnsmasq is the same as any other service running under `launchd`:





    sudo launchctl stop homebrew.mxcl.dnsmasq
    sudo launchctl start homebrew.mxcl.dnsmasq






You can test Dnsmasq by sending it a DNS query using the `dig` utility. Pick a name ending in `dev` and use dig to query your new DNS server:





    dig local.site.dev @127.0.0.1






You should get back a response something like:





    ;; ANSWER SECTION:
    local.site.dev. 0 IN    A   10.200.200.10






## Configuring OS X





    sudo mkdir -p /etc/resolver
    # Create file for domain .dev
    sudo tee /etc/resolver/dev >/dev/null <<EOF
    nameserver 127.0.0.1
    EOF






## Testing.





    # Make sure you haven't broken your DNS.
    ping -c 1 www.google.com
    # Check that .dev names work
    ping -c 1 this.is.a.test.dev
    ping -c 1 iam.the.walrus.dev




