# Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  ALEX |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

```

A simple takeaway ordering program to challenge myself with OOP, TTD, as well as integrating a third party API (in this case Twilio).

## Getting Started

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

### Gems Required

```
rspec
twilio-ruby
```

### Using Twilio

You will need a Twilio account to use this program. There are four relevant pieces of information - your account code, auth token, your Twilio phone number and a phone number that will receive the messages.
In this project I have used a simple 'secrets' file, but ENV variables could be used with very few modifications to the 'messenger' file.

## Ordering your food!

```ruby
2.4.0 :001 > require './lib/menu.rb'
 => true
2.4.0 :002 > require './lib/messager.rb'
 => true
2.4.0 :003 > require './lib/order.rb'
 => true
2.4.0 :004 > require './lib/restaurant.rb'
 => true
2.4.0 :005 > shop = Restaurant.new
 => #<Restaurant:0x007f969d0e0b10 @menu=#<Menu:0x007f969d0e0a98 @menu={"spring rolls"=>1.99, "prawn toast"=>1.99, "egg fried rice"=>2.5, "kung po chicken"=>4.5}>, @order=#<Order:0x007f969d0e09a8 @menu=#<Menu:0x007f969d0e0980 @menu={"spring rolls"=>1.99, "prawn toast"=>1.99, "egg fried rice"=>2.5, "kung po chicken"=>4.5}>, @basket={}>, @messager=#<Messager:0x007f969d0e0a48 @secrets=#<Secrets:0x007f969d0e09d0>>>
2.4.0 :006 > shop.order('spring rolls')
 => 1
```

## User Stories
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

## Running the Tests

The tests for this project are written with RSPEC, to run them simple run 'rspec' from the terminal in the project directory.
