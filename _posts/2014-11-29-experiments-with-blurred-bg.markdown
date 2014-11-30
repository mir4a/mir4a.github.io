---
layout: post
title:  "Experiments with blurred background"
categories:
  - blog
  - experiments
tags: blur, css, throttle, debounce, jquery  
---

This summer I was involved in studying front-end course sponsored by Binary Studio and the exit course project we've built was [Hurri](http://github.com/msemenistyi/hurri) — the project that streaming music from social network.
One of the task was to build fancy sign up page and I was thought that it would be great to made blurred bg with grids of greatest albums cover pics and put some fancy action on it.
For the action I decided to use some kind of window which is moving by cursor and show un-blurred view of bg. Below you can see how to implement this using html, css and javascript.

##1. Making layers

The idea is to create two layers. First is laying behind and has `z-index:0` and blurred effect. The second is laying upward with `z-index:1` and has the same image as first but without blur effect.
Both layers are positioned the same way and has `position:absolute` and stretched outside of view port using offset:

{% highlight sass %}
// Simple mixin for prefixed attributes
=blur($radius)
  -webkit-filter: blur($radius)
  filter: blur($radius)

// Variable with offset value
$offset_position: -20px

.blurred_bg, .blurred_bg_hover
  position: fixed
  top: $offset_position
  right: $offset_position
  bottom: $offset_position
  left: $offset_position
  background: url("/images/experimental/bg_covers.jpg")
  background-size: cover

// First layer
.blurred_bg
  z-index: 0
  +blur(5px)
  
// Second layer
.blurred_bg_hover
  clip: rect(0 0 0 0)
  z-index: 1
{% endhighlight %}

You may notice, I'm using `clip` which is very old property and allow to clip rectangular shapes and even **IE4-7** support this property but with comma delimiter instead of space for coordinate values.
There is another property `clip-path` which can use svg path for masking. Great <a href="http://www.html5rocks.com/en/tutorials/masking/adobe/" target="_blank">article</a> on HTML5 Rocks explaining how to use `clip-path`. 

That's it. Basic layout is ready. Of course, markup is very simple and contains of two divs:

{% highlight html %}
<div class="blurred_bg"></div>
<div class="blurred_bg_hover"></div>
{% endhighlight %}

##2. Adding some action

Originally, the project was written on **BackboneJS** and it has **Underscore** as helper library. And Underscore has useful method <a href="http://underscorejs.org/#throttle" target="_blank">`_.throttle()`</a>.
It will help prevent calling function every millisecond, because I'm going to call clipping every time user move cursor without throttling it may cause some lags.
For this example I will use jQuery and Underscore, but there is numerous solutions in the internet written on plain js.
 
So, idea is to set clipping coordinates according cursor's position. But first, let's inject jquery and underscore:

{% highlight html %}
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://underscorejs.org/underscore-min.js"></script>
{% endhighlight %}

Ok, jquery will return event object for our function on **mousemove** event, so I can find out position X and Y for the pointer.
By subtract or add some **gap** value I can set coordinates for clip rectangle.

{% highlight javascript %}
var blur = $('.blurred_bg_hover');
// Gap with value of 75 will bring us 150px square for clip.
var gap = 75;

// Function which is setup coordinates for clip.
function clipMove(e) {
  var y1 = e.clientY - gap,
      x1 = e.clientX + gap,
      y2 = e.clientY + gap,
      x2 = e.clientX - gap;
  blur.css('clip', 'rect('+ y1 +'px, ' + x1 + 'px, ' + y2 + 'px, ' + x2 + 'px)');
}

// Throttled version of clipMove function which would be called on mousemove, 
// but fired original function only every 80 milliseconds.
var throttled = _.throttle(clipMove, 80);

if (blur.length) {
  $(window).on('mousemove', throttled);
}
{% endhighlight %}

I choose 80 milliseconds because for me it feels smooth on the final result and cursor has smooth moving too without any debouncing.

That's it. You can check demo [here]({{site.url}}/experimental/blur.html)
