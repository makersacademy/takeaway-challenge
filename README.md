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
This program was designed to operate a takeaway restaurant.

## Setting up the environment
* Clone this repository into to your local computer.
* Run `$ gem install bundle` (if you don't have bundle already)

## Features
* Create a new restaurant
`restaurant = Restaurant.new`
* Create a dish in the restaurant menu - give it a name and price `restaurant.create_dish("chicken", 10)`
* Make an order by specifying dishes and their number, and also the total number of dishes `justine_order = restaurant.create_order([{name: "chicken", amount: 2}, {name: "beef", amount: 4}] 6)`.
* You can add to the order list only these dishes, which are available in the Restaurant.
* If the number of dishes matches given by the customer matches the total number of dishes in the order list, the order will be dispatched and the customer will be notified by sms. 
