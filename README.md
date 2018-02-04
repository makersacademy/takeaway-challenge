Takeaway Challenge - Makers Academy Week 2
===================================
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
 -----

 This application allows a customer to place an order at a takeaway establishment. The customer is able to view the menu and then add and remove dishes and their quantities from the order basket.

 The customer can also view a summary of their order showing the dishes ordered, their quantities and the corresponding sub-total. If the customer places an order, they are sent a text message confirming that the order will be delivered within an hour.

 The text message sending functionality was implemented using the Twilio API.

Approach
-----
I read through each user story and created a flow diagram outlining the user's journey through the application.

Based on the user stories, I began thinking about how each class would interact with each other and created a second diagram outlining the responsibilities of each class.

Once the core features outlined in the user stories had been implemented, I focused on adding features that help defend against edge cases such as a user adding a dish that is not on the menu, adding a negative number of dishes or a user trying to confirm an order without adding any dishes to their order. Finally, I added some additional features such as the ability to remove dishes from the order in various quantities.  

Installation
-----
Clone the repository

Run `gem list` in the project directory to check whether `bundler` is installed. If it is not, run `gem install bundler`

Run `bundle` in the project directory to ensure all necessary gems are installed

Open irb in the project directory and enter `require './lib/takeaway'`

Sample
-----

```
2.5.0 :001 > require './lib/takeaway'
        ----
Welcome to Delicious Express
To view our menu, use see_menu
To place an order, use add_to_order(dish, quantity)
To remove a dish from your order, use remove_from_order(dish, quantity)
You can view a summary of your order using order_summary and order_total
To confirm your order use confirm_order
Use welcome_message to view these options again
        ---
 => true
2.5.0 :002 > t = Takeaway.new
 => #<Takeaway:0x00007f87b89f5e60 @menu=#<Menu:0x00007f87b89f5ac8 @dishes={"Prawn Crackers"=>1.51, "Prawn Gyoza"=>3.51, "Chicken Gyoza"=>3.11, "Spring Rolls"=>3.15}>, @order=#<Order:0x00007f87b89eff10 @basket={}>>
2.5.0 :003 > t.see_menu
 => "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15"
2.5.0 :004 > t.add_to_order("Spring Rolls", 3)
 => "Spring Rolls x3 added to your order"
2.5.0 :005 > t.add_to_order("Prawn Gyoza", 5)
 => "Prawn Gyoza x5 added to your order"
2.5.0 :006 > t.order_summary
 => "Spring Rolls x3 = £9.45, Prawn Gyoza x5 = £17.55"
2.5.0 :007 > t.remove_from_order("Prawn Gyoza", 2)
 => "x2 portions of Prawn Gyoza removed from order"
2.5.0 :008 > t.order_summary
 => "Spring Rolls x3 = £9.45, Prawn Gyoza x3 = £10.53"
2.5.0 :009 > t.order_total
 => "Total cost: £19.98"
2.5.0 :010 > t.confirm_order
 => "Order received. Please await SMS for order confirmation"
```

Extending the application further
-----

I would develop a more robust user interface that guides the user through the order journey

I would implement the ability to place an order by SMS

I would explore different ways to store and update the menu in the Menu class, perhaps using a CSV file so that the menu can be updated more flexibly

User stories
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
