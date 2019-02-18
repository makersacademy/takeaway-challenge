# Weekend Challenge 2: Takeaway

([Original challenge README](challenge-README.md))

## Contents

[Introduction](#introduction)

[Domain Modelling](#domain-modelling)  

- [Initial domain Model](#initial-domain-model)  
- [Refining the domain model](#refining-the-domain-model)  

[Features](#features)  

- [Overview](#overview)  
- [(1) See a list of dishes with prices](#1-see-a-list-of-dishes-with-prices)  
- [(2) From a list of several available dishes, select some number to order](#2-from-a-list-of-several-available-dishes-select-some-number-to-order)  
- [(3) Review order and check total matches sum of dish prices in the order](#3-review-order-and-check-total-matches-sum-of-dish-prices-in-the-order)  
- [(4) After placing an order, receive a text message confirmation](#4-after-placing-an-order-receive-a-text-message-confirmation)

[Opportunities for Refactoring](#opportunities-for-refactoring)

## Introduction

The _Domain Modelling_ section is an overview of my design choices during the course of this project, from the initial design to insights gained in the process of developing the solution.

The _Features_ section (1) to (4) is a complete tour of the project from beginning to end, demonstrating how it behaves.

## Domain Modelling

### Initial domain Model

This table represents my initial understanding of the domain, and is likely to change as the project goes on.

_In these messages,_ `{ object }` _is an object returned and as in Ruby,_ `(object)` _after a message name is an object received (i.e. argument)_
  
| Object         | Messages                     |  
| -------------  | ---------------------------- |
| **Dish**           | `name` { `attr_reader :name` }<br>`price` { `attr_reader :price` } |  
| **Menu** | `list_dishes` { `dishes` }         |  
| **Order**          | `add`(`dish`, `quantity`)<br>`remove`(`dish`, `quantity`)<br>`review` { `selected_dishes` }<br>`print_total` { `total`, including currency symbol }    |  
| **Order_Submission** | `submit_order`(`order`) |  
| **Order_Confirmation** | `send_text`(`confirmation_message`)  |  
  
### Refining the domain model

This is the domain model in practice. I was unsure if it was valid to amend or delete from the above during the course of TDD but it turns out that it's perfectly acceptable. [Expected, even](https://www.scaledagileframework.com/domain-modeling/) ("Refactoring the Model").

| Object         | Messages                     |  
| -------------  | ---------------------------- |
| **Menu** | `list_dishes` { `dishes` }         |  
| **Order**          | `add`(`dish`, `quantity`)<br>`review` { `selected_dishes` }<br>`print_total` { `total`, including currency symbol }<br>`submit  { Submission.new(order) }`    |  
| **Submission** | `submit_order`(`order`) |  

- **`Dish`**  
Considering that the user stories focus on the customer it may not be necessary to have a separate `Dish` class - the user stories of a customer do not require any manipulation of `Dish` objects.  

- **`Order::remove()`**  
It seemed logical to have a `Order::remove()` method to go with `Order::add()` but the user stories do not support it. Perhaps this is something that could be implemented once everything else is done.

- **`Order_Submission`** and **`Order_Confirmation`**  
With the benefit of greater knowledge of the system and better understanding of problem domain, I realise that the actual sending of the `Order_Confirmation` is not something my system has to handle. After submitting an order, it is expected that an SMS is sent via Twilio: this would be triggered by `Submission`, and then it's down to the `twilio-ruby` gem.

- **`Order::submit`**  
A `submit_order` method in the `Submission` class is justified since it would definitely be responsible for submitting the order. However, maybe it also makes sense for `Order` to provide a `submit` instance method so that the customer never needs to have any knowledge of the `Submission` class

## Features

### Overview

_Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52"._

### (1) See a list of dishes with prices

>As a customer  
So that I can check if I want to order something  
I would like to **see** a list of dishes with prices  
>

```ruby

menu = Menu.new

menu.list_dishes
=>
1. Burger - £3.00
2. Steak Burger - £4.00
3. Chicken Burger - £3.00
4. Veggie Burger - £2.75
5. Small Lemonade - £0.60
6. Small Cola - £0.60
7. Bottled water (500ml) - £0.75
8. Large Lemonade - £1.00
9. Large Cola - £1.00
10. Small Fries - £1.00
11. Large Fries - £1.50
12. Garlic Bread - £2.00
13. Cheesy Garlic Bread - £2.80
14. Potato Wedges - £2.00
15. Chocolate Cake Slice - £1.50
16. Coconut Cake Slice - £1.50

```

### (2) From a list of several available dishes, select some number to order

>As a customer  
So that I can **order** the meal I want  
I would like to be able to select some number of several available dishes

```ruby

menu = Menu.new
menu.list_dishes
=>
# prints the menu, as shown above

order = Order.new

order.add(4,1)
=> "1x Veggie Burger added to your order"

order.add(5,1)
=> "1x Small Lemonade added to your order"

order.add(10,2)
=> "2x Small Fries added to your order"

```

### (3) Review order and check total matches sum of dish prices in the order

>As a customer  
So that I can verify that my order is correct  
I would like to check that the total I have been given matches the sum of the various dishes in my order  

```ruby
# omitted: commands as in (2)

order.print_total
=> £5.35

order.review
=>
"Order Summary:

Veggie Burger
£2.75 each, x1, subtotal: £2.75

Small Lemonade
£0.60 each, x1, subtotal: £0.60

Small Fries
£1.00 each, x2, subtotal: £2.00

             GRAND TOTAL: £5.35"

```

### (4) After placing an order, receive a text message confirmation

>As a customer  
So that I am reassured that my order will be delivered on time  
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered  

```ruby
# omitted: commands as in (3)

order.submit
=>
"Thank you! Your order was placed at 17:52 and should be with you by 18:52."

```

## Opportunities for Refactoring

- Currently, selected dishes are stored in an `Array` but a `Hash` might be better. The default value of a `Hash` could be used to hold the order total and make the instance variable unnecessary.

- I was unable to figure out the RSpec syntax to verify that the `submit` instance method of the `Order` class passes the `order` to the initializer of the `Submission` class
