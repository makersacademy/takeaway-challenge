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

This programme allows a user to oder take-aways from their local resturant 

## User Stories##

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

## Tech Used ##
- Ruby
- RSpec
- Twilio API
- Rubocop
- Simplecov

## Testing ##

- Navigate to the top level of the directory
- run `rspec` in your command line

## Getting Started ##

- Fork this repo, and clone to your local machine.
- Change into the directory `cd takeaway-challenge`
- Run the command  `gem install bundle` (if you don't have bundle already)
- When the installation completes, run `bundle`

## Usage ##

- The text sending functionality is implemented using Twilio API.
- If the Takeaway is loaded into IRB and the order is placed, the text will be sent
- Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.
- Twilio function not updated to Github due to privacy reasons 


- This program is run on ruby within a REPL such as irb or pry. 

Example
``` 
$ irb
2.6.5 :001 > require './lib/order.rb'
=> true 
2.6.5 :003 > order = Order.new
 => #<Order:0x00007f97eeb64e90 @basket={}, @menu=#<Menu:0x00007f97eeb64e68 @items={"margarita"=>5, "garlic bread"=>3}>> 
2.6.5 :005 > order.add_item("margarita", 6)
 => "You have added 6 margaritas into your basket" 
2.6.5 :006 > order.add_item("garlic bread", 3)
 => "You have added 3 garlic breads into your basket" 
2.6.5 :007 > order.basket_summary
 => "margarita x £6 = £30, garlic bread x £3 = £9" 
2.6.5 :008 > order.total_order
 => "£39" 
2.6.5 :009 > order.order_confirmation
Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 03:29 PM 
```

## Progress Status ##
  - Project is complete
  - Could further develop by:\
                         - implementing the ability to place orders via text-message\
                         - inclduing a front-end interface
                         - Ensure ENV variables are functioning therfore can upload twilio functionality



