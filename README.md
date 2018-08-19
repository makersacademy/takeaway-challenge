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

My takeaway offers a range of tasty ice-creams, take a look at the menu to find out what flavours we have! As a customer you can:
- See the menu on offer
- Place an order

If your order is provided with an incorrect total cost then an error will be raised. If the correct order cost is provided a text will be sent confirming the order is on its way.

The code comes with feature and unit tests. Coverage is 100% and all tests are passing.


Domain Model
--------

**OOP and TDD**

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

**TDD using RSpec:**
The program was developed test-first:
- Feature tests are provided in RSpec. Take a look at the features tests [here](specs/features/user_stories_spec.rb).
- Unit tests were also created in RSpec. These describe how I intend specific blocks of code to work in isolation. 
- Using the TDD process I developed chunks of code to ensure my unit tests passed. I followed the RED, GREEN, REFACTOR process before moving onto the next unit/feature test.
- `simplecov` was used to show the test coverage (current version shows 100% coverage).
- `rubocop` was used to ensure that coding standards were met in all files (no offenses in current version).




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
