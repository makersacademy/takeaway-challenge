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
### How to run application

- Clone this repo (takeaway-challenge)
- Open IRB / PRY or your favourite terminal application

```
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x007fb099b61380 @order_items=[], @order_price=0>
[3] pry(main)> Menu.new
=> #<Menu:0x007fb099b21ed8
 @menu=
  {:pizza=>2.0,
   :chips=>2.0,
   :kebab=>2.0,
   :burger=>2.0,
   :sushi=>2.0,
   :fried_chicken=>2.0}>
[4] pry(main)> order.select_dish
ArgumentError: wrong number of arguments (given 0, expected 1)
from /Users/jonathanelliot/Projects/takeaway-challenge/lib/order.rb:15:in `select_dish'
[5] pry(main)> order.select_dish(:something_no_on_menu)
RuntimeError: That item is not on the menu
from /Users/jonathanelliot/Projects/takeaway-challenge/lib/order.rb:16:in `select_dish'
[6] pry(main)> order.select_dish(:pizza)
=> 2.0
[7] pry(main)> order
=> #<Order:0x007fb099b61380 @order_items=[:pizza], @order_price=2.0>
[8] pry(main)> order.select_dish(:burger)
=> 4.0
[9] pry(main)> order
=> #<Order:0x007fb099b61380 @order_items=[:pizza, :burger], @order_price=4.0>
[10] pry(main)> order.price_check
=> 4.0
[11] pry(main)> order.confirm_order
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC3b3b543d39c56bbaeadf9160caa56a74/Messages/SMda0e02e47cc846f0b3a3a453fb8c1928>
[12] pry(main)> quit
```
