Takeaway Challenge
==================
This challenge was completed using TDD. The unit tests were written in RSpec (and isolated using doubles) and the feature tests were performed in `irb`.
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

#### This software allows the user to order food and receive a confirmation text message
- The user can read the menu.
- The user can add or remove dishes from their basket.
- The user can check the price of their order
- The user receives a text message with a delivery time when they complete their order.

## Instructions
- Before using the software, run the command `bundle` in the project directory to ensure you have all the gems.
- Then ask me for the details to fill in the var_template.env file.
- When using `irb`, after loading the lib files, the user can interact with the program by following the notes below:

```
t = TakeawayOrder.new

t.display_menu
 => {"fish"=>10, "steak"=>20, "chips"=>4, "pie"=>12} 
 
 t.add("fish", 2)
 => "2x fish has been added to your basket"
 
 t.delete("fish", 1)
 => "1x fish has been deleted from your basket" 
 
 t.basket
 => {"fish"=>1}
 
 t.total
 => 10
 
 t.complete_order(10)
 => Text message confirmation sent.
 ```
