Takaway Challange
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

Week 2 weekend challenge to create an application which will allow to order a food from takeaway menu and send confirmation of the order to customer by SMS.

Features
--------
* see list of dishes with prices
* place the order by giving the list of dishes,quantities and total
* verify the order by compairing total and sum of costs of dishes
* send SMS-confirmation about placed order with expected delivery time
* using Twilio api to implement SMS notification

Technologies & Principles
-------------------------

* Ruby
* Ruby gems
* OOD, TDD, SOLID
* Testing with RSpec
* Twilio api

Expample of using the System
-----------------------------

```sh
> menu = Menu.new
 => #<Menu:0x007fa2f196e3a8 @menu_list={}>
> dish1 = Dish.new("pizza", 2.34)
=> #<Dish:0x007fa2f1957888 @name="pizza", @price=2.34>
> dish2 = Dish.new("pasta",3.45)
=> #<Dish:0x007fa2f194d400 @name="pasta", @price=3.45>
> menu.add_dish(dish1)
 => 2.34
> menu.add_dish(dish2)
 => 3.45
> menu.see_menu
 => {"pizza"=>2.34, "pasta"=>3.45}
> takeaway = Takeaway.new(menu)
 => #<Takeaway:0x007fa2f1926eb8 @menu=#<Menu:0x007fa2f196e3a8 @menu_list={"pizza"=>2.34, "pasta"=>3.45}>, @basket={}>
> takeaway.see_menu
 => {"pizza"=>2.34, "pasta"=>3.45}
> takeaway.order("pizza")
 => "1x pizza(s) added to your basket."
> takeaway.order("pizza",3)
 => "3x pizza(s) added to your basket."
 > takeaway.basket
 => {"pizza"=>4}
 > takeaway.basket_summary
 => "pizza x4 = £9.36"
> takeaway.order("pasta",13)
 => "13x pasta(s) added to your basket."
> takeaway.basket_summary
 => "pizza x4 = £9.36, pasta x13 = £44.85"
> takeaway.total
 => "Total: £54.21"
> takeaway.complete_order(54.21)
 => "Thank you! Your order with total priceof £54.21 is confirmed and will be delivered to you before 09:15!"
```

Implementation
-----------------
Code if not finished yet.

Main functionality implemented:

* create menu, add/remove dishes from menu
* create takeaway, order dishes through takeaway, correct order, see your order summary, see total of the order, complete order, message sending to customer
* create customer

What need's to be improved:

* take off big part of functionality from takeaway and put to order class
* connect customer and takeaway
* before sending message - verify order with total



