# Takeaway challenge

```ruby
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

## Task
Write a Takeaway program with the following user stories:

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

## Interface

Getting Started:
```ruby
require './lib/takeaway.rb'
```

Initializing a shop:
```ruby
cafe = Takeaway.new
```

Reading the raw menu data (name, price):
```ruby
cafe.menu
# => {:Espresso=>2, :Americano=>3 }
```

Adding items (returns basket):
```ruby
# cafe.add(name, quantity)
cafe.add("Espresso")
cafe.add("Americano", 2)
# => ["Espresso", "Americano", "Americano"]
```

Viewing current basket:
```ruby
cafe.basket
# => ["Espresso", "Americano", "Americano"]
```

Viewing total cost of basket:
```ruby
cafe.total
# => 8
```

Completing an order (returns basket):
```ruby
cafe.checkout
# => []
```
