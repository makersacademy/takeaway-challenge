# Takeaway Challenge
#### (Forked from [makersacademy/takeaway-challenge](https://github.com/makersacademy/takeaway-challenge))

## A system modeling the functionality of a takeaway restaurant.
- User is able to print the restaurante menu
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
=> {:"1"=>{:Mozzarela=>"$4"},
 :"2"=>{:Mushrooms=>"$6"},
 :"3"=>{:Ham=>"$5"},
 :"4"=>{:Rocket=>"$8"},
 :"5"=>{:Calabresa=>"$7"}}
[4] pry(main)> order.add_to_order(3)
=> [{:Ham=>"$5"}]
[5] pry(main)> order.add_to_order(4)
=> [{:Ham=>"$5"}, {:Rocket=>"$8"}]
[6] pry(main)> order.add_to_order(1)
=> [{:Ham=>"$5"}, {:Rocket=>"$8"}, {:Mozzarela=>"$4"}]
[7] pry(main)> order.view_order
Your Order:
1. Ham, $5
2. Rocket, $8
3. Mozzarela, $4
Total: $17
=> nil
[8] pry(main)> order.confirm_total(15)
RuntimeError: Sum is not equal to total amount.
from /Users/Fasolin/Projects/takeaway-challenge/lib/order.rb:36:in `confirm_total'
[9] pry(main)> order.confirm_total(17)
=> "Amount is correct."
[10] pry(main)> order
=> #<Order:0x007fdbe9a05268
 @menu=
  #<Menu:0x007fdbe9a05240
   @pizzas=
    {:"1"=>{:Mozzarela=>"$4"},
     :"2"=>{:Mushrooms=>"$6"},
     :"3"=>{:Ham=>"$5"},
     :"4"=>{:Rocket=>"$8"},
     :"5"=>{:Calabresa=>"$7"}}>,
 @trolley=[{:Ham=>"$5"}, {:Rocket=>"$8"}, {:Mozzarela=>"$4"}]>
[11] pry(main)> order.trolley
=> [{:Ham=>"$5"}, {:Rocket=>"$8"}, {:Mozzarela=>"$4"}]
[12] pry(main)> order.place_order
SM6fcf5e749b2c4e1382d5ae3c050de9a8
=> []
[13] pry(main)> order.trolley
=> []
```
https://mail.google.com/mail/u/0?ui=2&ik=b508bd9c0a&attid=0.0&th=15b984d539e3e662&view=fimg&disp=thd&attbid=ANGjdJ-llY_Ql2TiQ-Jl6_sJQly7emWMr6W0l_UKUoM-GQj1joZixKC7UZvPwDi2UiZT_U2srbwthw02Jy4tkWDx9RdYZ4RjLMQHYiynn08RMHxhx_andsZbrlwG32Y&ats=2524608000000&sz=w1280-h703
