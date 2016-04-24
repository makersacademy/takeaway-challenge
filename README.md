Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  H.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'
 
 ```
Task
-----

* Write a Takeaway program with the following user stories:

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

*From the user stories, I have decided to have 5 classes: SMS, Takeaway, Order, Menu and Dish. All the interactions from customers take place in Takeaway class.

*I was having issue with the order confirmation text, regarding setting the time to match spec. I have found the [Youtube video on Takeaway challenge](https://www.youtube.com/watch?v=mgiJKdH9x8c&index=23&list=PLqzj29yLm_lmL2RElr_kLdpKrpsewjRek) to be extremely helpful with stubbing time and get a better understanding of how to integrate Twilio into your app.


Installation Instructions
------------------
*Clone the git repo in your chosen directory

`git clone https://github.com/hazukitran/takeaway-challenge.git`

*Run the command 'bundle' in the project directory to ensure you have all the right gems

*In order to use the SMS functionality you will need to have a Twilio account. Twilio sign-up is free and painless and can be done here https://www.twilio.com/try-twilio

*To interact with the program launch irb or pry and require the './lib/takeaway.rb' file.


Author
------------------

Lexi Tran hazukitran@gmail.com
