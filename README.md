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
Welcome to Carlos Trapet's - traditional Indonesian Restaurant!
-------
Approach
-------
* After carefully reading the user stories, it was clear to me that this project needed thorough diagramming. I therefore spent a good time creating the diagram model, making sure to add the additional methods and features that were planned at a later time.

* I then started implementing the features following the TDD/BDD cycle and making sure to create minimalistic unit tests and making them pass before moving to the next step.

* Lastly, I implemented the interaction with the Twilio API and added Time-class functionality.


Instructions to run the program
-----

* Fork this repo
* Fire up your REPL and input the desired commands

```
require './lib/restaurant/.rb'
the_makers_mezz = Restaurant.new # => creates a new restaurant for you to go to
the_makers_mezz.print_menu # => prints the current menu
the_makers_mezz.add_item(dish, quantity) # => adds chosen dish and quantity (1 bif not specified)
the_makers_mezz.complete_order # => completes the order and tells you the bill. please remember that we are not open on Sundays!
the_makers_mezz.pay(amount) # => pays the bill, sends confirmation message and archives the order
the_makers_mezz.order_history # => displays the order history
```

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

