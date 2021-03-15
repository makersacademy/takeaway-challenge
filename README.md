RaRaRamen Takeaway
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

* Run bundle install to use Take Away creator

* You will need to open `irb` and require `'./lib/take_away.rb'` to run the program.

* To add a new order type `take_away = TakeAway.new`

* To read menu type `take_away.read_menu`

* To order type  `take_away.order(dish, quantity` selecting the dish from the menu and the desired quantity.

* To order type  `take_away.order(dish, quantity` selecting the dish from the menu and the desired quantity. You will receive a confirmation message that this dish was added to your basket

* To check the basket summary type  `take_away.basket_summary` 

* To check the basket total type `take_away.total`

* To check-out your order type `take_away.check_out(total)` with basket total to confirm the order. You will receive a confirmation message telling you the delivery time (an hour from now).

* The challenge is not completed as the class MessageSender should be set-up to send a message to a phone number via Trilio API.

* The implementation will look something like this:

```
open irb
> require './lib/take_away.rb'
 => true 
> take_away = TakeAway.new
 => #<TakeAway:0x00000001278c7238 @menu={"Shio Ramen"=>5.5, "Shoyu Ramen"=>6, "Miso Ramen"=>7, "Spicy Ramen"=>8}, @basket={}, @message_sender=#<MessageSender:0x00000001278c6a68>> 
> take_away.read_menu
 => {"Shio Ramen"=>5.5, "Shoyu Ramen"=>6, "Miso Ramen"=>7, "Spicy Ramen"=>8} 
> take_away.order("Shio Ramen", 5)
 => "5x Shio Ramen(s) added to your basket." 
> take_away.order("Miso Ramen", 4)
 => "4x Miso Ramen(s) added to your basket." 
> take_away.basket_summary
 => ["5x Shio Ramen(s) = £27.5", "4x Miso Ramen(s) = £28"] 
> take_away.total
 => 55.5 
> take_away.check_out(55.5)
 => "Thank you! Your order was placed and will be delivered before 12:05"
```

