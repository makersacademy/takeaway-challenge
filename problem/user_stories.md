## User stories and object model

#### Story 1
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

Object | Messages
------------------------------- | ---------------------------------------
Menu | view_dishes
Dish | view


**Feature test**

takeaway-challenge git:(master) ✗ irb -r ./lib/menu.rb
```ruby
2.5.0 :001 > m = Menu.new
 => #<Menu:0x00007fb6d5848148 @dishes=[]> 
2.5.0 :002 > m.add_dish("burger", 10)
 => [#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>] 
2.5.0 :003 > m.add_dish("chips", 5)
 => [#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>, #<Dish:0x00007fb6d49506e0 @name="chips", @price=5>] 
2.5.0 :004 > m
 => #<Menu:0x00007fb6d5848148 @dishes=[#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>, #<Dish:0x00007fb6d49506e0 @name="chips", @price=5>]> 
2.5.0 :005 > m.view_dishes
 => [#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>, #<Dish:0x00007fb6d49506e0 @name="chips", @price=5>] 
2.5.0 :007 > m.view_dishes[0].view
 => {"burger"=>10} 
```


#### Story 2
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

Object | Messages
------------------------------- | ---------------------------------------
Menu | view_dishes
Menu | select_dish
Dish | view


**Feature test**

takeaway-challenge git:(master) ✗ irb -r ./lib/menu.rb
```ruby
2.5.0 :001 > m = Menu.new
 => #<Menu:0x00007fabc3850400 @dishes=[], @orders=[]> 
2.5.0 :002 > m.add_dish("burger", 10)
 => [#<Dish:0x00007fabc29c35e0 @name="burger", @price=10>] 
2.5.0 :003 > m.add_dish("chips", 5)
 => [#<Dish:0x00007fabc29c35e0 @name="burger", @price=10>, #<Dish:0x00007fabc29bb340 @name="chips", @price=5>] 
2.5.0 :004 > m.select_dish(m.dishes[0])
 => #<Order:0x00007fabc29b2fb0 @selected_dishes=[{#<Dish:0x00007fabc29c35e0 @name="burger", @price=10>=>1}], @confired=false> 
2.5.0 :005 > m.select_dish(m.dishes[1])
 => #<Order:0x00007fabc29b2fb0 @selected_dishes=[{#<Dish:0x00007fabc29c35e0 @name="burger", @price=10>=>1}, {#<Dish:0x00007fabc29bb340 @name="chips", @price=5>=>1}], @confired=false> 
```


#### Story 3
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

Object | Messages
------------------------------- | ---------------------------------------
Menu | view_dishes
Menu | select_dish
Dish | view
Order | view_selected
Order | view_total


**Feature test**

takeaway-challenge git:(master) ✗ irb -r ./lib/menu.rb
```ruby
2.5.0 :001 > m = Menu.new
 => #<Menu:0x00007f8d78865120 @dishes=[], @orders=[]> 
2.5.0 :002 > m.add_dish("burger", 10)
 => [#<Dish:0x00007f8d799068d0 @name="burger", @price=10>] 
2.5.0 :003 > m.add_dish("chips", 5)
 => [#<Dish:0x00007f8d799068d0 @name="burger", @price=10>, #<Dish:0x00007f8d798fe658 @name="chips", @price=5>] 
2.5.0 :004 > m.select_dish(m.dishes[0])
 => #<Order:0x00007f8d798f62a0 @selected_dishes=[#<Dish:0x00007f8d799068d0 @name="burger", @price=10>], @confirmed=false, @total=10> 
2.5.0 :005 > m.select_dish(m.dishes[1], 2)
 => #<Order:0x00007f8d798f62a0 @selected_dishes=[#<Dish:0x00007f8d799068d0 @name="burger", @price=10>, #<Dish:0x00007f8d798fe658 @name="chips", @price=5>, #<Dish:0x00007f8d798fe658 @name="chips", @price=5>], @confirmed=false, @total=20> 
2.5.0 :006 > m.orders[0].view_total
 => 20 
```

#### Story 4
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

Object | Messages
------------------------------- | ---------------------------------------
Menu | view_dishes
Menu | select_dish
Dish | view
Order | view_selected
Order | view_total
Order | confirm_order
ConfirmedOrder | send_confirmation

**Feature test**

takeaway-challenge git:(master) ✗ irb -r ./lib/menu.rb
```ruby
2.5.0 :001 > m = Menu.new
 => #<Menu:0x00007f817c8414f8 @dishes=[], @orders=[]> 
2.5.0 :002 > m.add_dish("burger", 10)
 => [#<Dish:0x00007f817a9168a8 @name="burger", @price=10>] 
2.5.0 :003 > m.add_dish("chips", 5)
 => [#<Dish:0x00007f817a9168a8 @name="burger", @price=10>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>] 
2.5.0 :004 > m.select_dish(m.dishes[0])
 => #<Order:0x00007f817a9062a0 @selected_dishes=[#<Dish:0x00007f817a9168a8 @name="burger", @price=10>], @confirmed=false, @total=10> 
2.5.0 :005 > m.select_dish(m.dishes[1], 2)
 => #<Order:0x00007f817a9062a0 @selected_dishes=[#<Dish:0x00007f817a9168a8 @name="burger", @price=10>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>], @confirmed=false, @total=20> 
2.5.0 :006 > m.orders[0].view_total
 => 20 
2.5.0 :007 > m.orders[0].confirm_order
 => "Thank you! Your order was placed and will be delivered before 12:33" 
2.5.0 :008 > m.orders[0]
 => #<Order:0x00007f817a9062a0 @selected_dishes=[#<Dish:0x00007f817a9168a8 @name="burger", @price=10>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>], @confirmed=true, @total=20> 
```