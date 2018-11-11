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
 2.5.0 :001 > require './lib/order'
  => true
 2.5.0 :002 > order = Order.new
  => #<Order:0x00007f92df341a38 @menu=#<Menu:0x00007f92df341a10 @dish_list={"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}>, @basket=[], @price_store=[], @total=0, @send_sms=SendSms>
 2.5.0 :003 > order.add_dish('chicken korma')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :004 > order.add_dish('plain rice')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :005 > order.add_dish('plain naan')
  => {"chicken korma"=>5, "chicken bhuna"=>6, "lamb rogan josh"=>7, "plain rice"=>1, "pilau rice"=>2, "plain naan"=>3, "peshwari naan"=>4}
 2.5.0 :006 > order.show_basket
 Your current order:
 chicken korma price: 5
 plain rice price: 1
 plain naan price: 3
 Total: 9
  => nil
 2.5.0 :007 > order.confirm
 Please input your payment total:
 9
Message on it's way....!
  => nil
 2.5.0 :008 >
 ```

# Overall thoughts...

I only managed to complete a very basic implementation of this challenge. I was unable to integrate the correct tests in mocking the API response and this is what I need to focus on getting sorted.

I also was unable to mock the STDIN and STDOUT aspects which mean my test coverage was lower than I would have liked.
