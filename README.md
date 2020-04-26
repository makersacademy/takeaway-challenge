## Takeaway Challenge

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
## My approach to the challenge

I started this project by applying everything I learned in the past week about Encapsulation, SRP, Dependency Injection, Domain Modelling and TDD.
My first step was to draw a domain model diagram which helped me to identify the need of implementing 4 classes, each with its own responsibility.
Also using dependency injection along with the use of ```instance_double()``` made the entire TDD process a lot easier.

## Classes

Restaurant
  * ```view_menu``` delegates to Menu class
  * ```select_dish(dish, qty)``` delegates to Order class
  * ```amend_dish(dish, qty)``` delegates to Order class
  * ```view_basket``` delegates to Order class
  * ```place_order``` delegates to Order class
  * ```send_text``` delegates to Text class
  * ```ready``` private method

Menu
  * ```print_menu``` formats and returns the menu
  * ```add_dish_to_menu(dish, price)``` adds ```dish``` and ```price``` to the menu
  * ```remove_dish_from_menu(dish)``` removes ```dish``` and ```price``` from the menu
  * ```dish?(dish)``` private method

Order
  * ```add_to_basket(dish, qty)``` adds ```dish``` and ```qty``` to basket
  * ```remove_from_basket(dish, qty)``` removes ```dish``` and ```qty``` from  basket
  * ```basket_total``` returns the total of the basket
  * ```prepare_order``` appends a ```true``` flag to the basket hash
  * ```cost``` private method

  Text
  * ```send_sms``` sends a text message 
