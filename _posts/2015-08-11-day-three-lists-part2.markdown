---
layout: post
title:  "Day third. Implementing lists class. "
description: "JS implementation of lists ADT."
categories:
  - blog
  - challenge
tags: javascript, challenge, abstract, lists, data types, class
---

Dear diary, today it was hard day and for now it's more questions than answers. The current
implementation of List class is here:

{% highlight js %}
function List() {
  this.data = [];
	this.listSize = listSize;
  this.pos = 0;
  this.clear = clear;
  this.find = find;
  this.toString = this.data.toString();
  this.insert = insert;
  this.append = append;
  this.remove = remove;
//  this.front = front;
//  this.end = end;
  this.previous = previous;
  this.next = next;
  this.hasPrevious = hasPrevious;
  this.hasNext = hasNext;
//  this.currPos = currPos;
  this.moveTo = moveTo;
  this.getElement = getElement;
//  this.contains = contains;
}

function clear() {
  return this.data = [];
}

function listSize() {
  return this.data.length;
}

function append(element) {
  return this.data.push(element);
}

function find(element) {
  for (var i = 0; i < this.listSize(); ++i) {
    if (this.data[i] === element) {
      return i;
    }
  }
  return -1;
}

function insert(element) {
  return this.data.splice(this.pos + 1, 0, element);
}

function remove(element) {
  var pos = this.find(element);
  return this.data.splice(this.pos,1);
}

function moveTo(position) {
  this.pos = position;
}

function getElement(position) {
  return this.data[position - 1];
}

function previous() {
  return this.data[--this.pos];
}

function next() {
  return this.data[++this.pos];
}

function hasPrevious() {
  return this.pos > 0;
}

function hasNext() {
  return this.pos <= this.listSize() - 1;
}

module.exports = List;
{% endhighlight %}

See you tomorrow. I'm going to find out why the author added the following methods: `contain`,
`front`, `end` and `currPos`.
