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

Makers Academy Weekend Challenge - Week 2
-----------------------------------------

For this challenge, I responded to several user stories to create a model of a takeaway order service using TDD. Here are the user stories followed with explanations of how I implemented them, and how I might improve them in the future:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
- I created a Menu class, which a readable attribute of `@dishes`, which is an array containing a list of dishes
- For simplicity and to save time, I hard-coded the available dishes into the class attribute, and represented each dish as a hash which holds key-value pairs representing the name and price of the dish; if I had more time (or if there had been user stories from the perspective of restaurants wanting to update the menu), I would have probably created a Dish class (with name and price attributes) and placed these in the array instead of hashes. I would also have probably made use of a CSV file containing the dishes, so that multiple dishes could be added and removed more easily, and required a CSV file as an argument in initializing a new menu object, so that different menus could be created for different restaurants.
- I established a `#display` method within the Menu class, which iterates through the items in the `@dishes` array and prints them out as an ordered list under the heading "Menu".

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
- I created an Order class, which takes an instance of the Menu class as an argument upon initializing (defaulting to Menu.new if none is provided), and which has an `@items` attribute, which initializes as an empty array.
- I defined the `#add_item` method, which takes two arguments: dish name, and quantity. If no quantity is provided, it defaults to 1. Calling this method adds dishes from the Menu class's list of dishes (that is, a hash representing a dish) to the order's `@items` array, adding to the hash the key `:quantity`, with its value set to the quantity specified (or to 1 if no quantity is specified).
- At present, this doesn't respond to edge cases such as users trying to call this method with a dish that's not on the menu (including typos).
- Of course, for a real takeaway app, I would also want to give users the option of removing items or updating quantities through the introduction of additional methods.

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
- I added a `@total` instance variable to the Order class (initializing at 0), which can be called directly, but is also returned each time a new item is added.
- I added a `#display_details` method to the order class, which prints out an order breakdown, including quantity and name of dish, unit price and total item price, with the overall total printed at the bottom.

Unfortunately I didn't get to the last user story:
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

A brief demonstration of these features in `irb`:

``` ruby
$irb

2.6.5 :001 > require './lib/order'
 => true 
2.6.5 :002 > require './lib/menu'
 => true  
2.6.5 :003 > menu = Menu.new
 => #<Menu:0x00007f96098348b0 @dishes=[{:name=>"Hamburger", :price=>10}, {:name=>"Chips", :price=>4}, {:name=>"Orange Juice", :price=>2}]> 
2.6.5 :004 > menu.display
Menu:
-----
1. Hamburger: 10 GBP
2. Chips: 4 GBP
3. Orange Juice: 2 GBP
 => nil 
2.6.5 :005 > order = Order.new
 => #<Order:0x00007f960d151850 @items=[], @total=0, @menu=#<Menu:0x00007f960d151828 @dishes=[{:name=>"Hamburger", :price=>10}, {:name=>"Chips", :price=>4}, {:name=>"Orange Juice", :price=>2}]>, @menu_items=[{:name=>"Hamburger", :price=>10}, {:name=>"Chips", :price=>4}, {:name=>"Orange Juice", :price=>2}]> 
2.6.5 :006 > order.total
 => 0 
2.6.5 :007 > order.add_item("Hamburger")
 => 10 
2.6.5 :008 > order.add_item("Chips", 2)
 => 18 
2.6.5 :009 > order.add_item("Orange Juice", 2)
 => 22 
2.6.5 :010 > order.total
 => 22 
2.6.5 :011 > order.display_details
Order summary:
--------------
1 * Hamburger (unit price 10 GBP, total price 10 GBP)
2 * Chips (unit price 4 GBP, total price 8 GBP)
2 * Orange Juice (unit price 2 GBP, total price 4 GBP)
----------
Total: 22 => nil
2.6.5 :012 > quit
```
100.00% test coverage
