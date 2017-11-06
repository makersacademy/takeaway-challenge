```
                            _________
              r==           |       |
           _  //            |  I.P. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

# Takeaway Challenge

The Takeaway Challenge is the second weekend challenge at Makers Academy. The request was to write a software to simulate a takeaway that could receive orders from a customer. The instructions can be found in the "Instructions.md" file.

This is my proposed solution using Ruby.

For this project I created four different classes, 'takeaway', 'dish', 'menu' and 'order' that can be found
in the lib directory. The tests for each one are in the spec directory and can be run using RSpec.

Every takeaway created has a preloaded menu with a list of dishes and prices, and a spike holder for the
different orders. An order consists of a cart (list of items and quantities), a status (new, payed, canceled), and a total.

A customer can ask for the menu, order, proceed to checkout and pay. Once the payment is approved, an SMS is
sent to the customer with a confirmation message and with the expected time of delivery. The text sending functionality was implemented using Twilio API.

This is a sample of how the program works:

We start by creating our takeaway, we will call it "Shakes & Co"
```
shakes_and_co = Takeaway.new
```
Now we can ask for the menu
```
shakes_and_co.show_menu

              - MENU -
Double_trouble.....................12.99
Kiwilicious.........................8.99
Smarty_smarties.....................8.49
Lets_go_nuts........................4.99
Chocolate_indulgence................5.99
```
We choose something from the menu and order it
```
shakes_and_co.order("Kiwilicious")
```
We might want something else
```
shakes_and_co.order("Chocolate_indulgence", 2)
```

Now we can proceed to checkout
```
shakes_and_co.checkout

            - CHECKOUT -
Kiwilicious x 1.....................8.99
Chocolate_indulgence x 2...........11.98
--------------------
Total: 20.97
```
We pay the Total
```
shakes_and_co.pay(20.97)
```
We get a confirmation text message that looks like this
```
'The order will be delivered before 08:30 PM'
```
