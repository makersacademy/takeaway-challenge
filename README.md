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

Steps
-------

* irb
* require './lib/order.rb' 
* order = Order.new
* order.add("Kim Chi") < this should add items to the order_list >
* order.total < should provide total amount in order_list>
* order.confirm < should send a text message confirming order dispatch within 15 mins >

Pending 
-------

* need to add mock/stub for order.confirm that sends out text message 

Summary
-------

* All tests passing with 5 passes, 0 failures
* Med Test coverage at 84.09%