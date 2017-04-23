Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  J.B. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

```

### This program allows the user to order from their chosen cuisine, and get confirmation of their order via text. This program was built using the [Twilio API](https://www.twilio.com/) as a Ruby gem.

### The User stories considered:

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

### How to run

*Clone this repo and install the following:*

```
gem install bundler
gem install twilio-ruby
bundle
# you may be asked to install ruby '2.4.0'

```

*You can now start ordering! Run this program from the command line in IRB*

```ruby
require './lib/restaurant'
restaurant = Restaurant.new
# this program runs the default menu, but feel free to customise in Menu
restaurant.order('noodles', 2)
# => "2x noodles(s) added to basket"
restaurant.add('ramen')
# => "1x ramen(s) added to basket"
restaurant.basket
# 2x noodles(s) = £8
# 1x ramen(s) = £5
restaurant.add('bun', 3)
# => "3x bun(s) added to basket"
restaurant.add('pizza')
# => RuntimeError: Unfortunately pizza isn't available
restaurant.basket
# 2x noodles(s) = £8
# 1x ramen(s) = £5
# 3x bun(s) = £9
restaurant.total(22)
# => "Total: £22 Would like to checkout or add more to your order?"
restaurant.checkout(22)
# => "Order successful! You have paid £22. Please await text confirmation"
```

### Problems encountered:

1. Iterating through orders to return the total cost

- When iterating through the basket hash of orders, I needed to delete or ignore the orders already added to the total to avoid adding the same orders on every iteration.
To get around this I cloned the basket hash, iterated through the clone adding to the total. I could then delete the clone knowing that order had been added and the basket would stay intact.

2. Testing using mocks and doubles across multiple classes

3. Testing the TwilioAPI directly
