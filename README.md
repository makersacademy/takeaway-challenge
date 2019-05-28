# Takeaway Challenge
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
The takeaway challenge is a 'Friday Challenge' set to try and test your knowledge of OOD, unit testing, feature testing, classes, methods, encapsulation, delegation and testing in isolation.

## Description
The program should allow a customer to see a list of dishes with prices, select some number of several available dishes, check that the total price displayed matches the sum of the dishes in the order and send an sms message (e.g. "Thank you! Your order was placed and will be delivered before 18:52") after the order is placed.

### NOTE:
"Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error" - I have interpreted this as in passing in the money the customer wants to pay with. If they pass in more than the total, the extra will be seen as a tip, if less is passed in, then an error is raised.

## Installation
You will need to install bundle.
You will also need to set the following environment variables in a twilio.env file:
```
export TWILIO_ACCOUNT_SID='<Please request the account SID or use your own from your own Twilio account>'
export TWILIO_AUTH_TOKEN='<Please request the auth token or use your own from your own Twilio account>'
export TWILIO_FROM_NUM='<Please request the Twilio number or use your own from your own Twilio account>'
export TWILIO_TO_NUM='<Your mobile number>'
```
This file will be added to the .gitignore if named correctly. This is important if you are wanting to request to commit changes to this repository.

Finally, (through your terminal) in the root folder of the project source the twilio.env file:
```
source ./twilio.env
```

## Usage
Below is an example of how to run the program in irb:
```
require './lib/customer.rb'
require 'twilio-ruby'

customer = Customer.new

customer.view_menu

customer.add_to_order("Jasmine Rice", 1)
customer.add_to_order("Egg Noodles", 2)
customer.add_to_order("Chicken Red Thai Curry", 1)
customer.add_to_order("Chicken Red Thai Curry", 1)

customer.place_order(21.50)
```

Below shows the actual program in irb when the above code is run:
```
2.5.0 :001 > require './lib/customer.rb'
 => true
2.5.0 :002 > require 'twilio-ruby'
 => false

2.5.0 :004 > customer = Customer.new
 => #<Customer:0x00007ff46c0c0b58 @order=#<Order:0x00007ff46c0c0b30 @menu=[{:dish=>"Jasmine Rice", :price=>2.5}, {:dish=>"Coconut Rice", :price=>3.5}, {:dish=>"Egg Noodles", :price=>4.75}, {:dish=>"Egg Fried Rice", :price=>3.5}, {:dish=>"Chicken Red Thai Curry", :price=>4.75}, {:dish=>"Pork Green Thai Curry", :price=>5.75}, {:dish=>"Stir-fry Duck with Ginger", :price=>5.75}, {:dish=>"Stir-fry Beef with Mushroom", :price=>5.75}, {:dish=>"Stir-fry Squid with Veg", price=>5.75}, {:dish=>"Mixed Seafood", :price=>4.75}, {:dish=>"Spring Rolls (6)", :price=>3.5}], @basket=[], @total=0, @message=#Message:0x00007ff46c0c0a68 @client=<Twilio::REST::Client @account_sid=AC72b2b15384cf40c738940bb37f058133>>>>
 
2.5.0 :006 > customer.view_menu
1. Jasmine Rice: £2.50
2. Coconut Rice: £3.50
3. Egg Noodles: £4.75
4. Egg Fried Rice: £3.50
5. Chicken Red Thai Curry: £4.75
6. Pork Green Thai Curry: £5.75
7. Stir-fry Duck with Ginger: £5.75
8. Stir-fry Beef with Mushroom: £5.75
9. Stir-fry Squid with Veg: £5.75
10. Mixed Seafood: £4.75
11. Spring Rolls (6): £3.50
 => [{:dish=>"Jasmine Rice", :price=>2.5}, {:dish=>"Coconut Rice", :price=>3.5}, {:dish=>"Egg Noodles", :price=>4.75}, {:dish=>"Egg Fried Rice", :price=>3.5}, {:dish=>"Chicken Red Thai Curry", :price=>4.75}, {:dish=>"Pork Green Thai Curry", :price=>5.75}, {:dish=>"Stir-fry Duck with Ginger", :price=>5.75}, {:dish=>"Stir-fry Beef with Mushroom", :price=>5.75}, {:dish=>"Stir-fry Squid with Veg", :price=>5.75}, {:dish=>"Mixed Seafood", :price=>4.75}, {:dish=>"Spring Rolls (6)",:price=>3.5}]

2.5.0 :008 > customer.add_to_order("Jasmine Rice", 1)
 => [{:dish=>"Jasmine Rice", :price=>2.5, :quantity=>1}]
2.5.0 :009 > customer.add_to_order("Egg Noodles", 2)
 => [{:dish=>"Jasmine Rice", :price=>2.5, :quantity=>1}, {:dish=>"Egg Noodles", :price=>4.75, :quantity=>2}]
2.5.0 :010 > customer.add_to_order("Chicken Red Thai Curry", 1)
 => [{:dish=>"Jasmine Rice", :price=>2.5, :quantity=>1}, {:dish=>"Egg Noodles", :price=>4.75, :quantity=>2}, {:dish=>"Chicken Red Thai Curry", :price=>4.75, :quantity=>1}]
2.5.0 :011 > customer.add_to_order("Chicken Red Thai Curry", 1)
 => 2

2.5.0 :013 > customer.place_order(21.50)
 => 21.5
```

## Roadmap
A future release may include the functionality of being able to place an order via sms message.

## Authors and acknowledgment
Thanks to Makers Academy for setting this challenge.

## License
Please ask permission from the owner of this repo.

## Project status
This project is complete in terms of the required functionality. However, I have not been able to hit 100% test coverage due to including the environment variables. I am looking to continue researching this area and implementing what I find into this project in the near future.
