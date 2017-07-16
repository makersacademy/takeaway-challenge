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

Overview
-------

Software to control ordering at a takeaway. Customers can view a menu and place an order by listing the items with quantities and a total. The order is confirmed by text message with an estimated time of arrival.

Getting started

1. `git clone https://github.com/BDCraven/takeaway-challenge`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Usage

`irb`

Commands
* Create new takeaway with Takeaway.new

* .view_menu

* .order("dish", quantity, total dishes)

* .open_orders

See irb example below.


Running tests

`rspec`
```

```
User Stories
---------

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

```


Approach to the challenge
---------
* Considered the user stories and separated nouns into objects and verbs into messages. Compiled short diagrams to explore the interactions between the objects.

* Started with the first user story and worked down consecutively.

* For each user story, prepared feature tests to determine the wording for the unit test. Watched the test fail and then wrote code to make it pass.

* For the implementation of user story 4 the code to implement the Twilio gem was written first as it was not clear how to test a third party API using Rspec.

* Sensitive Twilio account information has been stored in environment variables. Tried to use Figaro gem to store the variables in a file but was unable to run it. Environment variables currently have to be populated manually with export

 * TWILIO_PHONE= Twilio number
 * TWILIO_ACCOUNT_SID= Twilio account
 * TWILIO_AUTH_TOKEN= Twilio token
 * TWILIO_TO= Twilio recipient


* Attempted to set up a fake API sms file which would store the messages but was unable to get the messages variable to store anything.

* Decided to test Twilio using VCR gem but ran out of time.


```

```


Issues
---------

* Insufficient stubs in RSpec means a text message is sent for multiple tests when running rspec.

* The value of the order is not calculated so bill is not returned.

* Customer is not recorded so order is not referenced to a customer.

* No ability to input customer phone number.

* No ability to mark open order as complete.

irb example  
-------
2.4.0 :003 > require './lib/takeaway.rb'
=> true

2.4.0 :004 > require './lib/menu.rb'
 => false

2.4.0 :005 > require './lib/order.rb'
 => true

2.4.0 :006 > require './lib/sms_confirmation.rb'
 => false

2.4.0 :007 > thai = Takeaway.new
 => #<Takeaway:0x007f8432a2c4d0 @menu=#<Menu:0x007f8432a2c458 @dishes={"Green Curry"=>6, "Massaman Curry"=>6, "Panang Curry"=>6, "Pad Thai"=>7, "Rice"=>2, "Pad Pak"=>3, "Singha"=>4}>, @new_order=#<Order:0x007f8432a2c430 @dishes={}>, @open_orders=[]>

2.4.0 :008 > thai.view_menu
Green Curry: £6
Massaman Curry: £6
Panang Curry: £6
Pad Thai: £7
Rice: £2
Pad Pak: £3
Singha: £4
 => {"Green Curry"=>6, "Massaman Curry"=>6, "Panang Curry"=>6, "Pad Thai"=>7, "Rice"=>2, "Pad Pak"=>3, "Singha"=>4}

2.4.0 :009 > thai.order("Green Curry", 2, 2)
Sent message to customer
 => [{"Green Curry"=>2}]

2.4.0 :010 > thai.order("Rice", 1, 2)
RuntimeError: The total of 2 does not appear to match the sum of dishes ordered.

2.4.0 :011 > thai.order("Green Curry", 2, "Rice", 2, 4)
Sent message to customer
 => [{"Green Curry"=>2}, {"Green Curry"=>2, "Rice"=>2}]

2.4.0 :013 > thai.open_orders
 => [{"Green Curry"=>2}, {"Green Curry"=>2, "Rice"=>2}]

2.4.0 :014 > thai.order("Fish", 1, "Chips", 1, 2)
RuntimeError: Sorry, we do not serve ["Fish", 1, "Chips", 1, 2]
