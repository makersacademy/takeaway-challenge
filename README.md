Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  G.C. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

God of Cookery Takeaway
-------

Welcome to the God of Cookery takeaway delivery service.
Here out dishes our literally out of this world! Please choose from our selection, and delivery will be guaranteed within an hour!

![alt text](https://4.bp.blogspot.com/-UVhePCqqVZo/WZIgqOFLM-I/AAAAAAAAGZw/wenU2xUUoH0laKXbBX3ZUbg_zYjLhRjjACLcBGAs/s1600/51cmBnLpQ6L._SY445_.jpg)


God of Cookery is a film directed and acted by Stephan Chow in 1996. It is about a corrupt chef who goes on a journey of self discovery. All dishes you see are ones that exist in the film and are very expensive!

Instructions
-----
This application is able to mimic the basic operations of a food delivery service.

* Provides an option of functions
* Show the takeaway menu
* Allow dishes to be chosen with quantities
* Shows chosen items with price total
* Confirms order and sends your phone a text message

```Ruby
2.4.0 :001 > require './docs/menu.rb'
 => true
2.4.0 :002 > require './docs/takeaway.rb'
 => true
2.4.0 :003 > require './docs/phone.rb'
 => true
2.4.0 :004 >
2.4.0 :005 >   takeaway = Takeaway.new
 => #<Takeaway:0x007fd6fc15fec0 @menu=#<Menu:0x007fd6fc13feb8 @items={"1. King's Fired Rice"=>88, "2. Secret Roast Goose"=>322, "3. Sorrowful Rice"=>696, "4. Buddha Jumping Wall"=>122, "5. Beef Balls"=>155, "6. Pissing Shrimp"=>162, "7. Pissing Beef Balls"=>299}>, @basket=[], @tally=0>
2.4.0 :006 >
2.4.0 :007 >   takeaway.header
Welcome to the God of Cookery Takeaway!
show_menu
choose_dish(dish number, quantity)
show_basket
checkout(account_sid, auth_token, phone_number)
 => nil
2.4.0 :008 >
2.4.0 :009 >   takeaway.choose_dish(3, 2)
 => 2
2.4.0 :010 > takeaway.choose_dish(5, 3)
 => 3
2.4.0 :011 > takeaway.choose_dish(6, 4)
 => 4
2.4.0 :012 >
2.4.0 :013 >   takeaway.show_basket
3. Sorrowful Rice x 2
5. Beef Balls x 3
6. Pissing Shrimp x 4
Total £1926

2.4.0 :014 > takeaway.checkout(account_sid, auth_token, phone_number)
```
Note that the checkout contains parameters that require inputs of authorization from a [Twilio](https://www.twilio.com/) account.

[Blog post ](https://thep-log.blogspot.co.uk/2017/08/makers-week-two-god-of-cookery-takeaway.html)talking about this project.
