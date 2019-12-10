Takeaway Program
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
User Stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

   |menu| --view_menu--> |list of dishes with prices|

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

   |menu| --add_dish(dish, quantity) x  --> |order|

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

   |order| --calculate_total--> |total cost of order|
   |order| --view_order--> |printout of order|

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

   |order| --place_order--> |order placed|
   |customer| --text_message--> |confirmation text, arrival before 1hr|

```
Objects
- an interface for the customer to use.
- menu = {dish, price}
- order = [[dish, price, quantity]]
- confirmation_message

Messages
- view_menu
- add_dish(dish, quantity)
- view_order
- calculate_total
- place_order
- send_message
