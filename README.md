# Takeaway

These classes allow a user to: create dishes; create menus containing dishes; list the dishes on a menu; add dishes to an order by menu number; check the price of their order; and submit their order, which will send a confirmation text to the given phone number.

The Menu, Dish and Order class (along with the Twilio::REST::Client class) interact in the following way:

![image](https://user-images.githubusercontent.com/36577903/117579720-11108d80-b0ec-11eb-96d0-81dcb783ad3d.png)

# Installation

```
git clone https://github.com/rdupplaw/takeaway-challenge.git
```

Use .env.template to create your own .env file, containing your Twilio account SID, auth token and number.

# Usage

```
require 'menu'
require 'dish'
require 'order'
require 'twilio-ruby'

menu = Menu.new([
	Dish.new(name: 'Vegan Mixed Grill', price: 5.5),
	Dish.new(name: 'Sweet Potato Fries', price: 6.50),
	Dish.new(name: 'Vegan Burger', price: 7.50)
	])

menu.list_dishes

order = Order.new(text_message_client_class: Twilio::REST::Client)

order.add_dishes_to_order(menu, 1, 2)

order.check_order

order.submit_order('555-555-5555')
```
