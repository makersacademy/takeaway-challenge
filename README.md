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

User Stories
-------

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

* Functionality to implement:
  * Have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API.
  * Twilio-ruby gem to access the API
  * Gemfile to manage your gems
  * Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

## Feature tests

### Menu
```
ᚹᚱᛘ ᛬ require './lib/menu'
=> true
ᚹᚱᛘ ᛬ menu = Menu.new
=> #<Menu:0x007f914a17c9a0
 @menu_items=
  [{:num=>1, :dish=>"Chicken Soup", :price=>3.45},
   {:num=>2, :dish=>"Spicy Hamburger", :price=>8.99},
   {:num=>3, :dish=>"Spaghetti Bolognese", :price=>7.65},
   {:num=>4, :dish=>"Spring Salad", :price=>4.55},
   {:num=>5, :dish=>"Spring Rolls", :price=>3.69},
   {:num=>6, :dish=>"Sweet and Sour Soup", :price=>3.49},
   {:num=>7, :dish=>"Chicken Sechuan", :price=>5.99},
   {:num=>8, :dish=>"Diet Coke", :price=>1.99},
   {:num=>9, :dish=>"Sparkling Water", :price=>1.12},
   {:num=>10, :dish=>"Poppy Mochi", :price=>3.99},
   {:num=>11, :dish=>"Red Beans Mochi", :price=>3.89},
   {:num=>12, :dish=>"Rice Noodles", :price=>2.99}]>
ᚹᚱᛘ ᛬ menu.display
                    The menu:
                    ---------
    Food name ------------------------- price

1. Chicken Soup                           ...£3.45
2. Spicy Hamburger                        ...£8.99
3. Spaghetti Bolognese                    ...£7.65
4. Spring Salad                           ...£4.55
5. Spring Rolls                           ...£3.69
6. Sweet and Sour Soup                    ...£3.49
7. Chicken Sechuan                        ...£5.99
8. Diet Coke                              ...£1.99
9. Sparkling Water                        ...£1.12
10. Poppy Mochi                           ...£3.99
11. Red Beans Mochi                       ...£3.89
12. Rice Noodles                          ...£2.99
```

### Order

```
ᚹᚱᛘ ᛬ require './lib/order'
=> true
ᚹᚱᛘ ᛬ order = Order.new(Menu)
=> #<Order:0x007fe875033e68
 @menu=
  #<Menu:0x007fe875033df0
   @menu_items=
    [{:num=>1, :dish=>"Chicken Soup", :price=>3.45},
     {:num=>2, :dish=>"Spicy Hamburger", :price=>8.99},
     {:num=>3, :dish=>"Spaghetti Bolognese", :price=>7.65},
     {:num=>4, :dish=>"Spring Salad", :price=>4.55},
     {:num=>5, :dish=>"Spring Rolls", :price=>3.69},
     {:num=>6, :dish=>"Sweet and Sour Soup", :price=>3.49},
     {:num=>7, :dish=>"Chicken Sechuan", :price=>5.99},
     {:num=>8, :dish=>"Diet Coke", :price=>1.99},
     {:num=>9, :dish=>"Sparkling Water", :price=>1.12},
     {:num=>10, :dish=>"Poppy Mochi", :price=>3.99},
     {:num=>11, :dish=>"Red Beans Mochi", :price=>3.89},
     {:num=>12, :dish=>"Rice Noodles", :price=>2.99}]>,
 @order_items=[],
 @order_sum=0>
ᚹᚱᛘ ᛬ order.add_to_order(1)
=> [{:num=>1, :dish=>"Chicken Soup", :price=>3.45}]
ᚹᚱᛘ ᛬ order.add_to_order(2)
=> [{:num=>1, :dish=>"Chicken Soup", :price=>3.45}, {:num=>2, :dish=>"Spicy Hamburger", :price=>8.99}]
ᚹᚱᛘ ᛬ order.order_sum
=> 12.44
ᚹᚱᛘ ᛬ order.is_correct_amount?(12.44)
=> true
```

Build:
[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
