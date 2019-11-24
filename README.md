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

* User Stories are complete. The program allows users to see a list of dishes with their prices, select dishes from the menu, and check the total price for selected dishes. In addition to using the menu to select dishes, when the user proceeds by checking out, an SMS message will be sent to their phone to confirm the order and state that the food will be delivered within an hour of ordering.

* In order to view the menu, a new instance of the menu class should be created and the open method should be used.

* Similarly, the choose method can be used to select options from the menu. When using the method, users should input the dish they would like as the first argument, and the number of these dishes as the second.

* Calling the basket method will show which dishes have been added to the 'basket', and the total price of these dishes can be checked by calling the 'total' method.

* If the user is happy with their order, they can call checkout. This enables the user to receive a confirmatory message with the estimated time of delivery for their order.

* Personal details of twilio account numbers and phone numbers have been removed. The user should input their mobile phone number in the phone.rb file, where instructed. The other details can be filled out to send the message successfully

## Suggested Feature Test
>  require './menu'
 => true
>  require './phone.rb'
 => true
>   menu1 = Menu.new
 => #<Menu:0x00007fe14fe30bb0 @dishes={"Hamster Soup"=>11.5, "Orechiette"=>4.4, "Vegan Offal"=>1.1}
>  menu1.open
 => {"Hamster Soup"=>11.5, "Orechiette"=>4.4, "Vegan Offal"=>1.1}
2.6.5 :005 > menu1.choose("Vegan Offal", 1)
> menu1.choose("Vegan Offal", 1)
 => {"Vegan Offal"=>1.1}
> menu1.choose("Hamster Soup", 2)
 => {"Hamster Soup"=>11.5}
> menu1.basket
 => ["Vegan Offal, £1.1", "Hamster Soup, £11.5", "Hamster Soup, £11.5"]
>  menu1.total
 => 24.1
>  phone1 = Phone.new
 => #<Phone:0x00007fe15019eef0>
>  phone1.send_message(true)

### Areas for improvement
* Ability to deselect items from basket
* Basket contains number of times same item is present, rather than repeating items
* Smoother interface for user, possibly asking questions to guide them through using the program.
* More options on the menu.
* Clearer and more concise methods.  
