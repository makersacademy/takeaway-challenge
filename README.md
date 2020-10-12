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
# How to Use:
First, load in IRB using ```irb -r './lib/takeaway.rb'```

If you would like to use a new menu, add your menu to the 'Menus' directory with the following format:

```food,price```

Then, you can start your order using: ```my_order = Takeaway.new('my_file_name.csv')```
Now, you can begin your order! (If you don't want to add a menu, just type ```my_order = Takeaway.new```)

To see the menu: ```my_order.see_dishes```
To order: ```my_order.place_order```
To verify your order: ```my_order.verify_order```

Once you've verified your order, you will be asked to enter your phone number. From here, you will receive a text confirming your order and expected arrival time.

## Note:
Please enter in your own Twilio API account SID, authentication token, and phone number to use.

# User Stories:

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
# Domain Model:

Object | Behaviour
------ | ---------
Dish | price
Menu | print_menu, find_price()
Takeaway | #see_dishes, #place_order, #verify_order text_confirmation

