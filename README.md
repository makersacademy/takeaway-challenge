# Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
A simple terminal app which allows customers to make takeaway orders.

Features currently included are:
- [x] View menu
- [x] Select items
- [x] Review order
- [x] Checkout order
- [x] Receive order confirmation with delivery time on text
- [ ] Place order via text message (optional)

## Installation

* Fork this repo
* Clone repo to your local machine by typing **git clone SSH** in your terminal
* Inside *takeaway-challenge* folder, install required gems using Bundler, type **gem install bundler** and **bundle install**
* To start using the app, run **irb** and **require './lib/takeaway'** - see screenshot below
* To run tests type **rspec** in the terminal

## Code example in irb

```
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > t = TakeAway.new
 => #<TakeAway:0x007fac2cabec00 @menu=#<Menu:0x007fac2cabebd8 @list={:Thai_green_curry=>9, :Aubergine_teriyaki=>9, :Mushroom_risotto=>8, :Butternut_rotolo=>9, :Thali=>11, :Smoky_bean_burger=>7}>, @order=#<Order:0x007fac2cabebb0 @menu={:Thai_green_curry=>9, :Aubergine_teriyaki=>9, :Mushroom_risotto=>8, :Butternut_rotolo=>9, :Thali=>11, :Smoky_bean_burger=>7}, @basket={}, @sum=0>, @text=#<Text:0x007fac2cabeb10 @client=<Twilio::REST::Client @account_sid=ACxxxx>>>
2.3.1 :003 > t.view_menu
Thai_green_curry                                £9
Aubergine_teriyaki                              £9
Mushroom_risotto                                £8
Butternut_rotolo                                £9
Thali                                          £11
Smoky_bean_burger                               £7
 => {:Thai_green_curry=>9, :Aubergine_teriyaki=>9, :Mushroom_risotto=>8, :Butternut_rotolo=>9, :Thali=>11, :Smoky_bean_burger=>7}
2.3.1 :004 > t.add("Thai_green_curry", 1)
 => "1 x Thai_green_curry added to basket"
2.3.1 :005 > t.add("Thai_green_curry", 1)
 => "1 x Thai_green_curry added to basket"
2.3.1 :006 > t.add("Butternut_rotolo", 3)
 => "3 x Butternut_rotolo added to basket"
2.3.1 :007 > t.add("tofu",1)
 => "Sorry, tofu is not on our menu"
2.3.1 :008 > t.review
Thai_green_curry x 2                           £18
Butternut_rotolo x 3                           £27
Total sum                                      £45
 => nil
2.3.1 :009 > t.checkout(40)
RuntimeError: Incorrect payment received
	from /Users/lichien/MA-02/takeaway-challenge/lib/takeaway.rb:27:in `checkout'
	from (irb):9
	from /Users/lichien/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
2.3.1 :010 > t.checkout(45)
 => "Payment received"
2.3.1 :011 > t.confirmation("+440000000000")
 => "Order has been completed"
```
## Test example in terminal

```
➜  takeaway-challenge git:(master) ✗ rspec
[Coveralls] Set up the SimpleCov formatter.
[Coveralls] Using SimpleCov's default settings.

Menu
  has a list of dishes and prices
  prints the list of dishes and prices

Order
  initialize
    selection is empty by default
    has preloaded menu - dish and price
  #add
    allows customer to select item and quantity
    stores selection
  #print_order
    prints order summary for review

 ...

Finished in 0.02099 seconds (files took 0.5134 seconds to load)
19 examples, 0 failures
```

## Build Badge

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
