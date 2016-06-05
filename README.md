Takeaway Challenge
==================
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

Info
-----

A takeaway program that follows the below user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

My approach
-----

Program design, split out Menu class (which is essentially access to data), Order class performs most actions on the menu, and stores the items ordered in the basket. Checkout stores all orders, resets the basket and sends the text message via Twilio.

TDD approach




Running the program
-----

The interface for the program is CLI - so jump into IRB or PRY and run it like so:

```
require './requires'
=> true

chinese = Takeaway.new
=> #<Takeaway:0x007fda62bc0180 @menu= #<Menu:0x007fda62bc0158
   @dishes={"Pilau Rice"=>2.2, "Egg Fried Rice"=>2.5}>,
 @order=#<Order:0x007fda62bc00b8 @basket=[],
   @menu=#<Menu:0x007fda62bc0158
     @dishes={"Pilau Rice"=>2.2, "Egg Fried Rice"=>2.5}>>>

chinese.basket
RuntimeError: Nothing in basket

chinese.menu
=> "Pilau Rice, £2.20\nEgg Fried Rice, £2.50\n"

chinese.order("Pilau Rice")
=> "1x Pilau Rice, £2.20 - added to your basket"

chinese.order("Pilau Rice")
=> "2x Pilau Rice, £4.40 - added to your basket"

chinese.basket
=> "2x Pilau Rice, £4.40\n"

chinese.total
=> "Total: £4.40"








Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
