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

#User Stories

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
#Features to Implement

Create fake SMS client to test full functionality
https://robots.thoughtbot.com/testing-sms-interactions

#User Interface

```
2.3.1 :001 > takeaway = Takeaway.new
 => #
2.3.1 :002 > takeaway.add_menu_items({fish: 3.99, chips: 1.99})
 => {:fish=>3.99, :chips=>1.99}
2.3.1 :003 > takeaway.view_menu
 => {:fish=>3.99, :chips=>1.99}
2.3.1 :004 > takeaway.order("fish",2)
 => "4x fish added to basket, current total: 7.98"
2.3.1 :005 > takeaway.order("chips",4)
 => "4x chips added to basket, current total: 15.940000000000001"
2.3.1 :006 > takeaway.total
 => 15.940000000000001
2.3.1 :007 > takeaway.basket
 => "2x fish (@3.99 each), 4x chips (@1.99 each), current total: 15.940000000000001"
2.3.1 :008 > takeaway.checkout
 => "Thank you! Your order was placed and will be delivered before 11:45."
2.3.1 :009 > takeaway.basket
 => "current total: 0"
```
