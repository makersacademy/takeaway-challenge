## Week-2 challenge (Takeaway)
This is the weekend challenge of my week 2 in Makers academy. I acts as an application allowing users to place orders from a restaurant's menu for delivery, and if their order is successful, they shall receive a text message on their mobile confirming when they'll receive their meal(s).

## Motivation
To confirm to myself before anyone else that I've improved over that past two weeks and that I'm comfortable putting all new skills learnt to practice.

## Tech/framework used

<b>Built with</b>
- Ruby
- RSpec
- Twilio API

## Code Example

- Class CheckMenu (check_menu.rb) will present the available menu using the method CheckMenu.display_menu, and take the order from client then forward it to class Order (order.rb) using the method CheckMenu.place_order.
- The class Order will initiate a new CheckOrder (check_order.rb) object with the required dishes, their quantities and the total to be charged to client (all will be passed as an array of hashes argument).
- The Menu module (menue.rb) will contain an array of hashes of all available dishes with their prices.
- Method check_order_is_valid  will then check the validity of the order (that all dishes are available in the menu and that the total matches the total prices of the required items as present in the Menu module) then if ok will pass instruction to the method #place_order (place_order.rb) to send txt, otherwise will raise an error.
- Method #place_order will send confirmation message.


## Tests
Using RSpec to test drive my program:

order_spec.rb: to test the class Order responsiveness to the method check_order, and that this method sends the correct information to class CheckOrderIsValid.

## How to use?
First, make sure you run "bundle install" from your command line or terminal to be able to use the texting service in this applicaiton.

When placing a new order:
1- Check menu using check_menu.rb using method #display_menu
2- Place order by calling the method #send_order and use a parameter of an array of hashes for each dish and its quantity, then the last item in the array should be the total to be paid. Ex: [{dish: "your first dish", total: 2}, {dish: "your second dish", total: 1}, 7.35]
3- If you placed a valid order you'll receive text message confirming the time of delivery (60 minutes from successful order).

irb example:

$: irb
2.5.0 :001 > require_relative './check_menu.rb'
 => true

2.5.0 :002 > new_order = CheckMenu.new
 => #<CheckMenu:0x00007feb4c845370 @menu=[{:dish=>"Dish-01", :price=>3.45}, {:dish=>"Dish-02", :price=>2.99}, {:dish=>"Dish-03", :price=>4.75}, {:dish=>"Dish-04", :price=>1.49}, {:dish=>
"Dish-05", :price=>4.99}], @order_status=false>

2.5.0 :003 > new_order.send_order([{ dish: "Dish-02", total: 2 }, { dish: "Dish-04", total: 3 }, 10.45])
 => true

 Then a message is sent to confirm order.
