#Takeaway Challenge
#==================

## What is it?

My effort at the Maker's Academy second week Takeaway Challenge, which uses Twilio's API to confirm order. I've attempted to apply Object Oriented Programming best practices, such as Single Responisbilty principle, Open and Closed principle, and the Law of Demeter.

##My approach

 ###Takeaway class: responsible for showing the menu, taking an order, displaying current basket, and placing the order.

 ###Order class: responsible for managing the order and doing the heavy lifting.

 ###Menu class: responsible for creating new menus, open for expansion.

 ###Messenge class: responsible for sending out confirmation sms's

User Stories

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

##Using the program should play out something like this in irb:
```
> menu = Menu.new
  => #<Menu:0x007fa23202d998 @menu_list={}>

> menu.add("Tagliatelle alla Bolognaise", 18)
  => 18

> menu.add("Gnocchi alla pesto", 18)
  => 18

> menu.add("Prosciutto di Parma", 23)
  => 23

> menu.menu_list
  => {"Tagliatelle alla Bolognaise"=>18, "Gnocchi alla pesto"=>18, "Prosciutto di Parma"=>23}

> takeaway = Takeaway.new(menu)
  => #<Takeaway:0x007fa23401b7c8 @menu=#<Menu:0x007fa23202d998 @menu_list={"Tagliatelle alla Bolognaise"=>18, "Gnocchi alla pesto"=>18, "Prosciutto di Parma"=>23}>, @order=#<Order:0x007fa23401b7a0 @current_order={}, @basket={}, @total=0>, @message=#<Message:0x007fa23401b728>>

> takeaway.show_menu
  => {"Tagliatelle alla Bolognaise"=>18, "Gnocchi alla pesto"=>18, "Prosciutto di Parma"=>23}

> takeaway.order("Gnocchi alla pesto")
  => "1 * Gnocchi alla pesto added to your order"

> takeaway.order("Prosciutto di Parma", 4)
  => "4 * Prosciutto di Parma added to your order"

> takeaway.basket
  Your order summary is:
  Gnocchi alla pesto * 1 for $18,
  Prosciutto di Parma * 4 for $92,
  Total = 110
  => nil

> takeaway.complete_order(110)
  message sent: Thank you Mr Parry. Your order totalling $110 has been registered to your account and will be delivered with the hour.

