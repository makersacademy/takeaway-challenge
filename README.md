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

==================
To solve this challenge, I did decide to create five different classes:

- TakeAway class : whose responsibility is to show the menu to the user

- Waiter class : whose responsibility is to take the order

- Cashier class : whose responsibility is to print an invoice

- Confirmer class : whose responsility is to check that the user is happy with the order

- Texter class : whose responsibility is to send an sms confirmation

===================================================

Here is an example of how the program runs:

2.3.1 :002 > chez_pawpaw = TakeAway.new

2.3.1 :003 > chez_pawpaw.show_menu
                  Menu
Soup                                  £2
Oreo ice cream                      £1.5
Pierogi                               £5

What would you like to order?

soup

How many soup portions would you like?

2

Would you like to order anything else?
Write "finalize order " to submit your final order
finalize order

Your order
2 x Soup
                  £4

Total             £4
Are you happy with your order?
yes
 => "Thank you"