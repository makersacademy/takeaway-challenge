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

Project Summary
-------
Takeaway Challenge is an app for ordering takeaway dishes from a menu. The order object has the functionality to add a dish to the basket, remove the dish from the basket, total up the full amount of the order as well as place the order itself. The menu is created upon initialization of the order using dependency injection and has a list of dishes with the option of showing the dishes.


Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
$ irb
2.5.0 :001 > require './lib/order.rb'
 => true
2.5.0 :002 > require './lib/menu.rb'
 => true
2.5.0 :003 > order = Order.new
 => #<Order:0x00007fc389972d50 @status="STARTED", @menu=#<Menu:0x00007fc389972c10 @dishes={"Tom Yum"=>9.9, "Pa
d Thai"=>10.0, "Green Curry"=>6.0, "Red Curry"=>6.0, "Aloe Drink"=>2.0, "Chocolate Ice Cream"=>4.0, "Californi
a Roll"=>12.0}>, @basket={}>
2.5.0 :004 > menu = Menu.new
 => #<Menu:0x00007fc3899624c8 @dishes={"Tom Yum"=>9.9, "Pad Thai"=>10.0, "Green Curry"=>6.0, "Red Curry"=>6.0,
 "Aloe Drink"=>2.0, "Chocolate Ice Cream"=>4.0, "California Roll"=>12.0}>
2.5.0 :005 > menu.show
Tom Yum: £9.90
Pad Thai: £10.00
Green Curry: £6.00
Red Curry: £6.00
Aloe Drink: £2.00
Chocolate Ice Cream: £4.00
California Roll: £12.00
2.5.0 :007 > order.basket
 => {"Tom Yum"=>19.8}
2.5.0 :008 > order.total
 => 19.8
2.5.0 :009 > order.place
 => "Your order has been placed"
2.5.0 :010 > exit
```
Further Improvements
---------
Twilio text ordering functionality should be added in the next version given further exploration and time.

Notes on Test Coverage
------------------

Code has been fully tested in a TDD way. All tests are green with a test coverage of 100%.
