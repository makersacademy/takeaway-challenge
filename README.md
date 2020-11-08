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

The task was to write a Takeaway program with the following user stories:

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

* Functionality that was implemented with TDD:
  * A list of dishes with prices
  * Orders placed by giving the list of dishes and their quantities
  * Payment must be the exact total. If the sum is not correct the method raises an error. Otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered within the hour.
  * The text sending functionality is implemented using Twilio API.
  * Creatd environment variables to hide my Twilio API key and mobile number

* Room for improvement:
  * Needs better tests for the Twilio text confirmation
  * When listing items in the basket, they are still in their {hash brackets}
