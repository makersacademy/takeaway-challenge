Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | KEVIN |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'
 
 ```

What is Takeaway Challenge?
-------
* Takeaway Challenge is a weekend challenge from my second week at Makers
  Academy.
* The project is to simulate a takeaway where customers can
  * view menu items and prices
  * add items with quantities to their order
  * place their order with the order total
  * if total is correct they will receive a text message confirming they'll
    receive their order within 30 minutes.
  * if total is incorrect they will receive error
  * if dish they try to add does not exist they will receive an error



Approach Taken 
-----
I broke the initial stories into their domains. As the project progressed I
decided to have 4 classes Takeaway, Menu, Order and Sms. The customer interacts
through the takeaway class.

Technologies Used
--------
* Ruby 2.3.0 to write program
* Rspec 3.3.2 for unit testing
* 'twilio-ruby' gem for Sms integration
* 'dotenv-rails' gem for hiding phone numbers and Twilio account details


Installation Instructions
-----------
*Clone the git repo in your chosen directory

```
git clone https://github.com/kevinpmcc/takeaway-challenge.git 
```

*Run the command 'bundle' in the project directory to ensure you have all the
 right gems

*In order to use the SMS functionality you will need to have a Twilio account
and include all relevant ENV details in a .dotenv file in the project
directory. Twilio sign-up is free and painless and can be done here
https://www.twilio.com/try-twilio

*To interact with the program launch irb or pry and require the
'./lib/takeaway.rb' file. Example is shown below


```
[1] pry(main)> require './lib/takeaway.rb'
=> true
[2] pry(main)> t = Takeaway.new
=> #<Takeaway:0x007ffe438f2e80
 @order=#<Order:0x007ffe438f2e58 @current_order={},
@menu=#<Menu:0x007ffe438f2e30>, @menu_class=Menu, @sms_class=Sms>,
 @order_class=Order>
[3] pry(main)> t.see_dishes
=> {"burger"=>7, "fish"=>8, "smoothie"=>4, "eggs"=>3}
[4] pry(main)> t.add_to_order("fish", 2)
=> 2
[5] pry(main)> t.add_to_order("eggs", 4)
=> 4
[6] pry(main)> t.order_total
=> 28
[7] pry(main)> t.confirm_order_total(28)

```


Build Badge 
------------------

[![Build Status](https://travis-ci.org/kevinpmcc/takeaway-challenge.svg?branch=master)](https://travis-ci.org/kevinpmcc/takeaway-challenge)

Author
-------------------
Kevin McCarthy
kevinpatrickmccarthy@gmail.com
