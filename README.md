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

User Stories
------------

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

Instructions to run
-------------------

```
ruby <file_path>/restaurant.rb

menu = { categories: ['pizzas', 'drinks', 'dips'],
         items: [
           { name: 'margherita', price: 5 },
           { name: 'pepperoni', price: 7, category: 'pizzas' },
           { name: 'capricciosa', price: 9, category: 'pizzas' },
           { name: 'meatylicious', price: 9, category: 'pizzas' },
           { name: 'vegetarian', price: 8, category: 'pizzas' },
           { name: 'hawaiian', price: 7, category: 'pizzas' },
           { name: 'coke', price: 2 },
           { name: 'lemonade', price: 2, category: 'drinks' },
           { name: 'ginger beer', price: 2, category: 'drinks' },
           { name: 'orange juice', price: 2.5, category: 'drinks' },
           { name: 'water', price: 1, category: 'drinks' },
           { name: 'ketchup', price: 0.5, category: 'dips' },
           { name: 'mayo', price: 0.5, category: 'dips' },
           { name: 'brown sauce', price: 0.5, category: 'dips' }
        ]
      }

pizza_place = Restaurant.new(menu)

pizza_place.display_menu

```

Review
------
* Currently the program only handles a single order;
* Functionality is satisfactory and tests are passing;
* Need to practice further on stubbing external APIs in tests (this has been done, but not sure if it's done well);
* User stories were not well written, and the implementation hints were a bit cryptic, but the final product ended up OK.
