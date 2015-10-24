#Takeaway-challenge: my plan

##User story

###First block

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

We need to create a menu object which could:
-have a (default) list of dishes: a hash is an appropriate structure to store dishes with name as key and price as value
-allow to display menu in a well formatted manner
-allow to `#add_dish` from the list
-allow to `#remove_dish` from the list

{"Tomatoes mozzarella" => 8,
            "Proscieto" => 12,
            "White beans with balsamic dressing" => 7,
            "Scalopine milanese" => 12,
            "Bolognese spaghetti" => 15,
            "Pizza Calzone" => 13,
            "Tiramisu" => 6,
            "Chocolate cake" => 6,
            "Ice cream selection" => 5}

###Second block

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes





Create a menu object that can be displayed
Will contain starters, mains and deserts

Create an order object that will be able to:
-select dishes with quantity


Menu is an array of items, which have a name and a price and can be stored in a hash.




Create an order: will take an item, with quantity and will calculate price
Create a confirmation: lists items with quantities, price and total


Create an order class
