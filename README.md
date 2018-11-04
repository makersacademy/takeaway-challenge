[![Build Status](https://travis-ci.org/darciew/takeaway-challenge.svg?branch=master)](https://travis-ci.org/darciew/takeaway-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/a5b24dec13a5e6822dd2/maintainability)](https://codeclimate.com/github/darciew/takeaway-challenge/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/a5b24dec13a5e6822dd2/test_coverage)](https://codeclimate.com/github/darciew/takeaway-challenge/test_coverage)
## Technologies 

Ruby 

Rspec

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
Task
-------

Create a program that simulates a Takeaway service using the Twilio API to send and receive order confirmation texts.

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

Install
-----

### Clone this repo:
```
$ git@github.com:darciew/takeaway-challenge.git
```

### To install gems, run:
```
$ bundle install
```

Run
-----
### To run RSpec tests:
```
$ rspec
```

### To check for any code styling offenses:
```
$ rubocop
```

IRB Sample
-----

### Viewing the takeaway menu:
```
2.5.0 :006 > menu = Menu.new
 => #<Menu:0x00007f7f40092588 @dishes={"doughnut"=>2, "cake"=>2, "pancakes"=>3, "ice-cream"=>2}>
 
2.5.0 :007 > menu.display_menu
 => "Doughnut £2.00, Cake £2.00, Pancakes £3.00, Ice-cream £2.00"
```
### Placing an order:
```
2.5.0 :008 > order = Order.new
 => #<Order:0x00007fac69243278 @menu=#<Menu:0x00007fac69243250 @dishes={"doughnut"=>2, "cake"=>2, "pancakes"=>3, "ice-cream"=>2}>, @basket=[], @total=0, @price_count=[]>
2.5.0 :009 > order.add("doughnut")
 => {"doughnut"=>2, "cake"=>2, "pancakes"=>3, "ice-cream"=>2}
2.5.0 :010 > order.add("cake")
 => {"doughnut"=>2, "cake"=>2, "pancakes"=>3, "ice-cream"=>2}
2.5.0 :011 > order.view_basket
 => [{"doughnut"=>2}, {"cake"=>2}]
2.5.0 :012 > order.view_total
 => "£4"
2.5.0 :013 > order.place_order
 => "Order has been placed. It will arrive within 1 hour"
```

### Confirmation Text Example:

![Imgur](https://i.imgur.com/QSR4NP9.png?1)
