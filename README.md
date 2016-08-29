#Takeaway Challenge

##Description
A program that allows a customer to order a takeaway. The customer can view the menu, add items off the menu to their basket, view a summary of their basket and checkout their order.

##Classes
This program has three classes:

1. Takeaway

2. Order

3. Menu

###Takeaway
This class initialises with a menu and allows an order to be created. It includes the following public methods:
- `show_menu`, which sends the `show_dishes` message to Menu
-  `add` which takes two arguments - one being the dish and the second being an optional quantity arguments. This method send the `check_dish` message to Menu, and if no error is raised, adds the dish to the basket.
- `summary`, which sends the `summary` message to Order, returning a list of ordered dishes, quantities, prices and a total to pay.

###Menu
This class understands dishes and their prices. It can generate a readable list of menu items and prices using the method `show_dishes` and can check whether a dish is on the menu using `check_dish`.

###Order
This class understands the dishes that have been ordered. It can place ordered items in the basket using the method `add_dish` and can produced a readable summary of items in basket using `summary`.

##How to use
