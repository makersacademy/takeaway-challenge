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

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

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


My Approach
------

I started by drawing up simple diagrams for each user story before creating the objects.
So the customer can see a list of dishes with prices, I created the Takeaway class, which holds the method to read the menu (read_menu). The menu is initialised in the Takeaway class.

Originally, I created a separate Menu class, but realised that all it did was storing the menu and loading it, so then Takeaway could load it, so I decided to integrate the feature into Takeaway and deleted my Menu class.

So the customer can select a number of dishes, an Order class was set up with the functionality to select multiple number of dishes and add them all up to a total.

A text message is sent to the customer to confirm that their order was placed and it would be delivered in an hour. This was done using Twilio API. Sensitive information - such as my personal mobile number and the number that Twilio provided as part of their free trial service - are stored and accessed as environment variables. I used the dotenv gem for this.

Known Issues 
-------
I haven't implemented a basket summary for the customer to check against the order total. This is because at first I didn't understand the concept, and I left this to the end. I did not have enough time to implement it.

I have some "dummy" rspec tests running for the text message function, and a message is sent each time rspec runs.

I would like to fix both of these issues at some point.
