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
[![Build Status] (https://travis-ci.org/laurenrosie/takeaway-challenge.svg?branch=master)](https://travis-ci.org/laurenrosie/takeaway-challenge)[![Coverage Status](https://coveralls.io/repos/github/laurenrosie/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/laurenrosie/takeaway-challenge?branch=master)

Usage
-----
- Given an instance of the class List (which contains an array of instances of the class Dish)
- Make a new instance of the class Order
- Add list items to the order using .add(list_name, place_of_item_on_list, quantity)
- Check the order total using .total
- Read the current order using .read
- Place the order using .place(sum_of_money)
- The order will only process if the sum_of_money equals the total price of the order
- You will receive a text message confirming your order and delivery time

Example
-----

```
list = List.new
list.add(Dish.new("Soup", 3.00))
list.add(Dish.new("Salad", 4.99))
list.print

order = Order.new
order.add(list, 1, 1)         => adds the list item 1 (soup) in quantity 1 to order
order.total
order.read
order.place(3.00)
```
