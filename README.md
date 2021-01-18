# Takeaway Challenge

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

In this mini-project I partially created a command line app for ordering a takeaway, using TDD.

This project was a weekend challenge for Makers Academy bootcamp (week 2 of 12).

Below were the user stories to utilize:

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

I created two classes: Menu and Takeaway. My idea here was that Takeaway should encompass everything you would do at an actual takeaway restaurant - read a menu, order items by putting those items in a basket, and being able to check what was in your basket.

What I still need to work on in this project is:

~~1. Adding the ability to update the prices~~
~~2. Making sure that what the customer orders is actually on the menu~~
~~3. Totalling the price of the items ordered~~ 4. Setting up the Twilio API to send out confirmation texts 5. Implementing doubles correctly - right now I understand the theory of them, but not the actual use of them
