Takeaway Challenge (week 2)
===========================
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

Task
-----

The aim of this challenge was to build a program to satisfy the following user stories:

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
------

This program contains three classes:
1. Menu class which is used to store the dishes
2. Takeaway class which allows the user to order dishes from the menu and return there price.
3. Sendsms class which is used to send a text message, using the Twilio API, to confirm an order has completed.

There could have possibly been an extra class that called order, that takes away the 'Takeaways' responsibilty to take an order, however I felt as though that left the Takeaway class with little purpose and so I stook with the two classes.

Outline of program
------

```
2.5.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fed1248eb60 @menu=#<Menu:0x00007fed1248eae8 @menu={:pizza=>3, :chips=>6, :curry=>7, :cake=>6}>, @basket={}, @message=#<Sendsms:0x00007fed1248ea48>>
2.5.0 :003 > takeaway.menu
 => {:pizza=>3, :chips=>6, :curry=>7, :cake=>6}
2.5.0 :004 > takeaway.order_food("chips", 2)
 => "2 x chips(s) added to your basket"
2.5.0 :005 > takeaway.order_food("chips")
 => "1 x chips(s) added to your basket"
2.5.0 :006 > takeaway.basket
 => {:chips=>3}
2.5.0 :007 > takeaway.checkout(19)
Traceback (most recent call last):
        3: from /Users/erinstevenson/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):7
        1: from /Users/erinstevenson/Documents/Makers/week2/weekend/takeaway-challenge/lib/takeaway.rb:23:in `checkout'
RuntimeError (Incorrect total)
2.5.0 :008 > takeaway.checkout(18)
```

