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

### Issues with program

# Rspec report
```
takeaway-challenge git:(master) rspec

Menu
should respond to #menu

Order
responds to #select_dish with 1 argument
#select_dish
  raise an error if chosen food is not on menu
  adds chosen food to #order_items
#price_check
  checks if order total price is correct
#confirm_order
  send SMS to customer

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.00959 seconds (files took 0.44973 seconds to load)
6 examples, 0 failures


COVERAGE:  96.00% -- 48/50 lines in 4 files

+----------+--------------+-------+--------+---------+
| coverage | file         | lines | missed | missing |
+----------+--------------+-------+--------+---------+
|  89.47%  | lib/order.rb | 19    | 2      | 26, 32  |
+----------+--------------+-------+--------+---------+
3 file(s) with 100% coverage not shown
```

- Struggled maintaining 100% coverage after implementing twilio.API. Put all twilio code on one line which brought test coverage back up from around 90% but feels like a cheat - Rubocop didn't like it.
- I was trying to use a hash to assign food items to a cost but I wasn't able to access the cost (value) from the key by using `@menu[from_menu]` it kept throwing an error to do with `nil`. Used a constant `PRICE` in the end in order to finish the challenge.
- `#price_check` is a pretty useless method as price is returned when you look at the Order object anyway. Thought I should include it though as the user story wanted me to confirm.
