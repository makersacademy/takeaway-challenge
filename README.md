Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  V.H. |   ))))
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

This programme mimics the basic functionality of a take away food app.  You can:

- See a menu

- Choose a custom number of items from the menu

- Confirm your selection and see the total for the order

- Complete checkout

I didn't have time to get to the TWilio API section :(

How to use:

```2.4.0 :001 > require './docs/menu.rb'
 => true
2.4.0 :002 > menu = Menu.new
 => #<Menu:0x007f851201c6a8 @dishes={"chilli chicken ramen"=>12.0, "seafood ramen"=>13.0, "gyoza"=>6.0, "shiitake donburi"=>10.0, "chicken katsu curry"=>12.0, "prawn raisukaree"=>13.5, "warm tofu chilli salad"=>11.0, "white chocolate ginger cheesecake"=>4.5, "mango and coconut parfait"=>5.0}>
2.4.0 :003 > require './docs/order.rb'
 => true
2.4.0 :004 > order = Order.new
 => #<Order:0x007f8512004828 @menu=#<Menu:0x007f8512004800 @dishes={"chilli chicken ramen"=>12.0, "seafood ramen"=>13.0, "gyoza"=>6.0, "shiitake donburi"=>10.0, "chicken katsu curry"=>12.0, "prawn raisukaree"=>13.5, "warm tofu chilli salad"=>11.0, "white chocolate ginger cheesecake"=>4.5, "mango and coconut parfait"=>5.0}>>
2.4.0 :005 > order.add_dish("seafood ramen", 2)
 => 2
2.4.0 :006 > order.confirm_order
Your order comes to 26.0
Enter 'Yes' if you would like to continue with your order
yes                 
 => "Thankyou, your order has been placed and should be expected to arrive at 09:29PM"
```
