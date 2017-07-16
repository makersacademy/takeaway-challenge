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

How to use
-------

1. To run in irb:
```
2.4.0 :001 > require './lib/menu'
2.4.0 :002 > menu = Menu.new("Ravenous Rabbits Raw Vegan Eatery")
2.4.0 :003 > menu.add_dish(Dish.new("Raw Vegan Lasagna", 6, "Main course"))
2.4.0 :004 > menu.order("Raw Vegan Lasagna")
Raw Vegan Lasagna added to order
2.4.0 :005 > menu.current_order.display
Raw Vegan Lasagna £6
Order total: £6
2.4.0 :006 > menu.current_order.submit("<phone number>")
Order submitted
2.4.0 :007 > menu.current_order.text_confirmation.send
```
2. To use the command line interface:
```
$ ruby takeaway_interface.rb
```

Approach
-------
I identified the four primary objects in the user stories as the takeaway menu, the dishes on it, the order, and the text message, and proceeded to develop these gradually via TDD, beginning with a menu that could display dishes, creating an ability to create an order from the menu, and eventually the creation of a 'Text' class that would send a notification to a supplied phone number.

I then went back and refactored the code, reducing method sizes wherever possible, and improved the way in which the menu displays its contained dishes by adding the ability to arrange them by type. I then built a simple command-line interface, to give another option for interacting with the code.
