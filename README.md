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
```
2.3.1 :001 > require_relative 'lib/takeaway.rb'
 => true
 ```
* Create a new Takeaway object with arguments Order and SMS
```
2.3.1 :002 > take = Takeaway.new(Order, SMS)
 => #<Takeaway:0x007fa8e098a338 @order=#<Order:0x007fa8e098a310 @basket={}, @sms=SMS>>
```
* Use the method #print_menu to display
```
2.3.1 :003 > take.print_menu
	 Item 		 Price
	 pizza 		 10
	 ice_cream 		 5.55
	 garlic_bread 		 2.99
```
* Use the #add_to_basket method with string and fixnum arguments
```
2.3.1 :004 > take.add_to_basket("pizza", 2)
 => 2
```
* Use the #print_basket method to display everything in your basket
```
2.3.1 :005 > take.print_basket
Your basket contains:
2x pizzas costing £20

	Total : £20
```
* Use the #checkout with the argument equal to the total
```
2.3.1 :006 > take.checkout(20)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC897f510f4d323f75fa515d37af48e0a8/Messages/SM7e1c25fdb9d741d49ab7efc6498600c3>
 ```
 * And that will send a confirmation text to (my) phone!

[![Build Status](https://travis-ci.org/GeorgeSeeger/takeaway-challenge.svg?branch=master)](https://travis-ci.org/GeorgeSeeger/takeaway-challenge)
