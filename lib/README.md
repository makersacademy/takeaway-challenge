## Weekend Challenge 1 : Takeaway Challenge


## Nouns
* restaurant
* customer
* menu 
* dishes / Prices
* text message

## Verbs
* order
* view menu
* add to menu
* sum total 

## Verbs
Notes - Code to be updated for Twillio API messaging. Method to implemented for sending text messages

## Diagram Modelling - Restaurant
------------- | -------------
Class Name | Restaurant
Variables | Name = String
Methods  | select_available_dish()
Methods  | view_food_list()
Methods  | sum_order()
------------- | -------------

## Diagram Modelling - Menu
------------- | -------------
 Class Name | Menu
Variables  | {dishes => prices}
Methods  | show()
Methods | sum_dish_price()
------------- | -------------

## Diagram Modelling - Customer

------------- | -------------
 Class Name | Customer
Variables  | ......
Methods  | sum_order()
Methods | receive_confirmation_text()
------------- | -------------