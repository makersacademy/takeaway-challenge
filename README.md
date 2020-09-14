Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  S.C. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Notes
-------

* I created five classes: menu, order, restaurant, text and secret_number. The last of these is not on GitHub.
  * Menu holds the restaurant's menu and associated methods.
  * Restaurant initializes a restaurant object, and creates a new order in a method.
  * Order does the most work of all the classes in fulfilling the requests in the user stories.


Known issues
-------
* Doubling up of Menu class methods in another file. The menu ones are not used to the extent they should be.
* Texts will test OK, but the numbers required are all stored as constants in a file that was not uploaded to GitHub, so no text will send if the program is run in IRB (but it does work locally on my machine).


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
