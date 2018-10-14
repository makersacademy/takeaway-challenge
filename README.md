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

Instructions
-------
  * Initialize a menu class
    * ex: Panda_Express = Menu.New
  * Initialize dishes on the Menu (name, price)
    * ex: Panda_Bowl = Dish.new("Panda Bowl", 10)
  * Load dish to menu
    * ex: Panda_Express.add_dish(Panda_Bowl)
  * Initialize a customer class
    * ex: Ryan_Clark = Customer.new
  * Check the menu (menu)
    * ex: Ryan_Clark.check_menu(Panda_Express)
    * - returns ["| Panda Bowl $10 |"] -
  * Select a dish and quantity (menu, dish, quantity)
    * ex: Ryan_Clark.select_dish(Panda_Express, Panda_Bowl, 4)
    * - returns "4 Panda Bowl added" -
  * Verify your basket
    * ex: Ryan_Clark.verify_order
    * - returns ["Panda Bowl x4 $40"] -
  * Verify total balance
    * ex: Ryan_Clark.total_balance
    * - returns 40 -
  * Place order via Twilio
    * ex: Ryan_Clark.place_order


Initial Task User Stories
-----
```
As a customer
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


Functions
------------------
**You can see the codes structure under my work flow process in the map_charts folder**

## Classes

### Customer

  * Initialize
    * initializes order class
    * initializes loaded SmsText class or creates new SmsText class
  * check_menu(menu)
    * Receives menu from menu class
  * select_dish(menu, dish, number)
    * Imports a dish from a menu a number of times
    * prints a confirmation of basket item
  * verify_order
    * shows all of basket items and their prices
  * total_balance
    * shows total cost of customer order

### Menu

  * initialize
  * add_dish(dish)
    * adds a dish to Menu
  * list_dishes
    * prints the available dishes
  * find_dish(dish)
    * finds dish selected by customer class
    * returns dish to order class

### Order

  * Initialize
  * print_list
    * loads the sorter with trimmed dish list
    * converts sorter class array to string
    * outputs basket string array
  * total
    * calculates total cost of order

### Dish

  * Initialize
    * name
    * price
    * quantity (used for order)
  * up_quantity
    * increases the quantity when called in order class

### SmsText

  * sends text
    * inits twilio


My Process
--------------

* The first thing I did was create a domain_model.md
* Then I transferred the first character story to the domain model
    * After i had a clear look at my domain model I began writing my test
    * I thought about how a user would expect this paragraph to work on their end and wrote a test that expected those results
    *  After the test was made and passing I would write the actual code. it wasn't anything fancy just the bare minimum i needed to write the test.
    * after my rspec and coverage passed I would clean my code.
* Many times I would write something new and it would fail a lot of my old tests
    * most of this was due to lack of knowledge for testing syntax
    * I would look up more accurate methods and then try to implement them.
    * once the old tests didn't fail, I would try to make new methods and make sure they didn't fail my old ones.
    * My approach may have been initially time consuming, but it saved me a lot of heartache by the time I got to implementing the more serious and complex features. 
