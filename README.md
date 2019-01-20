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

- CheckMenu will present the available menu and take the order from client and forward to class Order.
- Order will initiate a new CheckOrder object with the required dishes, their quantities and the total to be charged to client.
- Menu (module) will contain an array of hashes of all available dishes with their prices.
- CheckOrderIsValid will then check the validity of the order (that the total matches the total prices of the required items as present in the Menu module) then if ok will pass instruction to PlaceOrder to send txt, otherwise will raise an error.
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
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful


[Sherif Shendidy]()
