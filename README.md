Makers End of Unit Challenge - Takeaway Challenge
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

User Stories
-----

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```


Instructions
------------------

Viewing the menu:

```
2.6.5 :001 > require './lib/ordersystem'
 => true
2.6.5 :002 > order = OrderSystem.new
2.6.5 :003 > order.view_menu
 => [{:dish=>"Chicken Satay", :price=>3}, {:dish=>"Spring Rolls", :price=>3}, {:dish=>"Crispy Prawns", :price=>3}, {:dish=>"Pad Thai", :price=>7}, {:dish=>"Panang Curry", :price=>7}, {:dish=>"Cashew Stir-fry", :price=>7}, {:dish=>"Steamed Rice", :price=>2}, {:dish=>"Egg Fried Rice", :price=>2}]
 ```

 Adding to the order (default quantity is 1 ):
 ```
2.6.5 :004 > order.add_to_order("Chicken Satay", 2)
 => [{:dish=>"Chicken Satay", :quantity=>2, :price=>6}]
2.6.5 :005 > order.add_to_order("Pad Thai")
 => [{:dish=>"Chicken Satay", :quantity=>2, :price=>6}, {:dish=>"Pad Thai", :quantity=>1, :price=>7}]
2.6.5 :006 > order.add_to_order("Cashew Stir-fry")
 => [{:dish=>"Chicken Satay", :quantity=>2, :price=>6}, {:dish=>"Pad Thai", :quantity=>1, :price=>7}, {:dish=>"Cashew Stir-fry", :quantity=>1, :price=>7}]
2.6.5 :007 > order.add_to_order("Steamed Rice")
 => [{:dish=>"Chicken Satay", :quantity=>2, :price=>6}, {:dish=>"Pad Thai", :quantity=>1, :price=>7}, {:dish=>"Cashew Stir-fry", :quantity=>1, :price=>7}, {:dish=>"Steamed Rice", :quantity=>1, :price=>2}]
 ```

Removing from the order:
```
2.6.5 :009 > order.remove_from_order("Steamed Rice")
 => [{:dish=>"Chicken Satay", :quantity=>2, :price=>6}, {:dish=>"Pad Thai", :quantity=>1, :price=>7}, {:dish=>"Cashew Stir-fry", :quantity=>1, :price=>7}]
```

Raises an error if not on the order:
```
2.6.5 :008 > order.remove_from_order("Panang Curry")
Traceback (most recent call last):
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):8
        1: from /Users/james/ruby/makers/end-of-week-challenges/2_takeaway_challenge/takeaway-challenge/lib/ordersystem.rb:25:in `remove_from_order'
RuntimeError (This isn't on the order)
```

Viewing the order:
```
2.6.5 :010 > order.view_order
Chicken Satay x 2 = £6
Pad Thai x 1 = £7
Cashew Stir-fry x 1 = £7
```

Viewing the total:
```
2.6.5 :011 > order.view_total
Order total is: £20
```

Proceeding to purchase the order:
```
2.6.5 :012 > order.checkout
Happy to proceed with order (y/n) ?
```
If the user proceeds with the order, it will then send a text via the Twilio API

**Errors:**

Removing an item from an empty order:
```
2.6.5 :003 > order.remove_from_order("Pad Thai")
Traceback (most recent call last):
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):3
        1: from /Users/james/ruby/makers/end-of-week-challenges/2_takeaway_challenge/takeaway-challenge/lib/ordersystem.rb:23:in `remove_from_order'
RuntimeError (The order is currently empty)
```

Adding a dish to the order that doesn't exist:
```
2.6.5 :004 > order.add_to_order("Chicken Strips")
Traceback (most recent call last):
        6: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        5: from /Users/james/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        4: from /Users/james/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):4
        2: from (irb):4:in `rescue in irb_binding'
        1: from /Users/james/ruby/makers/end-of-week-challenges/2_takeaway_challenge/takeaway-challenge/lib/ordersystem.rb:17:in `add_to_order'
RuntimeError (This isn't on the menu)
```

Areas that need to be improved
------------------
Test coverage is not great, or probably that effective, on the Text class. There is also scope for improvement on the checkout part of the OrderSystem class.


Tech Stack
------------------

Ruby 2.6.5  
RSpec
