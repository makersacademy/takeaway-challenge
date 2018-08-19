Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  D.L. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```


What does it do?
-------

In response to the user stories (below)[user-stories] this program was created to allow a customer to:
- See the menu on offer
- Place an order

If the order is provided with an incorrect total cost then an error will be raised. If the correct order cost is provided a text will be sent confirming the order is on its way.

The code comes with feature and unit tests. Coverage is 100% and all tests are passing.


Domain Model
--------

The user interacts directly with the OrderManager class via the terminal. The diagram below describes the class/module structure.

<pre>
OrderManager  
     |  
     |<----------> MenuPrinter  
     |  
     |
     |<----------> OrderChecker
                        |
                        |
                        |<---------------> SendText
                                              |
                                              |
                                              |<--------------> DeliveryTime
<pre>     


User Stories
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
