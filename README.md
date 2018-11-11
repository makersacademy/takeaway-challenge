```sh
2.5.0 :001 > require './lib/takeaway'
 => true 
2.5.0 :002 > shop = TakeAway.new
 => #<TakeAway:0x00007fd9b8b6b090 @menu=#<Menu:0x00007fd9b8b6b018 @items=[{:name=>"Peri Peri Chicken", :cost=>8}, {:name=>"American Hot Pizza", :cost=>7}, {:name=>"Tandori Chicken Wrap", :cost=>6}, {:name=>"Madras Curry", :cost=>8}, {:name=>"Sweet and Sour Duck", :cost=>9}, {:name=>"Beef Burrito", :cost=>6}, {:name=>"Bacon Cheeseburger", :cost=>6}, {:name=>"Katsu Curry", :cost=>8}]>, @current_order=#<Order:0x00007fd9b8b6aa50 @cost=0, @menu=#<Menu:0x00007fd9b8b6aa28 @items=[{:name=>"Peri Peri Chicken", :cost=>8}, {:name=>"American Hot Pizza", :cost=>7}, {:name=>"Tandori Chicken Wrap", :cost=>6}, {:name=>"Madras Curry", :cost=>8}, {:name=>"Sweet and Sour Duck", :cost=>9}, {:name=>"Beef Burrito", :cost=>6}, {:name=>"Bacon Cheeseburger", :cost=>6}, {:name=>"Katsu Curry", :cost=>8}]>, @basket=[]>> 
2.5.0 :003 > shop.view_menu
--------------------------
Menu
--------------------------
1: Peri Peri Chicken £8
2: American Hot Pizza £7
3: Tandori Chicken Wrap £6
4: Madras Curry £8
5: Sweet and Sour Duck £9
6: Beef Burrito £6
7: Bacon Cheeseburger £6
8: Katsu Curry £8
--------------------------
 => nil 
2.5.0 :004 > shop.add_to_order(7,2)
 => "2x Bacon Cheeseburgers added to basket" 
2.5.0 :005 > shop.empty_basket
 => "Basket emptied" 
2.5.0 :006 > shop.check_basket
Basket:
 => "Total cost of items in basket: £0" 
2.5.0 :007 > shop.add_to_order(3,1)
 => "1x Tandori Chicken Wrap added to basket" 
2.5.0 :008 > shop.check_basket
Basket:
Tandori Chicken Wrap £6
 => "Total cost of items in basket: £6" 
2.5.0 :009 > shop.submit_order
SMa1600bb538d6451f8dac1da001ea443d
 => nil 
```
