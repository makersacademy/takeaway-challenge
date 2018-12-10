Takeaway Challenge
==================
```
                            _________
              r==           |   ~   |
           _  //            | J.A.G |   )))) ------------------
          |_)//(''''':      |   ~   |
            //  \_____:_____.-------D     ))))) ----------
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    ))))) -----
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instructions
-------

1 Open Terminal from the within the 'lib' folder 
2 Run irb
3 Type require './restaurant.rb'
4 Create a new instance of restaurant 'my_restaurant = Restaurant.new'


show_menu
Gives the list of dishes and their prices

ask_order 
Allows you to type in your order. For one item simply enter the item name, for two or more format your entry like this: 'Peroni, 2' and they'll be added to your order

show_summary
Prints your order so far, giving the price of each item and the overall total


Approach
-------

For this challenge I wanted to focus on strictly adhering to TDD, so I diagrammed out each user story using a sequence map and mocked up what the feature test would look like in IRB before writing the failing test in RSpec and moving onto writing the code to make it pass.
As this was my primary goal I'm pleased the program has 100% test coverage and every commit was done with all tests passing. This did slow me down a bit as I'm in the process of improving my RSpec knowledge. 

I also wanted to focus on applying these concepts from week 2:

-  Classes and methods with high cohesion and low coupling
-  Considering LoD
-  Having DRY code
-  Applying SRP

I have achieved this in many places but there are also many places where I could improve. There are a few methods that need to be split up into smaller methods (or maybe structs) and I think I should have created a display class, as it seemed wrong that the order was both processing (adding/retrieving) and displaying. In particular the Order.summary method is way too long and has multiple processing and display functions. 


Suggested Funtionality Extension
-------

- Getting to the Twilio text stage
- An error message when user enters an item not on the menu
- Displaying the menu in a more pleasing format (not just a plain hash)


Set up
-------

Gemfile Summary
\\\

ruby '2.5.0'

gem install twilio-ruby
gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop', '0.56.0'
gem 'simplecov', require: false, group: :test
gem 'simplecov-console', require: false, group: :test

\\\



Feature Test for ask_order & show_summary methods
-------

\\\

2.5.0 :003 > r.ask_order
"Please enter your order"
Peroni, 2
 => 2 
2.5.0 :004 > r.ask_order
"Please enter your order"
Green salad, 2
 => 2 
2.5.0 :005 > r.ask_order
"Please enter your order"
Quattro stagioni
 => ["Peroni", "Peroni", "Green salad", "Green salad", "Quattro stagioni"] 
2.5.0 :006 > r.ask_order
"Please enter your order"
Pollo ad astra
 => ["Peroni", "Peroni", "Green salad", "Green salad", "Quattro stagioni", "Pollo ad astra"] 
2.5.0 :007 > r.show_summary

"         ~ Your order so far ~          "

"         Peroni ........ £4.50          "
"         Peroni ........ £4.50          "
"       Green salad ........ £4.50       "
"       Green salad ........ £4.50       "
"    Quattro stagioni ........ £7.00     "
"     Pollo ad astra ........ £6.50      "
"         Total ........ £31.50          "
 => "         Total ........ £31.50          " 
 
\\\
