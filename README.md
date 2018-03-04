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

Description
-------
Takeaway Challenge is a program for a takeaway restaurant.
* It allows the restaurant to show a list of dishes and their prices
* It allows customers to select dishes available in the menu
* It shows customers the total amount they owe after summing up the price of the items in the basket


Gems and ruby version used
-----
ruby '2.5.0'

gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop'
gem 'simplecov'
gem 'simplecov-console'
gem 'twilio-ruby'


Irb snippet
-----
2.5.0 :001 > takeaway = Restaurant.new
 => #<Restaurant:0x00007ff1709311b0 @menu=nil>
2.5.0 :002 > order = Order.new
 => #<Order:0x00007ff17092bb98 @menu={"steak"=>12, "pasta"=>7, "fish"=>9}, @basket=[], @total=0>
2.5.0 :003 > order.basket
 => []
2.5.0 :004 > order.total
 => 0
2.5.0 :005 > order.add_to_basket("pasta", 1)
 => 7
2.5.0 :006 > order.add_to_basket("steak", 2)
 => 31
2.5.0 :007 > order.basket
 => ["pasta", 1, "steak", 2]
2.5.0 :008 > order.total
 => 31
2.5.0 :009 > order.add_to_basket("curry", 1)
Traceback (most recent call last):
        3: from /Users/paosch/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):9
        1: from /Users/paosch/Documents/takeaway-challenge/lib/order.rb:10:in `add_to_basket'
RuntimeError (Sorry, curry is not in the menu)
