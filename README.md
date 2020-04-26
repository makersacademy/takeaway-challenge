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

-----------------------------------------------

Ideally i wanted to make this a terminal app that putsed various questions like 'What would you like to order'. However this required the user (or test) inputting data, then gets.chomp would put the data into the code. I could not manage to work out how to run tests to cover this so opted against it. This has made the actual programe quite cumbersome, but it works. I thought it was more important to have test coverage.

I have an Order class. Each instance has 4 methods.

.view_menu - this shows the options available on the menu, with a corresponding number.
.add(x,y) - this adds items to the order - x is the item number, y is the amount you would like to add.
.total - displays the total of the order so far. I was unsure what situation was meant to throw an error, so there are no errors thrown.
.checkout - this sends a text to confirm the delivery time. All functional.
.add_hour - this is a private method to add an hour to the current time.

-----------------------------------------

I would like to add a test to see if the text has been sent. I have just put a return true after the code so it is a bit of a redundant test. I did look into it, and it involved having a URL of a dropbox which could recieve something from Twilio once the text had been sent.

--------------------------------------------

I put the Twilio secure numbers in a second ruby file which i required at the top of my main ruby file. I had a module in there with some constants, so I included the module in my Order class to access the constants. I then told git to ignore the ruby file with secure data.

-----------------------------------------------------

