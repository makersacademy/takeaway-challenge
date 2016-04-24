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

## Introduction

 This program simulates a takeaway ordering system that uses Twilio API to send a confirmation text.


## Features

 * List of dishes with prices
 * View menu
 * Add items from menu
 * Check total sum of dishes
 * View basket
 * Confirmation text when order confirmed


## Instructions

 Clone this repo:

 `$ git clone git@github.com:sitypop/takeaway-challenge.git`

 Change to takeaway-challenge directory, open irb and require the order.rb file:

 ```
 $ cd takeaway-challenge
 $ irb
 2.2.3 :001 > require "./lib/order.rb"
  => true
  ```

 Now we can cook up some dishes!

  ```
  2.2.3 :002 > ramen = Dish.new("Beef Ramen", 8.50)
   => #<Dish:0x007f9ead8290a8 @name="Beef Ramen", @price=8.5>
  2.2.3 :003 > gyoza = Dish.new("Duck Gyoza", 5)
   => #<Dish:0x007f9eac21f320 @name="Duck Gyoza", @price=5>
  2.2.3 :004 > squid = Dish.new("Chilli Squid", 6)
   => #<Dish:0x007f9eac1fe8c8 @name="Chilli Squid", @price=6>
   ```

 Let's add them to a menu:

 ```
 2.2.3 :005 > wagamamas = Menu.new
  => #<Menu:0x007f9eac1ed5c8 @dishes={}>
 2.2.3 :006 > wagamamas.add(ramen)
  => 8.5
 2.2.3 :007 > wagamamas.add(gyoza)
  => 5
 2.2.3 :008 > wagamamas.add(squid)
  => 6
 2.2.3 :010 > wagamamas.read
  => "Beef Ramen - £8.50\nDuck Gyoza - £5.00\nChilli Squid - £6.00\n"
  ```

 Now we can add items to our order, view basket and total!
 ```
 2.2.3 :012 > saturday_night = Order.new(wagamamas)
  => #<Order:0x007f9eac14ae68 @menu={"Beef Ramen"=>8.5, "Duck Gyoza"=>5, "Chilli Squid"=>6}, @my_order=[], @sum=0>
 2.2.3 :013 > saturday_night.add("Beef Ramen", 1)
  => "1X Beef Ramen has been added to your basket"
 2.2.3 :014 > satuday_night.add("Chilli Squid", 2)
  => "2X Chilli Squid has been added to your basket"n>'
 2.2.3 :015 > satuday_night.view_basket
  => "1X Beef Ramen - £8.50\n2X Chilli Squid - £12.00\n"
 2.2.3 :016 > satuday_night.total
  => "Your total is £20.50"
  ```

Mmm I'm hungry. Now let's checkout, and recieve a text confirmation. Woohoo.

 ```
 2.2.3 :017 > satuday_night.checkout(20.50)
  => "Order has been placed. We will text you with the delivery time"
  ```

 I have considered edge cases to ensure that you don't add anything to your order that isn't on the menu and pay the correct amount. Duh. 👆


## Testing

  In your terminal, type `$ rspec` under `takeaway-challenge` directory and it will run all the unit tests in spec files.

  There is also `feature_spec.rb` file which contains all the feature tests for user stories. To solely run these, type the following:

  `$ rspec spec/feature_spec.rb`


## Tools


  * Ruby
  * RSpec
  * Twilio API



## Author


  Sity Shah
