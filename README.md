Takeaway Challenge
==================

Task
----

User stories
----

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

```
order = Order.new
order.display_menu
```
when built, display menu as shown in IRB

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

```
dish_number = 1
quantity = 2
order.select_dish(dish_number, quantity)
```
This will add this dish and quantity as a hash into an order array. Before adding, it will need to check whether This
dish has already been included in the order array, if yes then increase quantity of that order rather than adding a new
element to the order.

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
Still not 100% how to implement this

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

```
order.confirmed
```
when this is run, this will generate an SMS to send (how to I get the customers details..?) and send a message saying
"Thank you! Your order was placed and will be delivered before <insert time 1 hour from when order was placed>"

How programme is constructed:
---

- order class:
  - State
    - @order
    - @menu = Menu.new
    - @total
  - Behaviour
    - display
- menu class
- dish class
