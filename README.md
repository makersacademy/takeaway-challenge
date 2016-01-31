Takeaway Challenge
------------------
Maker Academy Week 2 weekend challenge

This project is to create a takeaway program that:
* has a menu with prices
* allows the customer to choose dishes
* allows the customer to check the price total
* sends a text message to the customer to confirm delivery

The text message function is implemented using the Twilio API.

User stories provided:

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
How the app can be used:

```
[2] pry(main)> order = Order.new
=> #<Order:0x007f9b3e2e1a90
 @list=[],
 @menu=#<Menu:0x007f9b3e2e1a68 @pizzas={"margherita"=>6, "fiorentina"=>7, "quattro stagioni"=>8, "quattro formaggi"=>7, "marinara"=>5}>,
 @messager=
  #<Messager:0x007f9b3e2e1a18
@pizzas={"margherita"=>6, "fiorentina"=>7, "quattro stagioni"=>8, "quattro formaggi"=>7, "marinara"=>5}>
[3] pry(main)> order.read_menu
margherita: 6
fiorentina: 7
quattro stagioni: 8
quattro formaggi: 7
marinara: 5
=> {"margherita"=>6, "fiorentina"=>7, "quattro stagioni"=>8, "quattro formaggi"=>7, "marinara"=>5}
[4] pry(main)> order.choose("fiorentina")
=> "You have added 1 x fiorentina to your order."
[5] pry(main)> order.choose("marinara", 2)
=> "You have added 2 x marinara to your order."
[6] pry(main)> order.total
=> "The total cost is £17."
[7] pry(main)> order.place
=> "Thank you for your order! It will be delivered before 19:12."
[8] pry(main)> order.send_message
```
