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

This is my repo for my week 2 weekend task for [Makers Academy](www.makersacademy.com).

I used TDD and RSpec to drive my coding.

The code attempted to answer these user stories:

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

## How to Run:
```
::: require './lib/customer.rb'
=> true
::: customer = Customer.new(123456789)
=> #<Customer:0x007fafdc487900
 @order=#<Order:0x007fafdc4878d8 @ordered_items=[]>,
 @phone_number=123456789>
::: customer.view_menu
=> "Chips £1.50\nBattered sausage £2.20\nPastie supper £4.29\nChicken goujons £2.59\nFish supper £4.80\n"
::: customer.place_order({"Chips": 2}, 3)
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/TWILIO_ACCOUNT_SID/Messages/TWILIO_AUTH_TOKEN>
```

To find out which environment variables you need to run this visit `.env_sample`.
