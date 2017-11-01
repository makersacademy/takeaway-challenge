Takeaway Challenge
==================

This program can be used in two ways, either in a [REPL](#repl) or using [text messages](#text-messages). First, clone the repo and run 'bundle' to install all required gems. This program is comprised of three classes:

- Takeaway: This holds the menu and handles receiving and confirmation of the order
- Billing: This handles the calculation of the order's total
- Text: This handles the sending of text messages 

<a name="repl">Using a REPL</a>
-------
When you're in the project directory, run your REPL and require takeaway.rb and create and instance of it

``` 
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> takeaway = Takeaway.new
=> #<Takeaway:0x007f8366a515b8
 @billing=#<Billing:0x007f8366a51568>,
 @menu=
  [{:name=>"Bolognese", :price=>6},
   {:name=>"Pizza", :price=>8},
   {:name=>"Chips", :price=>2},
   {:name=>"Chicken", :price=>3},
   {:name=>"Hamburger", :price=>4},
   {:name=>"Donner Wrap", :price=>6},
   {:name=>"Nuggets", :price=>3},
   {:name=>"Mozzarella Sticks", :price=>5},
   {:name=>"Deep-fried Mars Bar", :price=>1},
   {:name=>"Fish", :price=>5}],
 @order=[{:total=>0}],
 @text=#<Text:0x007f8366a51590>>
```
We can see a menu with some food items and their prices.
The `parse_order` method of the `Takeaway` class takes a string in the format `(quantity foodname, quantity foodname, quantity foodname)` and creates an array with the selected items, their quantities and the total price, which is accessible through `@order`.

For example if we pass in
```
[3] pry(main)> takeaway.parse_order('2 nuggets, 4 chicken, 3 chips')
```
We can access our current items as such
```
[4] pry(main)> takeaway.order
=> [{:total=>24},
 {:name=>"Nuggets", :price=>3, :quantity=>2},
 {:name=>"Chicken", :price=>3, :quantity=>4},
 {:name=>"Chips", :price=>2, :quantity=>3}]
```
<a name="text-messages">Using text messages</a>
-------
