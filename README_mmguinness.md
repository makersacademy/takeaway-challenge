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

Task
-----
  
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

* IRB Testing

admin@Maries-MacBook-Pro takeaway-challenge % irb
 => true 
 3.0.2 :002 > require './lib/takeaway'
 => true 
3.0.2 :003 > takeaway = Takeaway.new
 => #<Takeaway:0x00007ff482880a58 @menu={}> 
3.0.2 :005 > takeaway.add_dish_to_menu("Dish 1", 10)
 => 10 
3.0.2 :005 > takeaway.add_dish_to_menu("Dish 2", 12)
 => 12 
3.0.2 :006 > takeaway.add_dish_to_menu("Dish 3", 14)
 => 14 
3.0.2 :008 > takeaway.display_menu
 => {"Dish 1"=>10, "Dish 2"=>12, "Dish 3"=>14} 
3.0.2 :006 > takeaway.receive_order("Dish 1, Dish 2")
"Thank you! Your order was placed and will be delivered before 11:11"
3.0.2 :008 > 

3.0.2 :003 > order = Order.new
3.0.2 :011 > order.view_menu(takeaway)
{"Dish 1"=>10, "Dish 2"=>12, "Dish 3"=>14}
 => {"Dish 1"=>10, "Dish 2"=>12, "Dish 3"=>14} 


 3.0.2 :011 > order.add_dish(takeaway, "Dish 2")
 => #<Order:0x00007fc5aa95eff8 @order_cost=[12], @order_dishes=[nil]> 
 3.0.2 :012 > order.add_dish(takeaway, "Dish 3")
 => [12, 14] 
 3.0.2 :013 > order
 => #<Order:0x00007fc5aa95eff8 @order_cost=[12, 14], @order_dishes=[nil, nil]> 
 3.0.2 :016 > order.order_cost.sum
 => 26  