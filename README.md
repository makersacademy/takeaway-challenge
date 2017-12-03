Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

## Usage ##
#### Setup ####
- Instantiate a Menu item and add all Dishes  
menu = Menu.new  
menu.add_dish(Dish.new("Lamb Biryani", 4.99))  
menu.add_dish(Dish.new("Chicken Malaya", 4.50))  
menu.add_dish(Dish.new("Popadums", 1.00))  
etc.  
- Instantiate your takeaway restaurant with your menu:  
my_restaurant = Takeaway.new(menu)  
- Initiate Twilio with your details:  
my_restaurant.twilio_init(twilio user id, authentication token, restaurant's phone number)  
#### Placing Orders ####
my_restaurant.order(customer's order as a hash, price, customer's phone number)  
- Will check that all items are on the menu, and that the price adds up to the given price  
- Will send the customer a text message informing them that their order is on the way  

## Classes and Public Methods ##
#### Takeaway ####
Main class  
- .twilio_init(twilio_id, auth_token, phone_number):  
    builds a texter object with the twilio credentials  
- .menu:  
    returns the menu as a string  
- .order(order, price, phone_number):  
    checks the order and texts the customer  

#### Menu ####
Stores a Menu  
- .add_dish(dish):  
    adds the dish to the menu  
- .dishes:  
    returns a copy of the hash containing dishes  
- .to_s:  
    returns the menu as a string  
n.b. stores the menu as dish objects in a hash using the dish.name as key, this means that no two dishes in the menu can have the same name, and also allows easy lookup of dishes  

#### Order ####
Stores an Order  
- .add(dish, number):   
    adds the dish and number to the order  
- .check:  
    makes sure that all dishes ordered are on the menu  
- .price:  
    returns the price of the order  
- .dishes:  
    allows access to the dishes on the order  

#### Dish ####
Stores a Dish  
- .name:  
    returns the name of the dish  
- .price:  
    returns the price of the dish  
- .to_s:  
    returns the name and price as a string  

#### Texter ####
Allows functionality for sending texts using Twilio  
- .text(customer_number):  
    sends a text to the customer saying their order will be delivered within the hour  
