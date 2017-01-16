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
## User Stories

```
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
## Feature Tests

* Ensure you have a list of dishes with prices

#### Menu
```
[1] pry(main)> require './lib/menu'
=> true
[2] pry(main)> menu = Menu.new
=> #<Menu:0x007f9adf4c4cb8
 @menu_items=
  [{:no=>"01", :dish=>"Yase Soup", :price=>2.5},
   {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.2},
   {:no=>"03", :dish=>"Tori Mushi", :price=>3.0},
   {:no=>"04", :dish=>"Tom Yam Soup", :price=>4.5},
   {:no=>"05", :dish=>"Tori Yam Soup", :price=>3.5},
   {:no=>"06", :dish=>"Umami Soup", :price=>4.5},
   {:no=>"07", :dish=>"Beef Tatar", :price=>5.8},
   {:no=>"08", :dish=>"Moyashi Salad", :price=>3.0},
   {:no=>"09", :dish=>"Kimchi Salad", :price=>3.4},
   {:no=>"10", :dish=>"Hokkaido", :price=>6.5},
   {:no=>"11", :dish=>"Shapu Salad", :price=>4.0}]>
[3] pry(main)> menu.view
                   Yume's menu                    
                   -----------                    
  Food name ------------------------------ price  

01.Yase Soup                              ...EUR 2.5
02.Wan Tan Soup                           ...EUR 3.2
03.Tori Mushi                             ...EUR 3.0
04.Tom Yam Soup                           ...EUR 4.5
05.Tori Yam Soup                          ...EUR 3.5
06.Umami Soup                             ...EUR 4.5
07.Beef Tatar                             ...EUR 5.8
08.Moyashi Salad                          ...EUR 3.0
09.Kimchi Salad                           ...EUR 3.4
10.Hokkaido                               ...EUR 6.5
11.Shapu Salad                            ...EUR 4.0
```
* Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error

#### Order Sum
```
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> order = Order.new(Menu)
=> #<Order:0x007fdb220f8d68
 @menu=
  #<Menu:0x007fdb220f8d40
   @menu_items=
    [{:no=>"1.000000", :dish=>"Yase Soup", :price=>2.55},
     {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.25},
     {:no=>"03", :dish=>"Tori Mushi", :price=>3.05},
     {:no=>"04", :dish=>"Tom Yam Soup", :price=>4.55},
     {:no=>"05", :dish=>"Tori Yam Soup", :price=>3.55},
     {:no=>"06", :dish=>"Umami Soup", :price=>4.55},
     {:no=>"07", :dish=>"Beef Tatar", :price=>5.85},
     {:no=>"08", :dish=>"Moyashi Salad", :price=>3.05},
     {:no=>"09", :dish=>"Kimchi Salad", :price=>3.45},
     {:no=>"10", :dish=>"Hokkaido", :price=>6.55},
     {:no=>"11", :dish=>"Shapu Salad", :price=>4.05}]>,
 @order_items=[],
 @order_sum=0>
[3] pry(main)> order.add_dish(1)
=> [{:no=>"01", :dish=>"Yase Soup", :price=>2.55}]
[4] pry(main)> order.add_dish(2)
=> [{:no=>"01", :dish=>"Yase Soup", :price=>2.55},
 {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.25}]
[5] pry(main)> order.order_sum
=> "5.80" # I really wanted to have it with 2 decimals, just like in the menu...
[6] pry(main)> order.double_check("5.80")
=> true
```
### Takeaway and sending SMS

The customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
* The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
```
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> t = Takeaway.new(Order)
=> #<Takeaway:0x007fdc472a7850
 @order=
  #<Order:0x007fdc472a7800
   @menu=
    #<Menu:0x007fdc472a77b0
     @menu_items=
      [{:no=>"01", :dish=>"Yase Soup", :price=>2.55},
       {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.25},
       {:no=>"03", :dish=>"Tori Mushi", :price=>3.05},
       {:no=>"04", :dish=>"Tom Yam Soup", :price=>4.55},
       {:no=>"05", :dish=>"Tori Yam Soup", :price=>3.55},
       {:no=>"06", :dish=>"Umami Soup", :price=>4.55},
       {:no=>"07", :dish=>"Beef Tatar", :price=>5.85},
       {:no=>"08", :dish=>"Moyashi Salad", :price=>3.05},
       {:no=>"09", :dish=>"Kimchi Salad", :price=>3.45},
       {:no=>"10", :dish=>"Hokkaido", :price=>6.55},
       {:no=>"11", :dish=>"Shapu Salad", :price=>4.05}]>,
   @order_items=[],
   @order_sum=0>,
 @time=2017-01-15 22:38:56 +0100>
[3] pry(main)> t.order.add_dish(1)
=> [{:no=>"01", :dish=>"Yase Soup", :price=>2.55}]
[4] pry(main)> t.order.add_dish(2)
=> [{:no=>"01", :dish=>"Yase Soup", :price=>2.55},
 {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.25}]
[5] pry(main)> t.basket
Your order includes the following:
01. Yase Soup...EUR 2.55
02. Wan Tan Soup...EUR 3.25
=> [{:no=>"01", :dish=>"Yase Soup", :price=>2.55},
 {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.25}]
[6] pry(main)> t.order_total
=> "5.80"
[7] pry(main)> t.confirmation_text
ArgumentError: Account SID and auth token are required
```
#### Text confirmation: https://github.com/Putterhead/takeaway-challenge/blob/master/twilio_confirm.jpg

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

  Ran out of time

#### All tests passing?

6 passing
4 pending

#### Test coverage

[Coveralls] Set up the SimpleCov formatter.
[Coveralls] Using SimpleCov's default settings.

Menu
  menu
    is shows the menu of available items

Order
  #ordering
    is initialised with an empty order list
    order is initialized with the amount of EUR 0.00 for order_sum
    can read the items from the menu (PENDING: Temporarily skipped with xit)
    can add dishes from the menu to ther order (PENDING: Temporarily skipped with xit)
  order sum
    can return the total amount of the order
    double checks the final price

Takeaway
  can show basket items (PENDING: Temporarily skipped with xit)
  can display order total price
  sends a text message confirming the order (PENDING: Temporarily skipped with xit)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Order#ordering can read the items from the menu
     # Temporarily skipped with xit
     # ./spec/order_spec.rb:16

  2) Order#ordering can add dishes from the menu to ther order
     # Temporarily skipped with xit
     # ./spec/order_spec.rb:20

  3) Takeaway can show basket items
     # Temporarily skipped with xit
     # ./spec/takeaway_spec.rb:7

  4) Takeaway sends a text message confirming the order
     # Temporarily skipped with xit
     # ./spec/takeaway_spec.rb:15


Finished in 0.00518 seconds (files took 0.77897 seconds to load)
10 examples, 0 failures, 4 pending

Notes on Test Coverage
------------------

```
$ coveralls report
```

``
[![Coverage Status](https://coveralls.io/repos/github/Putterhead/airport_challenge/badge.svg?branch=master)](https://coveralls.io/github/Putterhead/airport_challenge?branch=master)`
```
