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

Approach
-------
* This takeaway project was done in Ruby.

* The task was solved in a test driven manner using rspec. due to there being multiple classes, doubles and stubs had to be used to ensure their isolation in testing.

* The problem was split into 3 classes responsible for 3 separate issues.

* The first was a Menu class that was responsible for storing the menu and listing it. I chose a menu from a local Indian to replicate, because it's delicious.

* The second was a Order class that was responsible for storing the oder and the associated price.

* The last was a Message class responsible for sending a message to the customer confirming the order and delivery time.

* APIs we're kept private by storing them in a separate file, that was listed on the gitignore.

Task
-----

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
