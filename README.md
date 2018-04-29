Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | MUZZI |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

 ## Project Overview ##

 This application has been built to create an interactive take away simulation for
 use in a REPL environment.
 It allows the user to create custom dishes, menus and take aways.
 The user can display their menus, select items to put in their basket and confirm payment.
 Orders are also confirmed via an automated text message.
 This has been created to solve the user stories set out in the challenge, however it requires more work to finesse the extra features put into it such as the user interface.

 ## How to use ##
 + Fork this repository and clone it to your machine
 + Run the command ``` gem install bundle ```
 + Run ``` bundle ```
 + Open a REPL environment

 For customer use:
 + Require ``` ./lib/user_interface.rb ```
 + Follow the automated instructions in the terminal

 For restaurant use (building menus and testing order functions):
 + Require ``` ./lib/take_away.rb ```
 + Type ``` dish = Dish.new(a, b)``` to create a new dish called "dish", where "a" is the name of the dish and b is the price as an integer.
 + Type ``` my_restaurant = TakeAway.new(a) ``` to create a new take away called "my_restaurant", where "a" is an optional name input.
 + Type ``` my_restaurant.add_menu_item(dish) ``` to add dish to the new menu.
 + Type ``` my_restaurant.display_menu ``` to print out your menu.
 + Type ``` my_restaurant.add_to_basket ``` to add a listed menu item to the shopping basket.
 + Type ``` my_restaurant.basket_total ``` to see the current cost of the shopping basket.
 + Type ``` my_restaurant.checkout(a) ``` to confirm payment of "a" amount. If "a" matches the basket total, text confirmation of the order will be sent via sms.

 ## The following technologies were used in the creation of this system: ##
 + Rake
 + RuboCop
 + SimpleCov
 + Capybara
 + Twilio

 ## Testing ##
 Rspec was used to test-drive this application.
 If you would like to see the tests run, simply type
 ``` rspec ```
 from the project directory
