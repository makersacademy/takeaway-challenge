# Takeaway Challenge

## What is it?
Takeaway challenge is a command line app that allows a user to order take away for a pizza restaurant. They can have a look at the menu, chose the items that they want, and see the total that they will have to pay for the order.

Once the order is confirmed, the user will get a text to confirm, including their expected delivery time.

### How to Use:
As this is a command line app, clone the repo, then open then require the ./lib/order.rb and ./lib/menu.rb files.

1. Create new menu object, this will need an array of hashes that contain the name of the item and the price.

`2.5.0 :004 > menu =  Menu.new([{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }])
 => #<Menu:0x00007f9eaf1398b8 @items=[{"Margherita"=>8}, {"Roasted Vegetable"=>9}, {"Chorizo"=>12}]>`

`2.5.0 :005 > order = Order.new(menu.items)`

2. Create a new order object. This needs access to the menu items.

`2.5.0 :005 > order = Order.new(menu.items)
 => #<Order:0x00007f9eb01aeb80 @menu=[{"Margherita"=>8}, {"Roasted Vegetable"=>9}, {"Chorizo"=>12}], @items=[], @total=0>`

3. View the items and their prices on the menu using menu.items

4. You can then select the item that you want, one at a time.

`2.5.0 :008 > order.choose("Chorizo")
=> ["Chorizo"]`

`2.5.0 :009 > order.choose("Roasted Vegetable")
 => ["Chorizo", "Roasted Vegetable"]`

5. Confirm your order using confirm_order method. They should get a confirmation message with the total due and what they have ordered, as well as the notification

`2.5.0 :010 > order.confirm_order`

### File Manifest:
The main files that you will need the items in the 'lib' folder. This includes:
* menu.rb
* order.rb
* send_sms.rb

### Gems:
To run this program the gems required are Twilio-Ruby and Dotenv.

### My approach to this Challenge
I used TDD and OOD to design and create this program. I aimed to create as little dependancies as possible using polymorphism and doubles.

## How to Test:
To test this program, please use rspec. Note that this will run both unit tests (./menu_spec.rb ./order_spec.rb and ./send_sms_sepc.rb) and also feature tests (./feature_tests/user_stories_spec_rb).
