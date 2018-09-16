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
_________________

In delivery.rb file:

```
account_sid = "Add own account_sid here from twilio account"
auth_token = "Add own auth_token here from twilio account"
```

And replace with twilio number and your personal number
(that you signed up for an account with)
```
to: "Your number that you registered twilio with",
from: "Your twilio number"
```

Example of use:

```
order = Order.new()
order.show_menu
order.add(1)
order.add(2)
order.show_orders
order.show_cost
order.place_order
```
