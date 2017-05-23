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

Makers Academy's second take-home challenge, where a food order can be made by a customer. This order will be confirmed and a text-message is sent to their number with relevant information such as price and estimated delivery time.

Text messaging service used: Twilio.

Information used for Twilio (authentication token, SID, phone numbers) stored in .env file. To properly run the program, create file with relevant information.

## How to Use:
#### Creating a Menu
The program starts with an empty menu. It is therefore the responsibility of the restaurant to create one; this can be done with the #add_item(dish, price) method.
```
2.4.0 :001 > require './lib/order'
 => true
2.4.0 :002 > menu = Menu.new
 => #<Menu:0x007ff1cca02a88 @selected_item=nil, @dish=nil, @price=nil, @list={}>
2.4.0 :003 > menu.add_item(:bread, 3)
 => 3
2.4.0 :004 > menu.add_item(:water, 0)
 => 0
```

#### Creating an Order
When creating a new order, it can take in an existing menu as initializing parameter. If none is provided, a new menu is created.

One can then select food from the menu with #select_food(dish, quantity). If no quantity is given, it is set as 1.

```
2.4.0 :005 > order = Order.new(menu)
Welcome to Veg-E! What will your order be?

 => #<Order:0x007ff1cc9f4708 @menu=#<Menu:0x007ff1cca02a88 @selected_item=nil, @dish=nil, @price=nil, @list={:bread=>3, :water=>0}>, @selected_item=nil, @order_list=[], @message=#<Message:0x007ff1cc9f46b8 @acc_sid="ACb57d78ffceb78ec72d31808940fdd9cb", @auth_token="e12e1e03d87e789be99786c14b9c97a1">>
 2.4.0 :006 > order.select_food(:water)
 => [{:dish=>"Water", :quantity=>1, :price=>0}]
2.4.0 :007 > order.select_food(:bread,2)
 => [{:dish=>"Water", :quantity=>1, :price=>0}, {:dish=>"Bread", :quantity=>2, :price=>6}]
```

#### Confirming an order
When all the dishes have been selected, one can decide to #end_order. Before a text message is sent out, the total order is displayed and a confirmation is requested. When confirmed, a text message with expected arrival and total price is dispatched.

```
2.4.0 :009 > order.select_food(:bread,2)
 => [{:dish=>"Water", :quantity=>1, :price=>0}, {:dish=>"Bread", :quantity=>2, :price=>6}]
2.4.0 :010 > order.end_order
1x Water: £0
2x Bread: £6
--------------
Total price: £6
Is this your final order? (y/n)
y
Your food is on its way; eet smakelijk!
"CUSTOMER'S PHONE NUMBER"
```


## User Stories

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

#### Object Diagramming

![alt text](https://github.com/RSijelmass/takeaway-challenge/blob/master/takeaway_diagram.png)
