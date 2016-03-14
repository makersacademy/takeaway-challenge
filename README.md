[![Build Status](https://travis-ci.org/tobenna/takeaway-challenge.svg?branch=master)](https://travis-ci.org/tobenna/takeaway-challenge)

[![Coverage Status](https://coveralls.io/repos/github/tobenna/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/tobenna/takeaway-challenge?branch=master)

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
* 'TWILIO_SID' -> Your Twillio SID
* 'TWILIO_TOKEN' -> Your Authentication token
* 'SOURCE_NUM' -> You Twillio source number
* 'DEST_NUM' -> The number you want to be receiving the text messages

A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.



Usage Example
-----

```sh
2.2.3 :001 > t = TakeAway.new
 => #<TakeAway:0x007f975b1a39a8 @menu=#<Menu:0x007f975b1a3890 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007f975b1a33e0>>
2.2.3 :002 > t.read_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
2.2.3 :003 > t.order 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :004 > t.order 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :005 > t.order 'spring roll', 4
 => "4x spring roll(s) added to your basket."
2.2.3 :006 > t.basket_summary
 => "spring roll x4 = £3.96"
2.2.3 :007 > t.add 'pork dumpling', 3
 => "3x pork dumpling(s) added to your basket."
2.2.3 :008 > t.basket_summary
 => "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
2.2.3 :009 > t.total
 => "Total: £12.93"
2.2.3 :010 > c.checkout(12.93)
```
