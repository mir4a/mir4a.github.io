---
layout: post
title:  "Day first. Javascript Data Types."
description: "Objects, Arrays."
categories:
  - blog
  - challenge
tags: javascript, challenge, array, object  
---

I started learning algorithms from Data Structures and Algorithms with JavaScript by Michael 
McMillan [link](http://amzn.com/B00IV3J23Y). First chapter was not interesting, 
it was about setting up dev environment (I'm using node 0.12 for playing with algorithms) and how 
**Objects** are creating at javascript. Next chapter was talking about **Arrays** and I found funny 
thing I didn't know before.

### Arrays

If you try to create and assign new array to var using the `new Array()` constructor and pass 
integer as only one argument it will create new array with length equals to parameter and with 
undefined elements inside it:

```

var ar = new Array(5);

console.log(ar.length); // 5
console.log(ar[1]);     // undefined
console.log(ar);        // [ , , , , ]

```

And I can create a loop iterating each `undefined` element in this array. And loop will iterate 5 times:

```

var ar = new Array(5);

for (var i = 0; i < ar.length; i++) {
  console.log(i);
}

// 0
// 1
// 2
// 3
// 4

```

Ok, I got this, but have no idea where I can use this behaviour. Maybe init arrays with predefined 
length and then check it's length everywhere?

Other interesting feature of javascript arrays is that it can has different types for it's elements. 
For instance, `var arMixed = ['hey!', 235, {foo: 'bar'}, 4, [2,3,5]]` would be ok for javascript and 
`arMixed.length` will print 5.

#### Shallow copy vs Deep copy

Other important thing I've learned that simple assigning one variable with array to another will make
a link and changes in first var will cause second:

{% highlight js %}
var a = [1,2,3];

var b = a;

a[0] = 9;

console.log(a);   // [9,2,3]
console.log(b);   // [9,2,3]

b[1] = 5;

console.log(a);   // [9,5,3]
console.log(b);   // [9,5,3]
{% endhighlight %}


For a **deep copy** the following will work:

{% highlight js %}

var a = [1,2,3];

var c = [];

for (var i = 0; i < a.length; i++) {
  c[i] = a[i];
}

console.log(a); // [1,2,3];
console.log(c); // [1,2,3];

a[1] = 5;

console.log(a); // [1,5,3];
console.log(c); // [1,2,3];

{% endhighlight %}

#### Built-in functions

Arrays in javascript isn't arrays itself, it's a type of Object which is have built-in methods and 
properties. Functions has the following types: **accessors**, **mutators**, 
**iterators**. Don't want to explain everyone of them, just list some of the common useful functions.

##### Accessor Functions

Such as `.indexOf()` or `.lastIndexOf()` for searching element's position in array. `.join()`, 
`.toString()` for converting arrays to string. And `.splice()` and `.concat()` for creating new array
 from existing.

##### Mutator Functions

The function I never used before is `.unshift()` add new element at the beginning of an array, 
like `.push()` but vise versa. To remove elements from the end `.pop()` and `.shift()` from the 
beginning, `.splice()` for middle. 

###### Sorting

`.sort()` which is work well for strings but not for integers, `.reverse()`. Interesting thing, 
`.sort()` function can accept **comparator** function as argument and it may help sort integers in 
array:

{% highlight js %}
var numArr = [44,100,1,10,25,99,34,0];

function comparator(num1, num2) {
  return num1 - num2;
}

numArr.sort(comparator);

console.log(numArr);       // [ 0, 1, 10, 25, 34, 44, 99, 100 ]
{% endhighlight %}

Also it doesn't fails if array has mixed types of elements, but sort it out in a different way and 
result may be unexpected:

{% highlight js %}
var mixedArr = [ 44, '100', 1, 10, 'string25', 99, 34, 0 ];

function comparator(num1, num2) {
  return num1 - num2;
}

mixedArr.sort(comparator);

console.log(mixedArr);    // [ 1, 10, 44, '100', 'string25', 0, 34, 99 ]
{% endhighlight %}

__*Question:*__ How does exaclty `.sort()` work and what is performance and big-O?


##### Iterator Functions

`.forEach()`, `.every()`, `.some()`, `.reduce()`.
`.reduce()` takes function as an argument which takes each element in array from left to right. `
.reduceRight()` do the same but from right to left.

###### Iterators returning new arrays

`.map()` the same as `.forEach()` but return **new** array. `.filter()` similar to `.every()`.

#### Two-Dimensional and Multidimensional Arrays

> The **Matrix** has you…

Creating multidimensional array: 

{% highlight js %}
function matrix(numrows, numcols, initial) {
  var arr = [];
  for (var i = 0; i < numrows; i++) {
    var cols = [];
    for (var j = 0; j < numcols; j++) {
      cols[j] = initial;
    }
    arr[i] = cols;
  }
  return arr;
}

var fifthMatrix = matrix(5, 5, 0);

console.log(fifthMatrix);       // [ [ 0, 0, 0, 0, 0 ],
                                //   [ 0, 0, 0, 0, 0 ],
                                //   [ 0, 0, 0, 0, 0 ],
                                //   [ 0, 0, 0, 0, 0 ],
                                //   [ 0, 0, 0, 0, 0 ] ]

{% endhighlight %}

##### Jagged Arrays

Have different number of items in rows. This isn't a problem in js because arrays in js has length 
property. 
