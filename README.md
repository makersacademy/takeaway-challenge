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

## Client Request
The client has requested an application for ordering a takeaway. The app should be able to receive orders as well as displaying a menu. Once the order has been completed the app should contact it's customer via a text message.

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

## How to Use
Open ./lib/takeaway.rb into irb

2.5.0 :001 > takeaway = Takeaway.new
2.5.0 :002 > takeaway.begin_order
Begins a new order

2.5.0 :003 > takeaway.print_menu
 => "Menu: bread: £2.00, soup: £3.00, cheese: £1.00, spaghetti: £5.00, pizza: £4.00, lasagne: £6.00." 
 Prints the available menu

 2.5.0 :004 > takeaway.select("soup")
 selects one order of soup

 2.5.0 :005 > takeaway.select("bread", 2)
 selects two orders of bread

 2.5.0 :006 > takeaway.print_current_order
 => "bread: 2, soup: 1." 
Shows the current selected items

2.5.0 :007 > takeaway.complete_order(10)
RuntimeError (Cannot complete order: Incorrect Value)
If incorrect value is given the order will not be placed

2.5.0 :008 > takeaway.complete_order(7)
 => "Thank you, your order was placed and will be delivered before 12:08" 
 If the correct value is entered then the order is placed and a delivery time is given



## Methodology


## Changes to Implement
Twilio API functionality
Load different menu's from a csv file


## Review
I feel like I have learnt a lot about test doubles and stubs although it is something I will need to work on more in the future.
