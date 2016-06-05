[![Build Status](https://travis-ci.org/andreamazza89/takeaway-challenge.svg?branch=master)](https://travis-ci.org/andreamazza89/takeaway-challenge.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/andreamazza89/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/andreamazza89/takeaway-challenge?branch=master)

#Takeaway challenge

This is the second weekend challenge here at [Makers Academy] (http://www.makersacademy.com/)

##The brief

Can be found [here] (https://github.com/andreamazza89/airport_challenge/blob/master/README.md).

The requirement is for a take-away system, using IRB as interface, and integrating with [Twilio's API] (https://www.twilio.com/) for text messaging. If time allows, the brief includes a bonus requirement for the interface to be solely sms-based.

##The interface
This program is intended to be run on a ruby REPL or ruby script.

##Installation
Install [bundler] (http://bundler.io/)

From bash, clone this repo to your computer using `git clone`.

Run bundler (`bundle`).

Navigate to the project directory (`cd takeaway-challenge`).

Run irb (`irb`).

Import TakeAway (`require './lib/takeaway'`).

Import SmsInterface (`require './lib/sms_interface'`).

Type `TakeAway.show_menu` to see what is on the menu.

Place an order using this syntax: `TakeAway.order(15, '+4477....', {item_n: 3, quantity: 1}, {item_n: 1, quantity: 1})`, whereby 15 is the total cost of the order, followed by telephone number, followed by one hash per item, including item number and quantity.

##Potential improvements
The SmsInterface shoud be injected as a dependency into the TakeAway module (this is not the case currently).

The next feature is to allow users to place orders directly from the phone.
