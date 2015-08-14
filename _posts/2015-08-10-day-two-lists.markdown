---
layout: post
title:  "Day second. Javascript Data Types: lists."
description: "In this day I'll dig into abstract data type — lists."
categories:
  - blog
  - challenge
tags: js, challenge, abstract, lists, data types
---

> A List is an ordered sequence of data

## ADT

ADT is an Abstract Data Type

> class of objects whose logical behavior is defined by a set of values and a set of operations 

**Lists** should have the following properties and methods:

- **listSize** representing number of elements in the list;
- **append/prepend/insert** methods, for adding new element;
- **shift/pop/splice** method, removing element;
- **clear** for making list empty;
- **find** helper method for searching position of the item in the list;
- **getElement** to print particular element from its position.

Yesterday I'll try to implement Lists Class and find out, why the author didn't use the built-in 
property `length` and implement it's from scratch 
[Chapter 3.1](https://github.com/oreillymedia/data_structures_and_algorithms_using_javascript/blob/master/Chapter3/chap3_1.js#L15)
