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
 
 Goal
 -----

This was the weekend challenge from Makers, which we had to complete individually. The instructions and goals are here on the master branch https://github.com/makersacademy/takeaway-challenge . The aim was to create an app in Ruby where the user can order food from a (pretend) restaurant. 
 
 Features
 -----
 
 * User can order food via the terminal
 * Users receive a text telling them that their order has been placed, and the time to expect it. 
 
Approach
-------
I approached this challenge by creating five classes:
- A Menu class, which stores the menu
- An Order class, which creates a new order, sends and order to be printer and confirm orders. 
- A Calculator class, which calculates the total of an order
- A Printer class, which prints out the menu and the bill
- A Text class, which sends an SMS to confirm an order

How to use 
-----
To see the menu:

Type IRB in terminal, then:

![screen shot 2018-12-06 at 16 53 00](https://user-images.githubusercontent.com/42243785/49598844-6d997c80-f977-11e8-88cd-e3cf040d1f55.png)


To order:
--------

In IRB:

![screen shot 2018-12-06 at 16 56 55](https://user-images.githubusercontent.com/42243785/49599114-1051fb00-f978-11e8-83c7-53e16f123436.png)

The place_order method intends for the customer to enter what they expect the total bill for the order to be. It sends a text message to confirm the order if this is right, or raises an error if it's not right. (I wasn't sure how to interpret the instructions on placing an order, so I chose for it work like this). 


To run the tests
------
- Use Rspec

![screen shot 2018-12-06 at 16 47 58](https://user-images.githubusercontent.com/42243785/49598567-d3393900-f976-11e8-9409-c1e785a19ce4.png)



What went well
------

* This was my first time using doubles and stubs by myself, and I think it went really well
* The same goes for Depedancy Injection
* For my second weekend challenge at Makers, I'm pleased that my code was very encapsulated
* I'm really pleased that I got the Twilio gem working, it was my first time learning a new technology like that by myself

What I could have improved upon/If I had more time
-------
 * I didn't manage to work out how to test the Twilio gem
 * The process of ordering is quite complicated, if I was writing it now I would simplify it
 * The time that the order arrives is always the same! 
