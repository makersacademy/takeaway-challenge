Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |~MEL'S~|   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instructions
-------

* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
|Objects|Messages|
|----------|-----------|
|Customer|see_menu|
|Menu|list of dishes with prices|
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
|Objects|Messages|
|----------|-----------|
|Customer|select dish & quantity|
|Menu||
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
|Objects|Messages|
|----------|-----------|
|Customer|total|
|Menu||
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
```
|Objects|Messages|
|----------|-----------|
|Customer|place order with phone number|
|Menu||
```

The Result
----------

Start a new order
```shell
2.6.5 :001 > require './lib/order.rb'
 => true
2.6.5 :002 > order = Order.new
 => #<Order:0x00007ff74b10abb8 @menu=#<Menu:0x00007ff74b10aac8 @menu={"Burger"=>5, "Fries"=>3, "Drink"=>2}>, @selected_items=[]>
```
See the menu
```shell
2.6.5 :003 > order.see_menu
----------MENU----------
Item: Burger, Price: £5
Item: Fries, Price: £3
Item: Drink, Price: £2
------------------------
 => nil
```
Select dishes & quantity. Will return an error if dish is spelt incorrectly or item is not on menu.
```shell
2.6.5 :004 > order.select("Burger", 2)
 => 2
2.6.5 :005 > order.select("Fries", 2)
 => 2
2.6.5 :006 > order.select("drink", 2)
RuntimeError (Error - dont think we have that. Have you checked your spelling?)
```
View your selections
```shell
2.6.5 :007 > order.selected_items
 => ["Burger", "Burger", "Fries", "Fries"]
```
Check your total
```shell
2.6.5 :008 > order.total
 => 16
```
