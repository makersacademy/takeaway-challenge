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
What is Takeaway Challenge?
------
Write a Takeaway program with the following user stories:
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

Installation Instructions
------

Run 'bundle' in the project directory
The .env file in contained in Twilio account with these details:
```
TWILIO_ACCOUNT_SID="default"
TWILIO_AUTH_TOKEN="default"
TWILIO_FROM_PHONE_NUMBER="+441234567890"
TWILIO_TO_PHONE_NUMBER="+441234567890"
```
Sign up for an account at https://www.twilio.com/try-twilio

Clone the git repo in your chosen directory
```
git clone https://github.com/GeekG1rl/takeaway-challenge.git
```

```
$ irb
2.2.3 :001 > require './lib/menu'
 => true
2.2.3 :002 > menu = Menu.new
 => #<Menu:0x007fc9b1940a48 @items={:burger=>6.5, :chips=>3.5, :wings=>5.2, :curry=>6.7, :pizza=>7.5}>
2.2.3 :003 > menu.view_menu
 => {:burger=>6.5, :chips=>3.5, :wings=>5.2, :curry=>6.7, :pizza=>7.5}
2.2.3 :004 > require './lib/order'
 => true
2.2.3 :005 > ord = Order.new
 => #<Order:0x007fc9b19b9d80 @menu=#<Menu:0x007fc9b19b9d30 @items={:burger=>6.5, :chips=>3.5, :wings=>5.2, :curry=>6.7, :pizza=>7.5}>, @list_of_items=[], @total_price=0.0, @message=#<Message:0x007fc9b19b9ba0 @client=<Twilio::REST::Client @account_sid=AC365fcadafa620d59936ae1f2e0d49621>>>
2.2.3 :006 > ord.add_item(:chips, 3)
 => 10.5
2.2.3 :007 > ord.add_item(:pizza, 1)
 => 18.0
2.2.3 :008 > ord.submit_order(18)
 => "Thank you! Your order was placed and will be delivered at 23:23 for £18. \n \n Thanks for your order!"
2.2.3 :009 >
```

Technologies Used
-------
* Ruby 2.3.0 
* Rspec 3.3.2
* twilio-ruby gem
* dotenv-rails gem 

Approach and Refactoring
------
* Made three classes: Menu, Order, Message


Author
------
Mara Wanot
