Takeaway Challenge - Makers Academy
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

Application
-----

This application allows a customer to place an order at a takeaway establishment. The customer is able to view the menu and then add and remove dishes and their quantities from the order basket.

The customer can also view an order summary, outlining the dishes ordered, their quantities and the total cost so far. If the customer places an order, they are sent a text message confirming that the order will be delivered within an hour.

The text message sending functionality was implemented using the Twilio API.

Installation
-----
Clone the repository

Run `bundle` in the project directory to ensure all necessary gems are installed

Open irb, navigate into the project directory and run  `require './lib/takeaway`

Sample
-----

```
2.5.0 :001 > t = Takeaway.new
 => #<Takeaway:0x00007fc8921a36c0 @menu=#<Menu:0x00007fc8921a3698 @dishes={"Prawn Crackers"=>1.51, "Prawn Gyoza"=>3.51, "Chicken Gyoza"=>3.11, "Spring Rolls"=>3.15}>, @order=#<Order:0x00007fc8921a35a8 @basket={}>>
2.5.0 :002 > t.see_menu
 => "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15"
2.5.0 :003 > t.add_to_order("Spring Rolls", 3)
 => "Spring Rolls x3 added to your order"
2.5.0 :004 > t.order_summary
 => "Spring Rolls x3 = £9.45"
2.5.0 :005 > t.add_to_order("Prawn Crackers", 3)
 => "Prawn Crackers x3 added to your order"
2.5.0 :006 > t.order_summary
 => "Spring Rolls x3 = £9.45, Prawn Crackers x3 = £4.53"
2.5.0 :007 > t.remove_from_order("Prawn Crackers", 2)
 => "x2 portions of Prawn Crackers removed from order"
2.5.0 :008 > t.order_summary
 => "Spring Rolls x3 = £9.45, Prawn Crackers x1 = £1.51"
2.5.0 :009 > t.order_total
 => "Total cost: £10.96"
2.5.0 :010 > t.confirm_order
 => "Order received. Please await SMS for order confirmation"
```

User stories
______

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
