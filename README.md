Takeaway Challenge
==================
```
                            _________
              r==           |  J.F. |
           _  //            | Take- |   ))))
          |_)//(''''':      | Aways |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

How to Use:
-----------
* Start up IRB
  - Require ./lib/controller.rb
* Create new controller (controller = Controller.new)
* Use commands to edit order:
  - controller.show_menu
  - controller.add_to_order(<item number>)
  - controller.show_order
  - controller.send_sms (requires auth token)
* Menu can be changed with:
  - controller.select_menu(<csv path>)

Left to do:
-----------
* Create interactive menu script (so that IRB is not requried)
* Change item into a class of object, rather than a hash.
* Allow the customer to remove items from their order.
