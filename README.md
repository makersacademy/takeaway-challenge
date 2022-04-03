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

## Task
I have been asked to write a Takeaway program that will include a menu with a list of dishes with their respective prices. People will be able to use the program to place their orders, via selecting the dishes they want and their respective quantities. The program will work out the total cost of their order and I will use Twilio in order to send text messages to let people know when their order will be ready.\
\
During testing, I will try to use stubs and doubles in order to isolate my tests.\
\
Edge cases considered:\
- Customers will not be able to order items not on the menu\
- Customers have the ability to cancel orders\

## Instructions

Clone this repository to your desired location, run the command `gem install bundler` then run `bundle`.\
\
Run RSpec in the `takeaway_challenge` directory whilst in the terminal in order to run the unit tests.\
\
Run irb and load the file `takeaway.rb` inside the `lib` directory. Create a new takeaway within irb by using `Takeaway.new`. Use the command `show_menu` in order to see the menu, alternatively, if you use the command `take_order`, after inputting your 10 digit mobile phone number it will automatically show you the menu. Follow the on-screen instructions to place your order and it will show you what you have ordered when it asks to confirm your order. Input `yes` to confirm it, it will then show you the total cost. If you forget the cost of your order after confirming it, you can use the command `cost`. You can then use the command `place_order` in order to finalise it, which will send you a text message with the time it will be delivered by. If you wish to cancel your order instead, use the command `cancel_order`. Once you have placed or cancelled the order, you will be able to start on a new order.\
\
Below is a example of using my code in irb:
```
irb(main):001:0> require './lib/takeaway'
=> true
irb(main):002:0> takeaway = Takeaway.new
=> 
#<Takeaway:0x00007fb205bf9528
...
irb(main):003:0> takeaway.take_order
Welcome to Su's takeaway
Please enter your 10 digit mobile number
1111111111
1. Fried Rice £6.00
2. Chow Mein £6.10
3. Chop Suey £6.20
4. Satay £6.30
...
Please enter the number of the dish that you wish to order (leave blank to finish)
3
You have ordered Chop Suey. How many would you like?
1
Please enter the number of the dish that you wish to order (leave blank to finish)

You have ordered:
1x Chop Suey £6.20
Please type 'yes' to confirm this order. Type anything else to continue making additions
yes
=> 6.2
irb(main):004:0> takeaway.cancel_order
Your order has been cancelled.
```

## User Stories
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

## Domain Model Diagram

| name      | takeaway        | order                    | menu               | twilio                    |
| --------  | -------------   | ---------------------    | ------------------ | ------------------------- | 
| variables |                 | @order: hash, reader     | @menu: hash, reader| @app_token: string, hidden|
| --------  | -------------   | ---------------------    | ------------------ | ------------------------- |
|           | take_order      | add_to_order(item, qty)  | show_menu          | send_message(to)          |
| methods   |                 | receipt                  |                    |                           |
|           |                 | place_order              |                    |                           |


Initial ideas regarding what classes will be needed with which instance variables and methods.

## References
``` 
https://www.ellehallal.dev/blog/2018/11/2018-11-16-testing-user-input-with-rspec/
https://www.twilio.com/docs/libraries/ruby 
```
used the above in order to stub user input\
used the above in order to implement the text message functionality

## Functionality yet to be added
Checking if each user input is given correctly (i.e, someone can order the 99th item on the menu currently, which would just give a blank, and then eventually a error).
Was going to add functionality to remove items from the order, but code ended up quite long and not very readable, so instead made function to cancel.
