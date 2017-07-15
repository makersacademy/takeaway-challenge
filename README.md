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

Instructions
-------

* The project's functionality is demonstrated in the last feature spec found in feature specs folder takeaway-challenge/feature_spec

User Stories
-----

The project implements the following user stories.

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

Design
-----

#### Menu

Creating a new instance of Menu expects two arguments

|Argument |Optional?|Type                                       |
|:-       |:-       |:-                                         |
|name     |No       |String                                     |
|dishes   |No       |Hash (key - dish name, value - dish price) |

The ability to add a dish to the menu has not been implemented on purpose. This is because all user stories are from the perspective of a 'customer' wanting to place an order at which point it is a reasonable expectation that a menu already exists. Adding a dish to the menu is an action from the perspective of the 'restaurant manager' and a feature that has not been asked.
