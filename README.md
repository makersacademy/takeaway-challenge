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

My steps:
- Firstly I drew up a class diagram like this
Class Diagram

Class          Menu           Deliver

Instance    view_menu
variables   add_to_order       order

Methods    right_money?   confirmation_text

- I found myself loosely following this setup as it came to writing the code there were a few extra points I didn't take into account
- I worked through each user story one by one trying to satisfy all the needs for the story then move onto the next.
- I basically had a menu class and an order class (which was tied to a text confirmation class)
- This worked well but my code for getting/taking the order needs work as I was not able to get it to function as desired.
- In the future I would like to be more comfortable with hashes and editing/adding values to it - as this is what tripped me up.
- I currently have a problem with dotenv and loading this when writing my tests. After looking online i couldn't find a solution so I may need to speak to a coach as I currently have 0 tests working for the confirmation class.
