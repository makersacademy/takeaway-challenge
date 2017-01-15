Takeaway Challenge by Ben Vaughan-Jones
=========================================================
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
-----

The task is to create a working Takeaway in which a user can do the following -
- See a list of dishes including prices
- Be able to select multiple dishes from the list available
- Check their order is correct by matching the sum of dishes ordered
- Receive a text once an order is placed which states the delivery time and confirmation that an order was placed.

User Stories
-------------

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

IRB
----
irb(main):001:0>   require './lib/takeaway'
=> true
irb(main):002:0>   takeaway = Takeaway.new
=> #<Takeaway:0x007f800a884230 @menu_object=#<Menu:0x007f800a884208 @menu_array=[]>, @ordered=[]>
irb(main):003:0>   takeaway.add_dish("dish1", 5.99)
=> [{:name=>"dish1", :price=>5.99}]
irb(main):004:0>   takeaway.add_dish("dish2", 2.99)
=> [{:name=>"dish1", :price=>5.99}, {:name=>"dish2", :price=>2.99}]
irb(main):005:0>   takeaway.add_dish("dish3", 4.99)
=> [{:name=>"dish1", :price=>5.99}, {:name=>"dish2", :price=>2.99}, {:name=>"dish3", :price=>4.99}]
irb(main):006:0>   takeaway.show_menu
dish1 : £5.99
dish2 : £2.99
dish3 : £4.99
=> [{:name=>"dish1", :price=>5.99}, {:name=>"dish2", :price=>2.99}, {:name=>"dish3", :price=>4.99}]
irb(main):007:0>   takeaway.add_to_order("1,3")
dish1 : £5.99
dish2 : £2.99
dish3 : £4.99
dish1 : £5.99
dish2 : £2.99
dish3 : £4.99
=> [{:name=>"dish1", :price=>5.99}, {:name=>"dish3", :price=>4.99}]
irb(main):008:0>   takeaway.add_to_order("3")
dish1 : £5.99
dish2 : £2.99
dish3 : £4.99
=> [{:name=>"dish1", :price=>5.99}, {:name=>"dish3", :price=>4.99}, {:name=>"dish3", :price=>4.99}]
irb(main):009:0>   takeaway.basket
=> [{:name=>"dish1", :price=>5.99}, {:name=>"dish3", :price=>4.99}, {:name=>"dish3", :price=>4.99}]
irb(main):010:0>   takeaway.total_basket
=> "Your total - £15.97"

Struggles
---------

- Ruby syntax, remembering previous work done on pre-course etc
- RSpec test logic
