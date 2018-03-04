Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  J.S  |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Brief Summary of Approach
 -------
I used diagramming to plan my objects and how they would interact with each other.  I then used the TDD cycle, with frequent diagram revisits to implement the program.  I feel a lot more confident with classes and delegation after this challenge.  

Points for development:
* explore injecting dependencies
* customers can place orders via the text message

Instructions
-------

* Clone this repository
* cd takeaway-challenge
* Run the command 'bundle' in the project directory to ensure you have all the gems
* To use in irb please comment out the following part of line 2 in messager.rb { if ENV['RUBY_ENV'] == "development" }

User stories
--------
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

Functionality in IRB
--------
```
To access the Cafe: require './lib/cafe.rb'
To visit a new Cafe: cafe = Cafe.new
To read the Menu: cafe.read_menu
To order food (item, quantity):  cafe.order_me("CHOCOLATE_BANANA_PANCAKES",2)
To access basket summary: cafe.basket_summary
To check out (and submit payment): cafe.checkout(15.75)
This will send you a text to confirm your order has been placed.
To exit: exit
```

Technologies Used:
--------
* RSpec
* Twilio API
