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
 # How to use ...
 ```
 2.5.0 :001 > require './lib/order'
 => true
 2.5.0 :002 > order = Order.new
  => #<Order:0x00007fe16049d2b8 @menu=#<Menu:0x00007fe16049d290 @dish_list={"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}>, @basket=[], @price_store=[], @total=0, @send_sms=SendSms>
 2.5.0 :003 > order.add_dish('plain naan')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :004 > order.add_dish('chicken korma')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :005 > order.add_dish('pilau rice')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :006 > order.show_basket
 "Your current order:"
 "item: plain naan price: 3"
 "item: chicken korma price: 5"
 "item: pilau rice price: 2"
 "Total: 10"
  => "Total: 10"
 2.5.0 :007 > order.confirm
 ```

# Overall thoughts...

I managed to complete a very basic implementation of this challenge - the user interface is very basic. This was because I focused on the logic and the testing of the API.
