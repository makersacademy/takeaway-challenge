
[![Build Status](https://travis-ci.org/dearshrewdwit/takeaway-challenge.svg?branch=master)](https://travis-ci.org/dearshrewdwit/takeaway-challenge)

Takeaway Challenge
==================
* Fork this repo
* Clone to your machine
* Run the command ```bundle``` in the project directory to ensure you have all the gems
* Then run the following in ```irb``` or ```pry```

```ruby
> require './lib/order'             => true
> eds_takeout = Order.new           => #<Order:0x007fd6b1bb5820 @restaurant=Restaurant>
> eds_takeout.whats_available       => [:Italian, :American, :Chinese, :Japanese, :MiddleEastern]  
> eds_takeout.new_order(:Italian)   => "A new order has been opened. Please read the menu"
> eds_takeout.menu                  => {:antipasti=>4, :spaghetti=>5, :pizza_margherita=>3...
> eds_takeout.add(:antipasti,4)     => "antipasti x4 has been added to your order"
> eds_takeout.add(:spaghetti)       => "spaghetti x1 has been added to your order"
> eds_takeout.delete(:spaghetti)    => "spaghetti x1 has been deleted from your order"
> eds_takeout.order_summary         => "Your order: antipasti x4 = £16.00, spaghetti x0 = £0.00"
> eds_takeout.total                 => "Your total: £16.00"
> eds_takeout.place_order
To confirm your order please repeat the total amount:
> 16                                => "Your order has been confirmed! A confirmation text will be
                                    sent to your mobile. See you next time!"

```


User stories:
--

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
