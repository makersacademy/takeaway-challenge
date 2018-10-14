Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |Chunkys|   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
Instructions:

Run in the command line using IRB/PRY

Required files:
'./lib/menu.rb'
'./lib/takeaway.rb'
'./lib/sms.rb'
'./lib/order.rb'

Classes and Methods:

Menu
  contains a list of dishes and prices
  can print a list of dishes and prices
  can tell if a dish is not on the menu
  can tell the price of a dish

Order
  allows a user to select a quantity of dishes from a menu
  #select
    adds a quantity of items to the basket
    doesn't add an item not on the menu
  #remove
    removes an item from the basket

    wont remove an item that is not in the basket
  #total
    displays the basket total

SMS
  sends an SMS to the customer when an order is placed

Takeaway
  allows the user to see a list of dishes and prices
  allows the user to checkout an order


Example usage:

Creating a Menu

pry(main)> menu = Menu.new(falafel: 3, houmous: 1)
=> #<Menu:0x00007fd510d58f80 @items={:falafel=>3, :houmous=>1}>

Creating a takeaway
pry(main)> chunkys = Takeaway.new(menu)
=> #<Takeaway:0x00007fd511097890>

Viewing a menu
pry(main)> chunkys.display_menu
=> "Falafel: £3.00, Houmous: £1.00"

Selecting items to Order
pry(main)> chunkys.order.select(:falafel, 5)
=> 5
pry(main)> chunkys.order.select(:houmous, 3)
=> 3

Viewing the total
pry(main)> chunkys.order.total
=> "£18"

Placing the Order & sending and SMS confirmation
pry(main)> chunkys.checkout
=> "Thankyou your order has been placed"
