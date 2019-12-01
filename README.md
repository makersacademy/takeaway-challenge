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
Summary
-------
Write a Takeaway program that allows a user to make an order. The program must have a list of dishes and their prices from which the client can order. More details about the requirements can be found [here](https://github.com/makersacademy/takeaway-challenge). 

This project has 14 passing tests with 100% test coverage. The project is made up of two classes - the Menu class and the Order class. The Menu class contains the list of items and their prices and prints each item and its price. The Order class is where the user can place an order. 

Plan
-------
User stories: 
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
You can see more details of my plan [here](https://github.com/jessmar94/takeaway-challenge/blob/master/plan.md). 

How to Install and Run
-----------------------
1. Clone this repo to your local machine
2. Run the command gem bundle install if you don't have bundle already.
3. Run bundle install when the installation completes.
```
2.5.0 :001 > require './lib/order.rb'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007fd21d150918 @menu=#<Menu:0x00007fd21d1508f0 @menu={:pizza=>8.0, :burger=>5.0, :chips=>2.0, :fish=>6.0, :falafel_wrap=>4.5}>, @total_order=[]>
2.5.0 :003 > order.add_item(:burger)
burger x1 added to your basket
 => nil
2.5.0 :004 > order.add_item(:pizza, 2)
pizza x2 added to your basket
 => nil
2.5.0 :005 > order.order_summary
burger x1 = £5.0, pizza x2 = £16.0
Your total cost for this order is £21.0
 => nil
2.5.0 :006 > order.check_out(21)
Type Confirm to place your your order
Confirm
 => "Thank you! Your order was placed and will be delivered before 20:04"
```

How to Run Tests 
----------------
1. Run the command rspec in the terminal.

Project Status 
----------------
As of 29th September 2019, 3 of the user stories have been fully implemented. The final user story has been implemented without the text messaging feature, so a user receives the confirmation message via the terminal (as can be seen in the example above). 

Next, I would like to implement to set up the text message feature with a Twilio API, which I would create a Messager class for. I would also look into creating a Calculator class which manages the calculation of the costs and the time. 

