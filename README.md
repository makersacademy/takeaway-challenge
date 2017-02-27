Takeaway Challenge

## Weekend Challenge

## Week Two

##Completed on 26th February 2017
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

## Instructions

- require './lib/order' in IRB
- Create a new order `order = Order.new`
- Now we will display what is available `order.start`
- Choose from the orders listed `order.select_order("Koreanbbq", 3)`
- Get the price of the order! `order.get_price`
- Calculate the total price of your order! `order.calculate_price`

### Creating software for a Makers Academy Takeaway!
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
```
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x007f8f6f1baa20
 @menu=
  #<Menu:0x007f8f6f1ba9f8
   @dishes={:Koreanbbq=>10, :Burger=>7, :KFC=>7, :Sushi=>10, :Ribs=>8}>,
 @orders=[],
 @prices=[],
 @selection={}>
[3] pry(main)> order.start
Welcome to MA Takeaway. Please order from our tasty selection of dishes!
     Koreanbbq       £10      
       Burger       £7        
         KFC       £7         
       Sushi       £10        
        Ribs       £8         

[4] pry(main)> order.select_order("Koreanbbq", 3)
=> "3 x Koreanbbq added to your order!"
[5] pry(main)> order.get_price
3 x Koreanbbq at £10 each = £30
=> [{:Koreanbbq=>3}]
[6] pry(main)> order.calculate_price
The total cost of your order is £30
The total order will be scheduled for delivery. Do you wish to continue?
=> nil
[7] pry(main)> order.confirm("yes")
=> #<Confirmation:0x007f8f709a0798
 @client=
  <Twilio::REST::Client @account_sid=*******,
 @time="22:48">
 ```

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

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
