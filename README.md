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

Approach
------------------
My approach with this challenge began with the formation of diagrams and planning out the various classes that would be required
to complete it neatly.

I opted to go with four classes: Takeaway, Order, Menu and Sms.

Additionally, if I have an opportunity in the future I might consider refactoring and extracting a fifth class, Printer, for
printing the various sections of information. I have also been considering extracting the menu list into a CSV file.

Currently, I have yet to implement the bonus ability to place an order via text message, but the customer will receive
a confirmation text when ordering through the program. The code is using environment variables in place of my personal
information, so don't forget to assign the environment variables if you want to use the Sms feature.
