# User Stories
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
                        _________
                       |        |
user ---see menu---->  |  menu  |
                       |________|
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
                              _________
                             |        |
user --- select (food)---->  | basket |
                             |________|

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
                      _________
                     |        |
user --- view ---->  | basket |
                     |________|

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
                      _________     
                      |        |
user --- place ---->  | order  | )))
                      |________|         
```
# Initial Class Domain Model
```
               ,----------------------.                                                   
,----------.   |Menu                  |   ,---------------------------.                   
|Dish      |   |----------------------|   |PrintMenu                  |                   
|----------|   |+List available_dishes|   |---------------------------|                   
|+Int price|---|+PrintMenu print_menu |---|---------------------------|                   
|+Sym name |   |+Hash dish_number     |   |+.print_menu(menu_instance)|                   
|----------|   |----------------------|   `---------------------------'                   
`----------'   `----------------------'                                                   
     |           /                                                                        
     |          /                                                                         
,-------------------------.                                                                      
|Basket                   |  ,-------------------------------.   
|-------------------------|  |PrintBasket                    |
|+List items              |  |-------------------------------|   
|+.add_item               |--|-------------------------------|
|+.remove_item            |  |+.print_basket(basket_instance)|   
|+PrintBasket print_basket|  `-------------------------------'   
|-------------------------|                                                                      
`-------------------------'  
     |
     |
,------------------------------.
|Order                         |
|------------------------------|
|------------------------------|
|+.place_order(basket.instance)|
`------------------------------'
```
