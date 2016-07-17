[![Build Status](https://travis-ci.org/arukomp/takeaway-challenge.svg?branch=master)](https://travis-ci.org/arukomp/takeaway-challenge)

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


Usage
-----

* Clone the project to your local machine
* Run `bundle` to install all the necessary gems
* create your own `.env` file with Twilio API credentials for sending a text to work
* `require` the `lib/takeaway.rb` file within a REPL of your choice

```
>> t = Takeaway.new
=> #<Takeaway:0x007f9bca89e370 @basket={}>
>> t.menu
=> {"rice"=>1.49, "pizza"=>3.79, "cheeseburger"=>0.99, "pepsi"=>0.89}
>> t.add_item "rice", 2
=> "2x rice(s) added to your basket"
>> t.add_item "pizza", 3
=> "3x pizza(s) added to your basket"
>> t.add_item "pepsi"
=> "1x pepsi(s) added to your basket"
>> t.basket_summary
=> "rice x2 = £2.98, pizza x3 = £11.37, pepsi x1 = £0.89"
>> t.total
=> "Total cost: £15.24"
>> t.checkout(16.00)
=> "Payment successful! You will receive a text message shortly to confirm the order."

```

Task
-----

* The following User Stories were implemented in this project:

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
