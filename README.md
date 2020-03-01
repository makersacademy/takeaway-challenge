Takeaway Challenge
==================

Task
----
Create a Takeaway which allows a customer to view a menu with a list of dishes and prices. customers
can select dishes to add to their order and view their order. Once the customer is happy they can
place their order. This will send an sms confirming the delivery time of their order (1 hour from placing
the order).

Quickstart
----
This an irb application. To get started, clone this repository and run the following code in your terminal:
```
irb -r ./lib/customer.rb
```
Then set up a new customer. For example:
```
customer = Customer.new
```

User stories
----

1.
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
In IRB:
```
2.6.5 :002 > customer.show_menu

Welcome to Takeaway

item      Dish        Price
1.        pizza       £10.50
2.        curry       £8.00
3.        burger      £6.50

Please .select_dish (item number) and quantity
```


2.
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
The customer can update their order by running the following command in IRB:
```
2.6.5 :003 > customer.select_dish(3,2)
```
The first argument in the above example (3) refers to the
item number in the menu (e.g. burger).

The second argument in the above example (2) refers to the quantity that the customer would like to order of that item.

This adds this dish to the order object. A user can run this command as many times as they like.
  - If they select a dish that has already been selected, the order object will update the quantity appropriately.
  - If no quanity is provided, the quantity will default to 1

3.
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
The user can view their current order by using this command in IRB:
```
2.6.5 :004 > customer.show_order

Dish       Quantity   Amount
burger        2       £13.00

Total order: £13.00
```
This allows the user to see the total order and how the total is broken down.

4.

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

```
customer.place_order
```
This will send an SMS to customer with the message:
"Thank you! Your order was placed and will be delivered before <delivery_time>"

The delivery time is 1 hour from the time that the order is placed.

How programme is constructed:
---

|  class    | State     | Behaviour   |
|-----------|-----------|-------------|
| Customer  | @menu (-> dependency on Menu class)<br>@order (-> dependency on Order class)<br>@phone_number | show_menu() (-> calls Menu .display) <br> select_dish(dish_number, quantity) (-> calls Order .add) <br> remove_dish(dish_number, quantity) (not implemented yet) <br> show_order() (-> calls Order .display)<br>place_order() (-> calls Order .confirmed)|
| Menu      | @takeaway_name <br> @menu | display() |
| Order     | @order <br> @total <br> @menu (-> dependency on Menu class)| add() <br> display() <br> confirmed() (-> calls SMS.new, which sends SMS)|
| SMS       | @client | send_sms(phone_number, message) |


Known issues
---
- Users can currently enter an item number that isn't on the menu without it raising a useful error. This needs to be implemented

- If a users puts in a negative quantity to the .select_dish method it will minus this from the order (even allowing the order quantity to be negative). It should instead raise an error. This needs to be implemented.

- Not all the code follows the Single Responsibility Principle yet

- Rubocop is currently giving 4 offenses. These need to be sorted out.

Future improvements
---
- implement a .remove_dish function to allow the customer to remove dishes from their order. This introduces some complications. It would help if the order had item numbers to make it easier to select the order item they want. There would also need to be checks in place to ensure quantity doesn't go negative, and to remove item if quanity is 0.

- It would be nice if the programme displayed a message to the user when they selected a dish. Something like: "2 burgers have been added to your order"

- As this programme develops, it should have a dish object and a better way to load/update menus
