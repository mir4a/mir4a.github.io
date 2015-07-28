---
layout: post
title:  "Freeze, javascript!"
description: "Quick hint how to disable js for styling tooltips and other newly added DOM elements."
categories:
  - blog
  - debug
tags: devtools, css, javascript, jquery  
---

Sometimes I want to freeze time and fix some issues motionless. Sadly but in real life it's not
possible. But in front-end life I can freeze some jquery plugin and do whatever I want.
 
The approach described below can save some time in css customizing dynamically added DOM elements, 
such as [tooltips](http://getbootstrap.com/javascript/#tooltips).

Here is the short screencast of how to freeze js:

<div class="video_responsive"> 
  <iframe width="100%" 
          src="https://www.youtube.com/embed/zobRra0wkHs" 
          frameborder="0" 
          allowfullscreen></iframe>
</div>        

And step by step explanation:

- Turn on DevTools (hotkey Cmd+alt+I)
- Click on `Settings`
- Check `Disable JavaScript` option
- Turn off DevTools
- Do some actions that will be handled by js and added new DOM elements (in my case just make sure 
that mouse cursor is over element with tooltip)
- After new element is added and visible stop moving cursor and enable DevTools again by using hotkey
- Debug/add styles or do whatever you need on newly added element.

I hope it was helpful for you as for me. Thanks for watching!
