[![Build Status](https://travis-ci.org/tobenna/takeaway-challenge.svg?branch=master)]https://travis-ci.org/tobenna/takeaway-challenge.svg?branch=master

[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

Takeaway Challenge
==================

Summary
-------

This is a Ruby app allows for customers to place orders from a restaurant using specific commands.
The customer would be receive a text message with the estimated delivery time at the end of the order.(Twilio Api)


Installation Instructions
-------

* Clone this repo
* install the `bundle` gem
* Run `bundle` in your terminal
* Create in .env file in the root directory
* Order food

Creating a .env file
-----

The following environment variables are needed in your .env file
'TWILIO_SID' -> Your Twillio SID
'TWILIO_TOKEN' -> Your Authentication token
'SOURCE_NUM' -> You Twillio source number
'DEST_NUM' -> The number you want to be receiving the text messages

A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
