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

Task completed:
--------------

* Forked this repo
* Ran the command 'bundle' in the project directory, so all the gems were installed
* Wrote a Takeaway program with the following user stories:

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

*functionality implemented:
  * list of dishes with prices
  * Orders can be placed by giving the list of dishes, their quantities and a number that should be the exact total. 
  * If order sum is not correct an error is raises, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * Twilio API was registered.
  * twilio-ruby gem was installed to access the API
  * Gemfile was used to manage project gems
  * Takeaway is thoroughly tested and mocks and stubs used
  * When Takeaway is loaded into IRB and the order is placed, the text is actually sent

* **IMPLEMENTED** 
* Mobile number was stored in environment variable on github.

Confirmation for code review:
=============================

* All tests passing
* [Test coverage] (Simplecov: 100%)
* [Rubocop issues]: 0%
