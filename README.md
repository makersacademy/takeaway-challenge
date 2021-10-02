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

## Introduction
-----
This program implements software using Ruby with tests using RSpec, in order to create a takeaway app that satisfies the following user stories:

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

## Installation

After forking and cloning this repo, you will need to run gem install bundler. After installation use the bundle command.
```bash
gem install bundler
```

```bash
bundle
```

## Usage

To run this program, please launch `irb` froom the terminal. An example snippet of functionality is below:
```ruby
$ irb
irb(main):001> require "./lib/food_order.rb"
=> true
irb(main):002> require "./lib/menu.rb"
=> true
irb(main):003> require "./lib/text_client.rb"
=> true
irb(main):004> food_order = FoodOrder.new
=> 
<FoodOrder:0x00007fb47296fea0
... 
irb(main):005> food_order.add_dish("fried plantain")
=> [{"fried plantain"=>2.0}]
irb(main):006> food_order.add_dish("curried goat")
=> [{"fried plantain"=>2.0}, {"curried goat"=>7.5}]
irb(main):007> food_order.total
=> "Your total order is £9.50"
irb(main):008> food_order.place_order
=> "Order successfully placed!"
```
The user will receive a text message stating: "Thank you! Your order was placed and will be delivered before [TIME]"