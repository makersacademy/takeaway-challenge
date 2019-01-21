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
- Method check_order_is_valid  will then check the validity of the order (that all dishes are available in the menu and that the total matches the total prices of the required items as present in the Menu module) then if ok will pass instruction to the class PlaceOrder (place_order.rb) to send txt, otherwise will raise an error.
- PlaceOrder will send confirmation message.


Module: Menu
Vars: menu (array of hashes of all available dishes along with their prices)

Class: Order (responsible of initiating a new order)
Vars: new_order (to hold an array of hashes with the required dishes and the total price.)
Methods: check_order

Class: CheckOrderIsValid (responsible of checking the total passed from Order is correct)
Vars:
Methods: check_order_is_valid (compares received order with the module and confirms total price)

Class: PlaceOrder
Vars: meals [{meal => "def", quantity => 2, price => 2.4}, other meals ordered]
Methods: place_order
How it works: Will take the order from the user and forward it to the CheckOrderIsValid class to check it's all valid. If ok, then it will pass the order to ConfirmOrder

## Tests
Using RSpec to test drive my program:

order_spec.rb: to test the class Order responsiveness to the method check_order, and that this method sends the correct information to class CheckOrderIsValid.

## How to use?
When placing a new order:
1- Check menu using check_menu.rb using method #display_menu
2- Place order by calling the method #send_order and use a parameter of an array of hashes for each dish and its quantity, then the last item in the array should be the total to be paid. Ex: [{dish: "your first dish", total: 2}, {dish: "your second dish", total: 1}, 7.35]
3- If you placed a valid order you'll receive text message confirming the time of delivery (45 minutes from successful order).

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful


[Sherif Shendidy]()
