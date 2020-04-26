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

Instructions
-------
This program is used by calling methods on objects of the 'Takeaway' class. An example of how to use the code is shown below:

In irb from the main folder:

```
require './lib/takeaway'

chippers = Takeaway.new({burger: 10, fish: 8, sausage: 5, chips: 2})

chippers.see_dishes

chippers.add_dish(:burger, 4)
chippers.add_dish(:sausage, 1)
chippers.add_dish(:chips, 5)

chippers.order
chippers.current_total

chippers.place_order(55)
```

A few things to note:
* My Twilio account has been suspended for no apparent reason so I have used the Nexmo API.
* Environmental variables have to be set from the local machine in order to send texts on receipt of order.
* Code hasn't been fully encapsulated yet.
