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
menu = { categories: ['pizzas', 'drinks'],
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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am
