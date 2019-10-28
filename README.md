## Takeaway Challenge - Makers Academy Weekend Challenge 2
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

### Using this program

This challenge was set as our second independent weekend challenge at Makers Academy.
It allowed me to further practice interpreting user stories into code using test driven development practices.
This challenge allowed me to understand breaking one class into two classes that work
together and maintaining test coverage and unit test classes in isolation using mocking.


```
irb
require './lib/takeaway.rb'
takeaway = Takeaway.new
takeaway.print_menu
=> {"Chicken_Katsu_Curry"=>13, "Veggie_Katsu_Curry"=>12, "Ramen"=>10, "Edamame"=>3, "Gyoza"=>5}
takeaway.add_item("Gyoza", 2)
takeaway.add_item("Gyoza",2)
=> 2
takeaway.add_item("Ramen", 3)
=> 3
takeaway.view_order
2x Gyoza: £10
3x Ramen: £30
 => 40
takeaway.confirm_order

```

## What i learned from this Challenge
* More practice using OO design and making sure classes are only responsible for one thing
* Using hashes in Ruby
* How to incorporate third party API's and ensure correct gems are installed
