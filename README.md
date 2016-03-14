Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  A.C. |   ))))
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

In this takeaway program your able to add items from a menu, review your order and complete your order. Once you complete your order, you will receive a text containing a time one hour from now for your expected delivery.

How it works
-----

Here is a user journey to understand how the program works.

```

Menu = Menu.new

#<Menu:0x007fcf3886cc70 @menu_view={"eggs"=>4, "bacon"=>3, "toast"=>4}, @order_class=Order, @delivery_message=DeliveryMessage>

menu.order_item('eggs')

[{"eggs"=>4}]

menu.order_item('bacon')

[{"eggs"=>4}, {"bacon"=>3}]

menu.review

[{"eggs"=>4}, {"bacon"=>3}]

menu

#<Menu:0x007fcf3886cc70 @menu_view={"eggs"=>4, "bacon"=>3, "toast"=>4}, @order_class=Order, @delivery_message=DeliveryMessage, @order=#<Order:0x007fcf3885cc80 @current_order=CurrentOrder, @completed_order=[], @current=#<CurrentOrder:0x007fcf3885ca78 @current_order=[{"eggs"=>4}, {"bacon"=>3}], @total=7>>>

menu.finish_order


```

Whats missing
-----

Menu

Raise for item not on menu (and test)


Tests for current order -

Review - returns the items and the total
Review - Sums the correct total amount
Here is a user journey to understand how the program works.

Delivery message

Works correctly but require stops Rspec from working
No Rspec test for Delivery message
