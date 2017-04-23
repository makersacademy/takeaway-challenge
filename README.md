# Takeaway Challenge
#### (Forked from [makersacademy/takeaway-challenge](https://github.com/makersacademy/takeaway-challenge))

## A program modeling the functionality of a takeaway restaurant:
- User is able to print the restaurant menu
- Dishes can be added to the order
- Current order can be viewed and its total price confirmed
- Order can be placed
- SMS is sent to user with ETA

#### Example:

```
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x007fdbe9a05268
 @menu=
  #<Menu:0x007fdbe9a05240
   @pizzas=
    {:"1"=>{:Mozzarela=>"$4"},
     :"2"=>{:Mushrooms=>"$6"},
     :"3"=>{:Ham=>"$5"},
     :"4"=>{:Rocket=>"$8"},
     :"5"=>{:Calabresa=>"$7"}}>,
 @trolley=[]>
[3] pry(main)> order.menu.print_menu
Pizza Menu
1. Mozzarela, $4
2. Mushrooms, $6
3. Ham, $5
4. Rocket, $8
5. Calabresa, $7
=> "Choose your pizzas!"
[4] pry(main)> 10.times { order.add_to_order(5) }
=> 10
[5] pry(main)> 16.times { order.add_to_order(1) }
=> 16
[6] pry(main)> 4.times { order.add_to_order(2) }
=> 4
[7] pry(main)> order.add_to_order(3)
=> "Ham pizza added."
[8] pry(main)> order.add_to_order(4)
=> "Rocket pizza added."
[9] pry(main)> order.view_order
Your Order:
Calabresa, $7..............x10
Mozzarela, $4..............x16
Mushrooms, $6...............x4
Ham, $5.....................x1
Rocket, $8..................x1
                   Total: $171
=> nil
[9] pry(main)> order.confirm_total(15)
RuntimeError: Sum is not equal to total amount.
from /Users/Fasolin/Projects/takeaway-challenge/lib/order.rb:36:in `confirm_total'
[10] pry(main)> order.confirm_total(17)
=> "Amount is correct."
[11] pry(main)> order.place_order
SM6fcf5e749b2c4e1382d5ae3c050de9a8
=> []
[12] pry(main)> order.trolley
=> []
```
![Sms example:](https://github.com/ffasolin/takeaway-challenge/blob/master/takeawaysms.jpeg?raw=true)
