[![Build Status](https://travis-ci.org/ccfz/takeaway-challenge.svg?branch=master)](https://travis-ci.org/ccfz/takeaway-challenge)

# Take-away Challenge


## Approach

1. I will start with a very simple menu class, which contains a hash 'dishes' that contains the dish and their price. 
* The second user story requires the ability to create an order with dishes. I will therefore change my original approach. I will now add a dish class and inject it into menu. Menu can create new dishes, which are stored in an hash. The key is the name of the dish and the value is the dish_instance. A dish consists of its name and price. #see_dishes will return all dish's with their #name and #price. 

2. As the job of the menu is only to display dishes I will create a order class to create a new order and save the dishes. As a order class could contain any menue I will inject a menu_instnace into the order class. Therefore the menu is created outside of the order class.

 . . .A chosen dish is saved inside an array with the quantatiy and the price of the individual dish. 

3. At first I saved everything in hashes but the methods became quite complicated due to the dual structure of hashes so I refactored everything to nested array's, wich allows me to delete 3 methods. 

When a dish is added to the current order the subtotal is calculated and saved in a summary array. It consists of the dish name, the quantity and the subtotal. When calling #total the method will return a 2d array with all dishes, the subtotals and a total at the end. 

4. confirm_order simulates a payment process and takes a argument as payment. It compares the argument with the total from #total. I created a getter method for a number. It does not actually do anything the number since I am using the free twilio account. However, for the sake of completion I added it. 

Free twilio does not work with German numbers so I did some testing with a friends number, however since I did not want to stress them to much I limited the amount of real life test and rspec. I do think that #send_sms should be private so testing would be limited either way. However it is a core function of the system so I would have liked to test that a message is send. 

## How take away works

###Prep
* Initialize a Menu
* Add dishes to Menu
* Initialize a Order and inject the Menu, which you would like Order to use.

###Menu Manual
1. #create_dish - takes two arguments, name and price
2. #see_dishes - returns all dishes added so far as hash. The name is the key. Raises error if no dishes have been added.
3. #delete_dish - removes a created dish
4. #dish_price - returns a dish_price

###Order Manual
1. #see_menu - calls on menu#see_dishes
2. #place_order - takes name and quantity as argument. returns subtotal of the dish/quantity
3. #total - returns a summary of the dishes, their quantity the subtotal of each dish and the total of the order.
4. #confirm_order - takes a argument that needs to match the total. If they match a confirmation message is send.
5. #abort - deletes current order
6. #delete  - takes a argument deletes a specifc dish from the order
7. #confirmation_number - takes a number argument and sets a phone number.
8. #tw_setup & #send_sms - Twilio methods that send the confirmation message


## Sample Code
```
require_relative './lib/menu.rb'
require_relative './lib/dish.rb'
require_relative './lib/order.rb'


menu  = Menu.new(Dish)
order = Order.new(menu)
p 'Test 1 #see_dishes exp. 2'
menu.create_dish(:tuna_paste, 4)
menu.create_dish(:steak, 6)
p menu.see_dishes
puts
puts

p 'Test 2 get a list of dishes'
p order.see_menu
puts
puts

p 'Test 3 #place_order'
p order.place_order(:tuna_paste, 10)
puts
puts

p 'Test 4 place a second order and get the order summary'
order.place_order(:steak, 10)
p order.summary
puts puts

p 'Test 5 should give me the total and the summary'
p order.total
puts puts

p 'Test 6 should send a confirmation sms'
p #order.confirm_order(100)
```
