## TAKE AWAY SOFTWARE
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

This piece of software allow a customer to:
- [x] Read the food and drink menu
- [x] Select their choice by entering the item's number.
- [x] Specify how many of the item they want and add as many items as they want to their order.

At the end of the order, they get printed on the screen a summary of the order with number and name of dishes and the total amount to pay.

The customer is prompted to confirm the order and if they do so, they receive a text message on their mobile confirming their order will be with them soon

It launch the User Interface at the creation of a new order:

```
2.3.1 :001 > require "./lib/order"
 => true
2.3.1 :002 > order = Order.new

Would you like to look at the menu?
yes
Main course: pizza £10  number: 11
Main course: pasta £12  number: 12
Starter: salad £8  number: 1
Dessert: tart £7  number: 111
Drink: water £4  number: 1111
Drink: wine £6  number: 1112
Would you like to order a dish?
ghghgh
This is not a valide choice, type 'yes' or 'no'
Would you like to order a dish?
yes
Would you like to order via sms?
no
Please enter the dish number you wish to order
111
How many of this dish do you wish to order?
3
Would you like to order an other dish?
yes
Please enter the dish number you wish to order
1
How many of this dish do you wish to order?
4
Would you like to order an other dish?
no
Your order is:
3 tart(s), £21
4 salad(s), £32
For a total of £53
Would you like to confirm this order?
yes
Sent message to Laurent
```
