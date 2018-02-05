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
User stories:

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

I really struggled with this one, mainly due to getting bogged down in things which may not really be that important.

For example, I imagined the app running in irb and the user being shown the menu then asked to input the menu number and the quantity using gets and puts. Whilst I have managed to create this functionality, I lost a lot of time trying to make tests for stubbing the user input into RSpec, and still did not make the tests work as I would have wished, by accurately stubbing an example user journey.

When I got to the stage of using the twilio API send the text message, I wanted to use environment variables instead of having the account SID, auth token and my phone number right there in the code. I lost most of the day failing to get this to work, and got pretty frustrated.

In order to complete the project, I would take a step back, remember the MVP principles and (for example) have an order method which would take the dish ordered and the quantity as arguments, making the testing much easier.

In terms of environment variables, I will get advice from my cohort and coaches, as I still believe this is an important thing to learn.
