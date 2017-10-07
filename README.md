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

My Approach
-------

I began by focussing on creating a menu and an order system that worked. My focus was   
not to create a vast menu but to create enough variety so as to properly test the class
does exactly what I wanted. I then moved on to creating the order class and developed
the functionality it needed one step at a time. Firstly adding items to a basket, then
working out the cost, displaying the order and then finally placing the order.

Incorporating Twilio into the program was tricky. Exactly how to use the service as
part of my program wasn't as obvious as I had originally thought it would be. However
once I had figured it out it worked well.

The one thing I am not happy about currently is that my test coverage is only just over
95%. Due to the information needed to make sure the Twilio functon works, I have four
lines in my code that are untested and can't logically be tested to add any value to
the program.

I intend to attempt refactoring what I have and maybe adding a small number of
improvements to how it works but this will only decrease my test coverage.

Instructions
-------

```
15:35 $ irb
2.4.2 :001 > require './lib/order.rb'
 => true
2.4.2 :002 > order = Order.new
 => #<Order:0x00007f95058b2c38 @basket=[], @menu=#<Menu:0x00007f95058b2c10 @menu_items={"pizza"=>10, "pasta"=>7, "garlic bread"=>4}>>
2.4.2 :003 > order.add('pizza')
 => 1
2.4.2 :004 > order.add('pasta', 2)
 => 2
2.4.2 :005 > puts order.display_order
3 items in your order:
pizza : £10
pasta : £7
pasta : £7
Total Cost £24
 => nil
2.4.2 :006 > puts order.place_order
3 items in your order:
pizza : £10
pasta : £7
pasta : £7
Total Cost £24
Your order will arrive at 04:43PM
 => nil
2.4.2 :007 >
```

Task
-----

* Write a Takeaway program with the following user stories:

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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.
