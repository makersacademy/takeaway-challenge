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

This project attempts to recreate a takeaway application to be able to place an order and receive a txt message for confirmation.
This project is not completed and attempted until user story 3 with a minor bug during the calculation of the total price, yet to be resolved.

The design of the application was made using sequence diagrams and class diagrams which allowed me to create 3 classes bearing in mind the single responsibility principle.

Initially a takeaway class was created which delegated the responsibility to print the menu to a menu class.

The menu class would hand the calculation of the final price to a order class.

In the order class there is a bug that needs to be resolved as the price calculation it currently returns nil.

A combination of OOP techniques was used such as Dependency injection, methods Stubbing and Mocking
