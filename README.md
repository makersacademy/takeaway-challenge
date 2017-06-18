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
 Makers Academy weekend challenge 2. 
 
 ## Libraries ##

* ./lib
    * order.rb
    * menu.rb
    * sms.rb
    
* ./spec
    * order_spec.rb
    * menu_spec.rb
    * sms_spec.rb

## Status ##

### Completed user stories: ###

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

My main struggles with this challenge were getting the .env file to link up to libraries and stubbing out sms functionality. With more time I would write further tests to cover edge cases and increase test coverage. I have only feature tested my sms functionality fully, as I could not successfully implement unit tests with sms messaging stubbed out. I would also like to work on encapsulating my classes further.   

## How to use ##

Open irb and type the following commands: 

```sh
2.4.0 :001 > require "./lib/order.rb"
 => true
2.4.0 :002 > order = Order.new #creates a new order
2.4.0 :003 > order.read_menu #prints menu
"Welcome to Simon's Korean Restaurant!"
"Today's specials are:"
"kimchi_jjigae, £8"
"galbi, £10"
"kimbap, £4"
"bibimbap, £6"
"kimchi_jeon, £4"
2.4.0 :004 > order.add_dish("kimchi_jeon", 6) #adds dish to basket
 => "6 x kimchi_jeon(s) added to your basket."
2.4.0 :005 > order.basket_summary #gives a summary of items in basket
 => ["6x kimchi_jeon(s) = £24"]
2.4.0 :006 > order.checkout #sends confirmation sms and empties basket
"Enter 'Yes' if you would like to place your order"
Yes
```
