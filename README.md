Makers Academy Week2 Challenge: Takeaway Challenge
=================================================
[![Build Status](https://travis-ci.org/rjlynch/takeaway-challenge.svg?branch=master)](https://travis-ci.org/rjlynch/takeaway-challenge)

How I went about the challenge:
-------------------------------
First I played in irb and wrote some simple ruby scripts to work out how twilio works and what information it needs to be sent.
Then I wrote on paper the classes I thought I needed and how they would behave, interact and what they would do.
I wrote unit tests for the menu class and wrote my code to passes them.
Next I started writing the first couple of tests for the text_confirm class to make sure the order would be formatted in a way that twillio would like.
I then spent a while working out how to stub out twilio's behaviour. The way I tackled it was to intercept it's .new method and return a double of the client instead. I had to google for a while to find the syntax for stubbing out a method chain that was called on the client double. I tested that the argument that was passed to the double client's stubed out chain was the argument I would want the twilio client to recieve.
Then I played with both menu and text_confirm in irb and made sure what I ordered via menu was actually text to my phone. This was a good sanity check for the feature tests! 
Finally I ran the feature tests that we're constructed from the given user stories.