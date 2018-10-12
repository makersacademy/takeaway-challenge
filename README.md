# Takeaway Challenge #

## User Stories ##
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

## Feature Tests ##
```ruby
require './lib/menu'
menu = Menu.new
menu.display

# Margarita Pizza, £8
# Hamburger, £6
# Chips, £2

require './lib/menu'
menu = Menu.new
order = Order.new
menu.display
order.add("Margarita Pizza")
order.add("Chips")
```

## Domain Models ##
| Object    | Methods           |
| --------- | ----------------- |
| Menu      | display           |
| Order     | selection, review |
