Takeaway Challenge [![Build Status](https://travis-ci.org/samover/takeaway-challenge.svg?branch=master)](https://travis-ci.org/samover/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/samover/takeaway-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/samover/takeaway-challenge?branch=master)
==================

[Task](#task)

[My approach](#my-approach)

[How to use](#how-to-use)

Task
----
The challenge is to build a Takeaway app that allows the customer to see a menu (dishes + price) from which she can order a number of items. The customer needs to be able to check the order (price of the dishes + total to pay). The customer will receive a text message indicating the time of delivery. These are the user stories to implement:

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

My approach
-----------
Playing around in IRB and using pen and paper, I got a good sense of how the app would be shaped and which objects and messages it would need to contain. From this emerged the **Domain Model**. Rigidly sticking to the **Red/Green/Refactor cycle**, one class emerged with accompanying tests. I then refactored the production code, extracting methods to other classes. After making all tests for the new classes pass (stubbing dependencies according to the **London School**), feature tests helped me integrate the dependencies and to test the functionality of the whole app.

The principles and patterns of design that I drew upon are mainly DRY (*Don't Repeat Yourself*), SRP (*Single Responsibility Principle*) and derived from that DI (*Dependency Injection*). These principles led me to have four classes:
1. [Takeaway](https://github.com/samover/takeaway-challenge/blob/master/lib/takeaway.rb)
2. [Order](https://github.com/samover/takeaway-challenge/blob/master/lib/order.rb)
3. [Menu](https://github.com/samover/takeaway-challenge/blob/master/lib/menu.rb)
4. [Messager](https://github.com/samover/takeaway-challenge/blob/master/lib/messager.rb)

Text message functionality was integrated using [Twilio](https://github.com/twilio/twilio-ruby)

How to Use
----------

Initialize your new restaurant. The standard menu is Italian, but you can pass another `menu_name: `, which will look for menu's in the `lib/menus` folder. For example `menu_name: :polish` will load `polish.menu`. Please have a look at the [default menu](https://github.com/samover/takeaway-challenge/blob/master/lib/menus/italian.menu) for the right formatting.

```
dalla_mama = Takeaway.new(menu_name: :italian)
```

Show the menu:

```
dalla_mama.show_menu

# => Menu

# => Spaghetti Al Pomodoro Fresco E Basilico: £9.50
# => Spaghetti Carbonara: £9.50
# => Spaghetti Alla Bolognese: £8.50
# => Penne All 'Arrabiata: £8.95
# => Fettuccine Al Salmone: £10.95
# => Lasagne Al Forno: £10.50
# => Tagliata Di Manzo Con Rucola: £16.95
# => Scaloppine Melanzane: £15.95
```

Place an order:

```
dalla_mama.place_order 'Fettuccine Al Salmone', 3
dalla_mama.place_order 'Lasagne Al Forno', 2
```

You can see the content of your order so far:
```
dalla_mama.show_order

# => Fettuccine Al Salmone x3: £32.85
# => Lasagne Al Forno x2: £21.00
# => Total price: £53.85
```

And to start again:
```
dalla_mama.reset_order
```

Once you are satisfied with your order, proceed to checkout passing the exact price as an argument.
```
dalla_mama.checkout(53.85)
````

You will get a text confirming your order and estimated delivery time:
```
# Your order has been confirmed! Expect your yummie food by 20:12
# Fettuccine Al Salmone x3: £32.85
# Lasagne Al Forno x2: £21.00
# Total price: £53.85
```

Author: [Samuel Overloop](https://github.com/samover)

