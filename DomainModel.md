## USER STORIES

```As a customer
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
## DOMAIN MODEL

MENU CLASS
Instance Variables:
```@dishes``
Methods:
```list_dishes```

ORDER CLASS
Instance Variables:
```@dishes_ordered, @order_total, @customer_mobile (can fix this to own number)```
Methods:
```select_dish, check_total, place_order, send_text```

ORDER---select_dish--->MENU
ORDER<---return dish---MENU
