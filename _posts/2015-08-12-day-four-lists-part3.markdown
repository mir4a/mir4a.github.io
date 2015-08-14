---
layout: post
title:  "Day fourth. Fix bugs in Lists class."
description: "Fix bugs in next/prev methods. Understanding why need front() and end() methods."
categories:
  - blog
  - challenge
tags: js, challenge, abstract, lists, data types, class
---

On the clock is 2:00AM and technically I'm breaking rules of this 
[challenge](/blog/challenge/2015/08/08/challenge-accepted.html).
But it's fine, because I've did some research on previous List class and fixed bugs in it few hours ago.

I read again chapter #3 and found that I have a few mistakes. Also I moved algorithm practices
to separate [repo](https://github.com/mir4a/algorithm-practice). This repo will contain full code
and here will be the most interesting (on my opinion) pieces of code.

[Yesterday](/blog/challenge/2015/08/11/day-three-lists-part2.html) I was wondering why need `.front()`,
`.end()`, `.contain()` and `.currPos()` methods. For now I got know that `.front()` and `.end()` methods
which is move current position to the beginning or to the end of the list. They also helper methods 
for 'alternative' iteration through the list:

{% highlight js %}
for (l.front(); l.hasNext();) {
  console.log(l.next());
}
{% endhighlight %}

But being honest, I don't know yet what is the advantages of this approach. In the book it saids that this
<cite>…able to update the list and not having to update the iterator, where an **index becomes invalid
when a new element is added to the list**</cite>.

Also I still don't understand why the author didn't use the built-in property **length** and calculate it
inside own methods after adding/removing elements in array. I've added `this.listSize` method which is read
`length` property for `this.data` array.

Tomorrow I'm going to finish with 3rd chapter and do practice with reading simple list from `txt` file.
After that is following **Stacks** data structures.
