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

Installation
-------

* Fork the repository then git clone to your local repository
* Install Bundler to manage gem dependancies, then run 'Bundle' from the command line to install the relevant gems
* Open the program form the command line by requiring the 'Restaurant' lib file from the command line

Operation
-------

* The interface for the Takeaway program is the Restaurant class, this provides the public interface for the takeaway program, and is where the commands would be issued. The Restaurant interface is instantiated with the  'Restaurant.new' command. There are four main commands that provide the functionality specified by the User stories;

* show_menu - Returns a menu of items that can be ordered
* place_order ('dish', quantity) - Adds the specified dish to the order in the specified quantity(will default to 1 if no quantity provided)
* show_order - Returns a list of the items currently in the order, their quantities and the total of the order
* confirm_order(total) - The customer passes in their estimated/anticipated total to confirm the order, if this total does not match the total of items in the basket, an error will be raised. Otherwise the order will be confirmed and a string returned, and a text message confirming delivery time will be sent to the customer.


```
2.2.3 :001 > require './lib/restaurant.rb'
 => true
2.2.3 :002 > r = Restaurant.new
 => #<Restaurant:0x007fb859a64078 @menu_item_klass=MenuItem, @order=#<Order:0x007fb859a64050 @history={}, @messager_klass=#<Messager:0x007fb859a666c0>>>
2.2.3 :003 > r.show_menu
salt and pepper squid => 3.5,
chicken satay => 4.5,
prawn summer rolls => 5.6,
sticky pork ribs => 5.0,
chilli soft shell crab => 7.5,
2.2.3 :004 > r.place_order("chicken satay")
1 chicken satay, added to your order => nil
2.2.3 :005 > r.place_order("salt and pepper squid", 5)
5 salt and pepper squid, added to your order => nil
2.2.3 :006 > r.show_order
1 chicken satay, 5 salt and pepper squid, total 22.0 => nil
2.2.3 :007 > r.confirm_order(23.0)
RuntimeError: Total given does not match calculated total
	from /Users/emmabaddeley/Projects/takeaway-challenge/lib/order.rb:43:in `total_mismatch_error'
	from /Users/emmabaddeley/Projects/takeaway-challenge/lib/order.rb:32:in `confirm_order'
	from (irb):7
	from /Users/emmabaddeley/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 > r.confirm_order(22.0)
Your order has been confirmed
 => nil
2.2.3 :009 >

```

Approach
-------

I created four classes to implement the functionality required by the user stories;

* Restaurant Class - this is the public interface for the program that the customer interacts with. It is responsible for listing the menu and allowing a customer to place an order. It has unidirectional relationships with Order and MenuItem. Restaurant is instantiated once.
* MenuItem - Instantiated once for each item on the menu (defined as a constant in Restaurant). Holds information about the name and price of each menu item.
* Order Class - this class is responsible for adding items to the order, calculating the total of the order, and confirming when an order is completed. Order is instantiated once for each instantiation of Restaurant.
* Messager Class - responsible for sending the confirmation text message to the customer when the order is completed.

Gems
-------

* Twilio - I used the Twilio gem to send messages to phones
* Dotenv - I used the Dotenv gem to hide my Twilio credentials an environmental variables
