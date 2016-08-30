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

Notes on my approach
------------------
This is the 2nd weekend challenge at Makers Academy and the following are the summary of steps taken to create this Takeaway program:

* User Story 1
  * Created Menu class to include a simple menu hash with dishes and prices.
  * Implemented #view_meu within the Order class only a bit later, when I implemented interactions between classes.

* User Story 2 & 3
  * Created Order class to implement #add_dish, #check_total and #compare_price methods to satisfy the user stories 2 & 3 for customers.
  * Implemented #check_menu? method as private. It should mainly deal to check whether the selected dish by the customer is available on the menu.

* User Story 4
  * Created Messenger class to implement the text confirmation.
  * The text sending functionality has been implemented using Twilio API as requested.

* Feature tests and unit tests have been implemented accordingly prior to implementing each step of the program to ensure I was aware of what I would like to implement.

* The program and tests have not yet been refactored and this would be my next steps to finalise this challenge.
