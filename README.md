Takeaway Challenge: README
==================


User stories
-----
The program implements the following user stories:

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


Approach to the challenge
-----
The program is divided into 3 classes:

* Menu - class that knows everything about the menu. Loads list of available dishes from the 'menu.csv' file. File can be changed upon initialization.
* Despatch - class responsible for communication with customer through text messages and estimating time of delivery (set +1 hour now)
* Order - class that knows everything about the order. It prints menu, takes an order from the customer, calculates total, validates the order and process the order for despatch.


Instructions for use
-----
The following commands executed will test the program:

export TWILIO_TOKEN="***VALID TOKEN HERE***"
export MY_NUMBER="***VALID PHONE NUMBER HERE***"

```
2.3.1 :001 > require './lib/order'
 => true
2.3.1 :002 > o=Order.new
 => #<Order:0x007f7fe30f44b0 @menu_list=#<Menu:0x007f7fe30f4460 @items_list={"Miso Soup"=>3.5, "Chef Special Miso"=>4.5, "Chilli Squid"=>4.95, "Whole Soft Shell Crab"=>5.95, "Takoyaki Octopus Balls 5 Pieces"=>4.95, "King Prawn Katsu 5 Pieces"=>4.95, "Vegetable Spring Rolls 12 Pieces"=>3.95, "Sweet Pumpk in 3 Pieces"=>3.95, "Kimchi Chicken"=>5.95, "Tofu Katsu"=>3.95, "Deep Fried Salmon Kimchi"=>5.95, "Salmon Hoso Maki"=>3.25, "Tuna Hoso Maki"=>3.5, "Sea Bass Hoso Maki"=>3.25, "Prawn Hoso Maki"=>3.5, "Eel with Cucumber Hoso Maki"=>3.95, "Cucumber Hoso Maki"=>2.25, "Avocado Hoso Maki"=>2.25, "Red Pepper Hoso Maki"=>2.25, "Kani Hoso Maki White crab meat"=>3.25}, @aFile="menu.csv">, @order_list={}, @despatch=Despatch>
2.3.1 :003 > o.print_menu
Miso Soup £3.5
Chef Special Miso £4.5
Chilli Squid £4.95
Whole Soft Shell Crab £5.95
Takoyaki Octopus Balls 5 Pieces £4.95
King Prawn Katsu 5 Pieces £4.95
Vegetable Spring Rolls 12 Pieces £3.95
Sweet Pumpk in 3 Pieces £3.95
Kimchi Chicken £5.95
Tofu Katsu £3.95
Deep Fried Salmon Kimchi £5.95
Salmon Hoso Maki £3.25
Tuna Hoso Maki £3.5
Sea Bass Hoso Maki £3.25
Prawn Hoso Maki £3.5
Eel with Cucumber Hoso Maki £3.95
Cucumber Hoso Maki £2.25
Avocado Hoso Maki £2.25
Red Pepper Hoso Maki £2.25
Kani Hoso Maki White crab meat £3.25
 => {"Miso Soup"=>3.5, "Chef Special Miso"=>4.5, "Chilli Squid"=>4.95, "Whole Soft Shell Crab"=>5.95, "Takoyaki Octopus Balls 5 Pieces"=>4.95, "King Prawn Katsu 5 Pieces"=>4.95, "Vegetable Spring Rolls 12 Pieces"=>3.95, "Sweet Pumpk in 3 Pieces"=>3.95, "Kimchi Chicken"=>5.95, "Tofu Katsu"=>3.95, "Deep Fried Salmon Kimchi"=>5.95, "Salmon Hoso Maki"=>3.25, "Tuna Hoso Maki"=>3.5, "Sea Bass Hoso Maki"=>3.25, "Prawn Hoso Maki"=>3.5, "Eel with Cucumber Hoso Maki"=>3.95, "Cucumber Hoso Maki"=>2.25, "Avocado Hoso Maki"=>2.25, "Red Pepper Hoso Maki"=>2.25, "Kani Hoso Maki White crab meat"=>3.25}
2.3.1 :004 > o.place_order("Miso Soup:1,Prawn Hoso Maki:2",10.50)
The order is now complete. ETA: 16:27
 => {}
2.3.1 :005 > o.place_order("Miso Soup:1,Prawn Hoso Maki:2",10)
RuntimeError: Your total was incorrect, the order is rejected!
	from /Users/dev/Google Drive/Projects/wk2/takeaway-challenge/lib/order.rb:39:in `place_order'
	from (irb):5
	from /Users/dev/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
2.3.1 :006 > o.place_order("Miso Soup:1,Prawn Maki:2",10.50)
RuntimeError: Your total was incorrect, the order is rejected!
	from /Users/dev/Google Drive/Projects/wk2/takeaway-challenge/lib/order.rb:39:in `place_order'
	from (irb):6
	from /Users/dev/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
```


Tests
-----
All RSpec test use double and stubs to ensure independence from other classes and changing environment.

Redundant RSpec test were removed
