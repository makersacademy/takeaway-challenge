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

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

**Current Feature Test run through**
2.6.5 :001 > require './lib/order'
 => true
2.6.5 :002 > order = Order.new
 => #<Order:0x00007f96e5b8eb00 @show_menu=[{:"1"=>"Garlic Bread with cheese", :price=>6}, {:"2"=>"Pepperoni", :price=>12}, {:"3"=>"Hawaiian", :price=>11}], @
selection=[], @total=nil>
2.6.5 :003 > order.show_menu
 => [{:"1"=>"Garlic Bread with cheese", :price=>6}, {:"2"=>"Pepperoni", :price=>12}, {:"3"=>"Hawaiian", :price=>11}]
2.6.5 :004 > order.select_pizza(2, 1)
 => 1
2.6.5 :005 > order.select_pizza(3, 1)
 => 1
2.6.5 :006 > order.select_pizza(1, 2)
 => 2
2.6.5 :007 > order.calculate_total
 => 35
2.6.5 :008 > order.complete_order
 => "You have succesfully ordered your pizza! Total: £35"
 
 **Tasks to complete**
 * Raise error if total does not equal total
 * Add functionality to send text
 * Organise tests with describe/context blocks
 * Check for vacuous tests.
