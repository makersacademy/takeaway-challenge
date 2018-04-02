Takeaway Challenge
==================

Overview
-------

This repo contains a partial solution for a takeaway outlet for ordering from a menu, and sending a text message confirmation. Unfortunately an authentication issue with the SMS-sending API proved insurmountable, rather limiting the use of the written code.

Working features
-------
* Create a menu object with the menu items in an instance variable in the form of a hash
* Create a new order, instantiated with a list of items from the menu and a proposed total, contained in an array, e.g. `[item1, item3, item4, 12]`
* The sum of cost of the items will be added together and checked against the total in the array. If these totals match, a confirmation will be printed.
* If the totals are unequal, an error will be raised.

SMS confirmation
-------
In trying to implement a text confirmation for an order placed, I created a Twilio account, and set up the twilio-ruby gem. Following instructions on the gem readme, crossreferencing with those on the Twilio website and on the MA API pill, I set up code to send a message to myself in the texter.rb file. This failed with an error: `Unable to create record: Authenticate (Twilio::REST::RestError)`. Hours of frustrated googling, tinkering and plundering other fixes to try and patch it up have yielded nothing. My code is identical to that in the given examples, my SID and token have been checked a dozen times, likewise the two phone numbers. My Twilio account has been scoured for any setting that might have scuppered the authentication. Every variation of code and syntax has been tried. Nothing works. I am doomed to never be able to send myself an automated text confirmation of my fictional takeaway order. Woe.
