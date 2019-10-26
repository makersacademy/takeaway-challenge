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

My Comments
* My code is only partially complete, I have completed the first 3 user stories but have not implemented the Twilio API
* Process:
  1. Feature testing in IRB
  2. Creation of relevant unit test
  3. Write / fix production code
  4. Refactor if applicable
* I have used a Makers alumni repo as reference
  * https://github.com/chrisjgilbert/takeaway-challenge

```
2.5.0 :001 > require './lib/menu.rb'
 => true
2.5.0 :002 > require './lib/order.rb'
 => true
2.5.0 :003 > menu = Menu.new
 => #<Menu:0x00007ffd351030a8 @menu_list={"cheeseburger"=>10, "hamburger"=>15, "baconburger"=>8.5, "chickenburger"=>12.5}>
2.5.0 :004 > order = Order.new
 => #<Order:0x00007ffd35007140 @menu=#<Menu:0x00007ffd35007118 @menu_list={"cheeseburger"=>10, "hamburger"=>15, "baconburger"=>8.5, "chickenburger"=>12.5}>, @basket=[], @price_store=[]>
2.5.0 :005 > menu.display_menu
 => {"cheeseburger"=>10, "hamburger"=>15, "baconburger"=>8.5, "chickenburger"=>12.5}
2.5.0 :006 > order.add_dish('cheeseburger')
 => {"cheeseburger"=>10, "hamburger"=>15, "baconburger"=>8.5, "chickenburger"=>12.5}
2.5.0 :007 > order.add_dish('chickenburger')
 => {"cheeseburger"=>10, "hamburger"=>15, "baconburger"=>8.5, "chickenburger"=>12.5}
2.5.0 :008 > order.show_basket
"Basket items: "
"Item: cheeseburger price: 10"
"Item: chickenburger price: 12.5"
"Total: 22.5"
 => "Total: 22.5"
```
