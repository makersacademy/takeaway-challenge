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
To run the program open up irb in the takeaway-challenge folder

 ```
takeaway-challenge user$ irb
2.4.0 :001 > require './lib/order.rb'
 => true
2.4.0 :002 > order = Order.new
 => #<Order:0x007f83231a4ea8 @order_hash={}, @menu=#<Menu:0x007f83231a4e80 @list={:pizza=>5, :carbonara=>6}>, @output=#<Output:0x007f83231a4e30>>
2.4.0 :003 > order.create_order
pizza - £5, carbonara - £6, Which dish would you like?
 ```
 
User Stories
-------
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
Improvements
-------
In the future I would like to move some of the functionality out of the order class and add tests for the SMS output
