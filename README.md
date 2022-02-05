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

My Process
==================

I went about completing this challenge by taking each user story one-by-one.
I first wrote out feature tests to test exactly what the user story wanted to achieve.
I then set out to write a single unit-test to replicate the error I received from the feature test.
Next, I wrote the smallest amount of code I could to satisfy the current error until eventually all tests were green.

When it came to user story 4, I have struggled to get the twilio-ruby gem to work and have therefore been unable to send a confirmation message and ultimately satisfy this user story. This use of 3rd party API is something I aim to become far more
familiar with in the coming week.


How to run the code
==================

The following is an example of how the code is run in IRB and how each method should be called.

Upon creating a new order with the #new_order method, a new instance of the Order class is made, assigned to '@order'.

```sh
3.0.0 :001 > takeaway = Takeaway.new
 => #<Takeaway:0x000000011d278800 @dishes=[{:pizza=>"£9"}, {:pasta=>"£7"}]>
3.0.0 :002 > takeaway.menu
 => [{:pizza=>"£9"}, {:pasta=>"£7"}]
3.0.0 :003 > takeaway.new_order
 => #<Order:0x000000011d243060 @list=[], @available_dishes=[{:pizza=>"£9"}, {:pasta=>"£7"}], @total=0>
3.0.0 :004 > takeaway.add_to_order("pizza")
 => "Pizza was added to your order"
3.0.0 :005 > takeaway.add_to_order("pasta")
 => "Pasta was added to your order"
3.0.0 :006 > takeaway.order.list
 => [{:pizza=>"£9"}, {:pasta=>"£7"}]
3.0.0 :007 > takeaway.order.total
 => "Total for order is: £16."
```

The User Stories
==================

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
