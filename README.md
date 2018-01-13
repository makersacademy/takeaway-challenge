Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  B.P. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Introduction
------------
This is a terminal based application with Twilio API implementation where I have integrated the text messaging ability as part of the design. I have designed and tested each class with TDD in mind.

The story board is below which gives you the requirements of the client. As a customer, you can look at the ‘Enchanted Takeaway menu’ and order your potion. Each selection comes at a cost. You can add your selection and look at the total order. Finally the order can be confirmed with a text message. The text message gives you the approximate time of delivery.

To use the Twilio text messaging service you will need to register and create an account at [www.twilio.com](https://www.twilio.com).


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
Usage
------------------
You can use the following commands to use the application;

takeaway = TakeAway.new               ===> To create a new instance

takeaway.see_menu                     ===> To see what is on menu

takeaway.select_dish("DISH NAME")     ===> To add dish to your order

takeaway.bill                         ===> To see the total cost so far

takeaway.order_list                   ===> To see the total bill including selection

takeaway.complete_order               ===> To complete order and send confirmation text  
