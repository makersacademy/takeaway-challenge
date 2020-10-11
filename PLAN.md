# User Stories and Domain Models

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
|Objects|Message|
|----|----|
|Customer||
|Dishes|print_with_prices|

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
|Objects|Message|
|----|----|
|Customer||
|Dishes|add_to_order|
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
|Objects|Message|
|----|----|
|Customer||
|Order|print_price_breakdown_and_total|
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
|Objects|Message|
|----|----|
|Customer||
|Phone|send_text_when_order_confirmed|

#Class Diagram

||
|----|
|Class: Order|
|Methods: select_dishes(), list_items(), check_total()|
|Variables: Array_of_dish_hashes|

||
|----|
|Class: Print|
|Methods: print_order(), print_dishes()|
|Variables: Array_of_dish_hashes|

||
|----|
|Class: Phone|
|Methods: send_text()|
|Variables: number|
