Takeaway Project
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

Approach
-------

* I followed the BDD and TDD cycles to implement the user stories provided below, first creating the core functionality, and then adding text messaging capability via the Twilio API and twilio-ruby gem.

* The primary challenge I encountered was that my initial implementation broke the single responsibility principle. On realising this I broke functionality out into a greater number of classes in order to better structure the programme.

* Although time-consuming, this process highlighted the need for a rigorous test suite, as my tests enabled me to monitor the effects of the changes I made as I made them, which enabled me to fix any issues that arose in a well structured manner.

Instructions for running the programme
------

Run ```bundle install``` to install dependencies. 

```
[1] pry(main)> require './lib/order.rb'
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x00007f8eb3be8ea0 @menu={:tofu=>5.99, :quorn=>7.99, :tempeh=>6.49, :seitan=>8.99}, @basket={}>
[3] pry(main)> order.add("tofu", 2)
=> "2 x tofu = £11.98"
[4] pry(main)> order.add("tempeh", 1)
=> "1 x tempeh = £6.49"
[5] pry(main)> order.basket_summary
=> "2 x tofu = £11.98, 1 x tempeh = £6.49"
[6] pry(main)> order.total
=> "£18.47"
[7] pry(main)> checkout = order.checkout
=> #<Checkout:0x00007f8eb3dce5a8 @order_total=18.47, @sms_service=TwilioSendSMS>
[8] pry(main)> checkout.pay(18.47, "customer_phone_number")
=> "Thank you. Your order has been placed. You will receive confirmation by text message"
```

______

User stories
======

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
