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

How to Use
-------

* Clone this repo to your local machine

* In Pry or IRB, require takeaway.IRB

* Create a new Takeaway object with arguments Order and SMS

* Use the method #print_menu to display

* Use the #add_to_basket method with string and fixnum arguments

* Use the #print_basket method to display everything in your basket

* Use the #checkout with the argument equal to the total

 * And that will send a confirmation text to (my) phone!

```
 2.3.1 :001 > require_relative 'lib/takeaway.rb'
  => true
 2.3.1 :002 > take = Takeaway.new(Order, SMS)
  => #<Takeaway:0x007fa8e098a338 @order=#<Order:0x007fa8e098a310 @basket={}, @sms=SMS>>
  2.3.1 :003 > take.print_menu
  	 Item 		 Price
  	 pizza 		 10
  	 ice_cream 		 5.55
  	 garlic_bread 		 2.99
   2.3.1 :004 > take.add_to_basket("pizza", 2)
    => 2
  2.3.1 :005 > take.print_basket
  Your basket contains:
  2x pizzas costing £20

  	Total : £20
  2.3.1 :006 > take.checkout(20)
   => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC897f510f4d323f75fa515d37af48e0a8/Messages/SM7e1c25fdb9d741d49ab7efc6498600c3>

  ```

  Set Up
  --------

  * create a ```.env``` file and fill in the following fields
  ```
  TWILIO_ACCOUNT_SID = "<account sid>"
    TWILIO_AUTH_TOKEN = "<auth token>"

    MY_TWILIO_NUMBER = "<your twilio number>"
    MY_PHONE_NUMBER = "<your phone number>"
  ```


[![Build Status](https://travis-ci.org/GeorgeSeeger/takeaway-challenge.svg?branch=master)](https://travis-ci.org/GeorgeSeeger/takeaway-challenge)
