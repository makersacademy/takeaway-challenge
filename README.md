Takeaway Challenge
==================

A program written in Ruby to satisfy the following user conditions:

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

## Configuration

Clone this repo.  
From root directory, run `require_relative ./lib/takeaway.rb` in irb or other ruby interpreter.

Run tests with rspec in command line.

## Interface

To start a new takeaway, create an object with Takeaway.new.

` takeaway = Takeaway.new `

To see the menu:

` takeaway.menu `

```
1: Burger, £5.50  
2: Pizza, £5.00  
3: Noodles, £6.00  
4: Curry, £8.00
```  
The menu is a hash but could modified to be read from a CSV, for example, to make updating and increasing its content easier.

To place an order, pass the dish numbers as arguments to #new_order.  The total cost for your order is displayed.

` takeaway.new_order(1,2,2,3,4,4,4) ` => The order total is £45.50

In age-old take-away tradition, you order by number!  This adds to the simplicity of the program.  It is somewhat cumbersome to type in multiple numbers to increase the order quantity.  Using an STDIN.gets interaction would be slightly more flexible but increase the complexity of the program.  For this reason too, there is no function to add to the order once placed.  One assumes the customer reads the menu and decides on their selection before placing the order, which satisfies the user story.

To view a breakdown of your order:

` takeaway.breakdown `
```
1x Burger @ £5.50 each = £5.50
2x Pizza @ £5.00 each = £10.00
1x Noodles @ £6.00 each = £6.00
3x Curry @ £8.00 each = £24.00
The order total is £45.50
```

To confirm your order and receive a text indicating delivery time one hour ahead, pass your mobile number as the argument:

` takeaway.confirm(+442345678987) `

Note - this feature will not work with numbers not verified via Twilio.

Test coverage is 100%, but requires being passed a valid mobile number verified with Twilio.
