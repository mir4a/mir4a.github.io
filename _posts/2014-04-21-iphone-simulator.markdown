---
layout: post
title:  "Iphone simulator"
categories:
  - blog
  - bash
---

How many times you've been searching for iphone simulator and always opening XCode for just run the simulator? I did a lot of times. Eventually you only need to run simple terminal command to open the simulator. Here it is:

{% highlight bash %}
open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app
{% endhighlight %}

But wait, you don't have to remember it and type again and again. Just add `alias` like a shortcut for running a program.

{% highlight bash %}
alias iphone='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
{% endhighlight %}
