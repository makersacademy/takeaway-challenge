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
This program was designed to operate a takeaway restaurant.

## Setting up the environment
* Clone this repository into to your local computer.
* Run `$ gem install bundle` (if you don't have bundle already)

## User stories
The program implements the following user stories.

```plain
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
## Features
* Create a new restaurant
`restaurant = Restaurant.new`
* Create a dish in the restaurant menu - give it a name and price `restaurant.create_dish("chicken", 10)`
* See the menu `restaurant.display_menu`
* Make an order by specifying dishes and their number, and also the total number of dishes `justine_order = restaurant.create_order([{name: "chicken", amount: 2}, {name: "beef", amount: 4}] 6)`.
* You can add to the order list only these dishes, which are available in the Restaurant - if the user tries to add a dish that is not available in the restaurant, this dish will be not added to the order.
* In order to see the order, type 'justine.order_info'.
* In order to send the order, type 'justine.send_order'
  * If the number of dishes matches given by the customer matches the total number of dishes in the order list, the order will be dispatched and the customer will be notified by sms. Otherwise, an error will be raised.
  * In order to send message, set the variables in the message.rb file (ACCOUNT_SID, AUTH_TOKEN)

## Example of use
```plain
2.5.0 :001 > require './lib/restaurant.rb'
 => true
2.5.0 :002 > restaurant = Restaurant.new
 => #<Restaurant:0x00007feb1a4a7c18 @menu=[]>
2.5.0 :003 > restaurant.create_dish("chicken", 10)
 => [#<Dish:0x00007feb196fa688 @details={:name=>"chicken", :price=>10}>]
2.5.0 :004 > restaurant.create_dish("beef", 30)
 => [#<Dish:0x00007feb196fa688 @details={:name=>"chicken", :price=>10}>, #<Dish:0x00007feb196f5e80 @details={:name=>"beef", :price=>30}>]
2.5.0 :005 > restaurant.display_menu
- chicken | 10 pounds
- beef | 30 pounds
 => [#<Dish:0x00007feb196fa688 @details={:name=>"chicken", :price=>10}>, #<Dish:0x00007feb196f5e80 @details={:name=>"beef", :price=>30}>]
2.5.0 :006 > justine = restaurant.create_order([{name: "chicken", amount: 6}, {name:"beef", amount: 3}], 9)
Final price: 150
Final number of dishes 9
 => #<Order:0x00007feb196d0360 @list_of_items=[{:name=>"chicken", :price=>10, :amount=>6}, {:name=>"beef", :price=>30, :amount=>3}], @total_number=9>
2.5.0 :007 > justine.send_order
 => #<Message:0x00007feb196a9aa8>
2.5.0 :008 >
```
