### Takeaway Challenge
=========================

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
 
###### The idea
A simple Takeaway app for a Restaurant; where a customer can view a menu,
 add dishes to their order, place the order, and receive a text confirmation.
* The app will use the Twilio API 
 
###### User stories / app capabilities
_A user can:_ <br>
- [x] see a list of dishes with prices
- [x] select some number of several available dishes
- [ ] check that the total given matches the sum of the various dishes in the order
- [ ] receive a text such as "Thank you! Your order was placed" after they ordered
- [ ] the text will also state the order's ETA (1 hour from oder time)

###### Built with

Ruby

###### How to run
_only in irb for now, example below_<br>
`irb feature_test.rb`
```
myrtles-MBP:takeaway-challenge myrtle$ irb feature_test.rb 
2.7.0 :001 > require "./lib/menu.rb"
 => true 
2.7.0 :002 > require "./lib/order.rb"
 => true 
2.7.0 :003 > require "./lib/takeaway.rb"
 => true 
2.7.0 :004 > dishes = { "salad" => 4.00, "falafel" => 3.00, "kombucha" => 2.50}
2.7.0 :005 > menu = Menu.new(dishes)
2.7.0 :006 > order = Order.new(menu)
2.7.0 :007 > takeaway = Takeaway.new(menu, order)
2.7.0 :008 > p "Welcome to takeaway! our dishes today:"
"Welcome to takeaway! our dishes today:"
 => "Welcome to takeaway! our dishes today:" 
2.7.0 :009 > takeaway.print_menu
 => "Salad £4.00, Falafel £3.00, Kombucha £2.50" 
2.7.0 :010 > p "you may now add dishes to your order"
"you may now add dishes to your order"
 => "you may now add dishes to your order" 
2.7.0 :011 > p "I'd like a salad.."
"I'd like a salad.."
 => "I'd like a salad.." 
2.7.0 :012 > order.add("salad", 1)
 => 1 
2.7.0 :013 > p "..and 2 falafel.."
"..and 2 falafel.."
 => "..and 2 falafel.." 
2.7.0 :014 > order.add("falafel", 2)
 => 2 
2.7.0 :015 > p "..and 2 kombuchas!"
"..and 2 kombuchas!"
 => "..and 2 kombuchas!" 
2.7.0 :016 > order.add("kombucha", 2)
 => 2 
2.7.0 :017 > p "Yum! your order is:" 
"Yum! your order is:"
 => "Yum! your order is:" 
2.7.0 :018 > order.show
"salad : 1"
"falafel : 2"
"kombucha : 2"
 => ["salad : 1", "falafel : 2", "kombucha : 2"] 
2.7.0 :019 > p "..and your total is: £" + order.total.to_s
"..and your total is: £15.0"
 => "..and your total is: £15.0" 
myrtles-MBP:takeaway-challenge myrtle$ 
```

###### How to test

`Rspec` <br>
_and/or_ <br>
`irb feature_test.rb` 

###### weekend 2 @ Makers Academy
2nd weekend exercise; unfortunately unfinished <br>
_I watched Sam Morgan's video walkthrough to help navigate the exercise._

###### Collaborators
solo [Myrtle](https://github.com/Mrtly) 
