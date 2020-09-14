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

Domain Modelling
-----------------

![Takeaway class diagram](https://app.lucidchart.com/publicSegments/view/6dea5119-8dfe-4ada-a27c-49a31c522b6f/image.png "Takeaway class diagram")

How to use
-----------------
TODO

Example below:

```
account_sid = 'REDACTED'
auth_token = 'REDACTED'
from_phone = 'REDACTED'
to_phone = 'REDACTED'

thai_takeaway = TakeawayService.new(
  TwilioService.new(account_sid, auth_token, from_phone),
  Restaurant.new(
    Menu.new(
      Dish.new('Tom yum soup', 4.50),
      Dish.new('Pad thai', 8.95),
      Dish.new('Pad see yew', 8.95),
      Dish.new('Egg fried rice', 3.89)
    )
  )
)

thai_takeaway.print_menu

my_order = thai_takeaway.create_order

my_order.add('Tom yum soup', 2)

my_order.add('Pad thai', 1)

my_order.add('Pad see yew', 1)

thai_takeaway.place_order(my_order, to_phone)

```