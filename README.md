Takeaway Challenge - Completed

The user stories have been completed - however there are some edge cases that need to be completed.

To do:

Seperate checkout functionality from order class into a seperate class.

Rubocop.

Add the ability to edit/remove dishes from the basket.

Add user feedback to confirm/deny that a dish has successfully been added/removed from the basket.

Add the ability to edit/add/remove existing dishes.

Write the correct test for SMS functionality.

Simplify methods.

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

This program allows the user to order from a number of predetermined dishes.

The user can view their basket (dishes & their values) and how much the order will cost.

Upon checkout the user can decide what amount to pay and receive an error message if the amount is less than the order total, or a message confirming they would like to tip the extra amount.

After comfirming the amount to pay, the user is required to input a valid phone number and will receive an SMS confirming the delivery time for +01:00 the current time.

Twilio personal details are removed for security reasons (Account SID & Auth Token) - Input your own in order to activate SMS functionality.

This program is fully functional, however some additions to increase the amount of information the user receives would be preferable.
