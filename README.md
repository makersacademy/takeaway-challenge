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
