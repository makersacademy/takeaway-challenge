# Weekend Challenge 2: Takeaway

[Original challenge README](challenge-README.md)

## Domain Modelling

_In these messages,_ `{ object }` _is an object returned and as in Ruby,_ `(object)` _after a message name is an object received (i.e. argument)_
  
| Object         | Messages                     |  
| -------------  | ---------------------------- |  ---
| **Dish**           | `name` { `attr_reader :name` }<br>`price` { `attr_reader :price` } |
| **Menu** | `list_dishes` { `dishes` }         |
| **Order**          | `add`(`dish`, `quantity`)<br>`remove`(`dish`, `quantity`)<br>`review_order` { `selected_dishes` }<br>`total` { _sum of prices of all dishes in_ `selected_dishes` }    |  
| **Order_submission** | `submit_order`(`order`) |
| **Order_confirmation** | `send_text`(`confirmation_message`)  |
  
## Feature Tests

### Overview

_Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52"._

### (1) Can see a list of dishes with prices

>As a customer  
So that I can check if I want to order something  
I would like to see a list of dishes with prices  
>

```ruby

menu = Menu.new

menu.list_dishes

=>

1.  Burger - £3.00
2.  Steak Burger - £4.00
3.  Chicken Burger - £3.00
4.  Veggie Burger - £2.75
5.  Small Lemonade - £0.60
6.  Small Cola - £0.60
7.  Bottled water (500ml) - £0.75
8.  Large Lemonade - £1.00
9.  Large Cola - £1.00
10. Small Fries - £1.00
11. Large Fries - £1.50
12. Garlic Bread - £2.00
13. Cheesy Garlic Bread - £2.80
14. Potato Wedges - £2.00
15. Chocolate Cake Slice - £1.50
16. Coconut Cake Slice - £1.50

```

```
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
