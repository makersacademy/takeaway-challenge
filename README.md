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

Install Instructions
-------

* To run this app you will need to install the following gems:
```gem 'twilio-ruby'```
* Once Downloaded you will need to bundle install this file to install
all other gems in the Gemfile, if unsure, checkout the gem file.

To install Twilio please checkout https://www.twilio.com/

```

This code has been created to be fully changeable, changing the Menu completely will not affect any part of the code along with changing the send sms Twilio API. (If there is another preferred gem or API).


User Guide
----------
**1. (your_variable) = Order.new**

**2. (your_variable).read_menu**
Menu is as follows:
'Beef Burger' => 6.99, 'Veggie Burger' => 4.99, 'Chicken Burger' => 5.99,
'Thin Cut Fries' => 2.50, 'Thick Cut Fries' => 2.50, 'Onion Rings' => 1.99.

**3. (your_variable).select('your menu choice', (your quantity))**
Please Note - you must enter the correct name and if you leave quantity
blank it will default to 1.

**4. (your_variable).order_summary**
This will summaries your order with the cost of each item selected.

**5. (your_variable).total_cost**
This will show the total cost of your order.

**6. (your_variable).checkout**
This will send a text with a confirmation of the order!

Please note - you will need to set up a .env file with correct Twilio details
along with a number to send the text to.
```

BELOW IS A CODED EXAMPLE:-

```
[1] pry(main)> new = Order.new
=> #<Order:0x00007fb82a9573f8
 @calc=
  #<PriceCalculation:0x00007fb82a957330
   @menu=#<Menu:0x00007fb82a957308>,
   @order=#<Order:0x00007fb82a9573f8 ...>,
   @subtotal=[],
   @total_price=0>,
 @current_order=[],
 @menu=#<Menu:0x00007fb82a957358>,
 @quantity=1>

[2] pry(main)> new.read_menu
=> [{"Beef Burger"=>6.99},
 {"Veggie Burger"=>4.99},
 {"Chicken Burger"=>5.99},
 {"Thin Cut Fries"=>2.5},
 {"Thick Cut Fries"=>2.5},
 {"Onion Rings"=>1.99}]

[3] pry(main)> new.select('Beef Burger', 3)
3 X Beef Burger(s) added to order
=> [{"Beef Burger"=>3}]

[4] pry(main)> new.select('Veggie Burger')
1 X Veggie Burger(s) added to order
=> [{"Beef Burger"=>3}, {"Veggie Burger"=>1}]

[5] pry(main)> new.select('Onion Rings', 3)
3 X Onion Rings(s) added to order
=> [{"Beef Burger"=>3}, {"Veggie Burger"=>1}, {"Onion Rings"=>3}]

[6] pry(main)> new.order_summary
=> "Beef Burger X 3 = £20.97, Veggie Burger X 1 = £4.99, Onion Rings X 3 = £5.97"

[7] pry(main)> new.total_cost
=> "Total: £31.93"

[8] pry(main)> new.checkout
=> "Order Placed"
```

Below is the spec for this project
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
