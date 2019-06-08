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
-----------

* This is my solution to the Makers "takeaway challenge"
* By completing this challenge I've gained experience of writing feature tests, using environment variables, and external APIs.
* I've also tried to create a domain model, with classes which conform to the SRP, and are losely coupled.
* Given more time I would have liked to have tested more edge cases and refactored the code to make the methods shorter.
* I would have also like to have put everything under one place_order method, to more closely match the spec.
* I have some outstandig questions about how to use private methods, whilst maintaining test coverage. How do you ensure any logic in a private method is tested?

How to Run
----------

* Run from the IRB
* The SMS class looks up Twilio account details and telephone numbers from environment variables.

Testing
-------

* Tests can be run using the rspec command from the root folder
* All tests pass.
* Code coverage is > 95% (just!).

User Stories
------------
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
