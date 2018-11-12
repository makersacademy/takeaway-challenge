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
  => #<Order:0x00007fbe959f9308 @menu=#<Menu:0x00007fbe959f92e0 @dish_list={"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}>, @basket=[], @price_store=[], @total=0, @send_sms=SendSms>
 2.5.0 :003 > order.menu
  => #<Menu:0x00007fbe959f92e0 @dish_list={"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}>
 2.5.0 :004 > order.add_dish('chicken korma')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :005 > order.add_dish('plain naan')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :006 > order.add_dish('plain rice')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :007 > order.show_basket
 "Your current order:"
 "item: chicken korma price: 5"
 "item: plain naan price: 3"
 "item: plain rice price: 1"
 "Total: 9"
  => "Total: 9"
 2.5.0 :008 > order.confirm
 ```

# Overall thoughts...

I managed to complete a very basic implementation of this challenge - the user interface is very basic. This was because I focused on the logic and the testing of the API.
