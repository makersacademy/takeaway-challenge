## User Stories & Object Model Tables

#### View dishes

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

Object | Messages
------------------------------- | ---------------------------------------
Customer | 
Menu | view_dishes
Dish | view



#### Select available dishes

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

Object | Messages
------------------------------- | ---------------------------------------
Customer | 
Menu | view_dishes
Menu | select_dish
Dish | view

#### View total

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

```

Object | Messages
------------------------------- | ---------------------------------------
Customer | 
Menu | view_dishes
Menu | select_dish
Dish | view
Order | view_selected
Order | view_total

#### Confirmed Order

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

Object | Messages
------------------------------- | ---------------------------------------
Customer | 
Menu | view_dishes
Menu | select_dish
Dish | view
Order | view_selected
Order | view_total
Order |confirm_order
ConfirmedOrder | send_confirmation
