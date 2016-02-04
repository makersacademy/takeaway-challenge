<b>TAKEAWAY CHALLENGE 2.0</b><br>
Makers Academy Week 03<br>
Rufus Raghunath<br>
Jan 2016<br>
Travis CI: [![Build Status](https://travis-ci.org/rufusraghunath/takeaway-challenge.svg?branch=master)](https://travis-ci.org/rufusraghunath/takeaway-challenge)<br>

-------------------------------

DESCRIPTION:<br>
This is a new attempt at the Takeaway Challenge with the sole aim of improving my grasp of OOP best practices and the overall smoothness and readability of my code. I plan to follow my general outline from before but rewrite all code and tests from the bottom up.

I tried to implement the Sandi Metz approach and keep my methods as radically short as possible. E.g. I added a private ```verify_order``` for ```Restaurant```, where before that method was part of ```find_order```.

The most important decision was to remove the ```Order``` class entirely. It had become apparent that the way I had implemented the class had turned it into nothing more than a wrapper for customer and order information. The same functionality can be delivered by a simple hash, especially since ```Order``` didn’t actually have functional responsibility of its own.