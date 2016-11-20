Take Away application
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

Introduction
-------
The application allows a user to build a take away restaurant and add dishes to its menu. A customer will be given a list of available dishes and the restaurant is able to take orders and add dishes to its order. The customer will be able get an order status and make sure everything is correct according to the order. When checking out the order the customer will be given an overview of the order and the total of the order. Further the customer will be sent a text message confirming the order and time of delivery.


Installation
-----
* Run the command 'bundle install' in the project directory to ensure you have all the gems.


How to use the applicaton
-----

To run the program require the dependencies.rb file.

* Create your take away restaurant
  my_restaurant = Restaurant.new
* Start adding dishes with name, price and available amount to your menu
  my_restaurant.add_dish("my_dish", 12, 5)
* Show the customer the menu with available dishes
  my_restaurant.show_menu
