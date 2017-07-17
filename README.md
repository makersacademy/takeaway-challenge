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

Task
-----

Full instructions can be read in [INSTRUCTIONS.md](INSTRUCTIONS.md)

* Write a Takeaway program with the following user stories:

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

####To Use the Program

Using irb or pry, enter the following commands:

`require_relative '/lib/takeaway.rb'`
`takeaway = Takeaway.new`
Note: real telephone numbers have be omitted from the messager.rb file, you will need to add a Twilio number and customer number to use the text message confirmation functionality.

####Methods
View the takeaway menu:
`takeaway.view_menu`

Add items and quantities to order
add(item, quantity = 1)
`takeaway.add("Margherita", 2)`

Display your order and current total cost
`takeaway.view_order`

Confirm payment to complete order and a text message will be sent to your phone
complete_order(payment)
`takeaway.complete_order(22)`

####Structure of program

Classes
Takeaway
This is the interface the customer would use. See above for its main methods.
It includes instances of the Order, Menu and Messager classes.

Menu
Stores the dishes from data/dishes.rb file in a hash `@dishes`.
The method `to_s` returns the menu as a string.

Order
This uses a hash `@basket` to store dish names and quantities the customer `add` to the order.
The method `to_s` returns the order as a string with a current total of order.
The method size returns the number of dishes in the order.

Messager
This uses the Twilio API to `send_text` message to a customer number to confirm order.

[code review rubric](docs/review.md).  
