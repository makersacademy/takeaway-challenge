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


Task

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


To use the application, load 'takeaway.rb' in irb, initialize it with default arguments, and load default menu by calling .view.
This will open the menu option below
```ruby
HarudeAir:takeaway-challenge haru$ irb
2.5.0 :001 > require './lib/restaurant'
 => true
2.5.0 :002 > new_order = Restaurant.new
 => #<Restaurant:0x00007f965ee84af8 @new_menu=#<Menu:0x00007f965ee84ad0 @menu={:Burger=>8, :Fries=>4, :Milkshake=>4, :Doughnut=>2, :Cake=>4, :Chickenbreast=>9, :Olive=>2, :Cheese=>1, :Salad=>6}, @order_list={}, @order_total=0>>
 2.5.0 :003 > new_order.view
Burger, £8
 Fries, £4
 Milkshake, £4
 Doughnut, £2
 Cake, £4
 Chickenbreast, £9
 Olive, £2
 Cheese, £1
 Salad, £6
 => nil
 ```

To order from the menu, calling .start_order. This will pop up the interactive window to ask the name of the dish and the quantity you want. Enter "Done" when you finish ordering.
```ruby
2.5.0 :003 > new_order.start_order
Begin order, type 'Done' when you finish.
What do you want?
Burger
How many do you want?
1
What do you want?
Done
 => nil
 ```
 You can check and place your order by giving the total amount you ordered. This will be verified in the "backend" of the restaurant.
 However, if the amount doesn't match, an error will be raised (in the backend as we don't show system error to the clients), and a message will be displayed to the client.
```ruby
2.5.0 :005 > new_order.place_order(40)
Total price not match
 => nil
 ```

 If the amount is right, you will be sent a text message confirming the delivery time.

 ```ruby
2.5.0 :004 > new_order.place_order(8)
Thats right
<Twilio.Api.V2010.MessageInstance account_sid: AC1c6b21bd9cd4420c06a25451472174f5 sid: SM594ebcf7390c4b46b65
3bd67689edb23>
 => nil
 ```
 The text handling function has been implemented using Twilio API. To use this function the account sid, auth token, Twilio number and mobile number need to be updated.
 ```ruby
 require 'twilio-ruby'
 require 'dotenv'
 Dotenv.load("twilio.env")

 class Text

   def confirmation
     account_sid = ENV['TWILIO_ACC_SID']
     auth_token = ENV['TWILIO_AUTH_TOKEN']
     from = ENV['TWILIO_NUM']
     to = ENV['MOBILE_NUM']

     client = Twilio::REST::Client.new(account_sid, auth_token)
     client.messages.create(
       from: from,
       to: to,
       body: notice)
   end

   private

   def notice
     "Your order has been placed and is expected to arrive before #{delivery_time}"
   end

   def delivery_time
     (Time.now + 3600).strftime("%H:%M")
   end
 end
 ```
