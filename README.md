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
* Clone repo to your local machine by running **git clone SSH** in your terminal
* Inside *takeaway-challenge* folder, install required gems using bundler by running **gem install bundler** and **bundle install**
* To start using the app, run **irb** and **require './lib/takeaway'** - see screenshot below
* To run tests type **rspec**

## Code example in irb

```
➜  takeaway-challenge git:(master) ✗ irb
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > t = TakeAway.new
 => #<TakeAway:0x007ffb7c319938 @menu=#<Menu:0x007ffb7c3198e8 @list={:Thai_green_curry=>9, :Aubergine_teriyaki=>9, :Mushroom_risotto=>8, :Butternut_rotolo=>9, :Thali=>11, :Smoky_bean_burger=>7}>, @order=#<Order:0x007ffb7c319898 @menu={:Thai_green_curry=>9, :Aubergine_teriyaki=>9, :Mushroom_risotto=>8, :Butternut_rotolo=>9, :Thali=>11, :Smoky_bean_burger=>7}, @basket={}, @sum=0>, @text=#<Text:0x007ffb7c3197f8>>
2.3.1 :003 > t.view_menu
Thai_green_curry                                £9
Aubergine_teriyaki                              £9
Mushroom_risotto                                £8
Butternut_rotolo                                £9
Thali                                          £11
Smoky_bean_burger                               £7
 => {:Thai_green_curry=>9, :Aubergine_teriyaki=>9, :Mushroom_risotto=>8, :Butternut_rotolo=>9, :Thali=>11, :Smoky_bean_burger=>7}
2.3.1 :004 > t.add("Thai_green_curry", 3)
 => "3 x Thai_green_curry added to basket"
2.3.1 :005 > t.add("Thali", 1)
 => "1 x Thali added to basket"
2.3.1 :006 > t.add("Smoky_bean_burger", 2)
 => "2 x Smoky_bean_burger added to basket"
2.3.1 :007 > t.review
Thai_green_curry x 3                           £27
Thali x 1                                      £11
Smoky_bean_burger x 2                          £14
Total sum                                      £52
 => nil
2.3.1 :008 > t.checkout(52)
 => "Order has been completed"
2.3.1 :009 >

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
20 examples, 0 failures
```

## Build Badge

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
