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
#### User stories

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
----

#### Domain Model

| Class      | Properties                 | Methods              |
|------------|---------------------------|-----------------------|
| Restaurant | @name                     | view_menu             |
|            | @menu = []                | choose_dish(dish_num) |
|            | @order = Order.new        | add_to_order(dish)    |
| Order      | @order number             | view_basket           |
|            | @basket = []              | calculate_total       |
|            | @total = 0                | total_correct?        |
|            | @history = []             | complete_order        |
|            | @text = Text.new          | add_to_basket(dish)   |
|            |                           | reset_basket          |
|            |                           | reset_total           |
|            |                           | reset_order           |
|            |                           | order_history         |
| Text       | @client (using twilio)    | send_text             |


Optional extras:  
add_to_menu  
take_off_menu  
dish_not_available  

additional notes:  
* menu is currently hardcoded to one menu list that initializes with every new restaurant instance  


#### Things that could be added:  

[ ] ensure an order can't be completed if nothing in the basket  
[ ] minimum total of £15 for each order  
[ ] A customer can delete from the order  

----
#### IRB testing

require './lib/restaurant.rb'

##### create a restaurant instance:  
sparkleBurgers = Restaurant.new("Sparkle Burgers LTD")

##### view restaurants menu:  
sparkleBurgers.menu  
      => [{:"Cheese burger"=>10}, {:"Cheese and bacon burger"=>12}, {:"Pulled pork burger"=>15}, {:Fries=>6}, {:"Chilli fries"=>8}, {:"Onion rings"=>7}, {:"Coke 330ml"=>2},{:"Fanta 330ml"=>2}, {:"Brew Dog Vegabond 4.5%"=>5}]

sparkleBurgers.view_menu  
      => "Sparkle Burgers LTD's Menu:\n, 1: Cheese burger, £10\n, 2: Cheese and bacon burger, £12\n, 3: Pulled pork burger, £15\n, 4: Fries, £6\n, 5: Chilli fries, £8\n, 6: Onion rings, £7\n, 7: Coke 330ml, £2\n, 8: Fanta 330ml,£2\n, 9: Brew Dog Vegabond 4.5%, £5"


#####  add to order:  
sparkleBurgers.choose_dish(2)  
        => "Cheese and bacon burger has been added to your basket"
sparkleBurgers.choose_dish(4)  
        => "Fries has been added to your basket"
sparkleBurgers.order.view_basket  
         => "Viewing basket for order number 1:\n, Cheese and bacon burger £12\n, Fries £6\n, Total cost of order: £18"

##### complete_order:  
sparkleBurgers.order.complete_order  
          => "Thank you! Your order was placed and will be delivered before 2021-03-13 18:58:17 +0000"
          => sends text

