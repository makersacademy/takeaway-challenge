Takeaway Challenge
==================
```
                            _________
              r==           |Murilo |
           _  //            |Dal Ri |   ))))
          |_)//(''''':      | 2016  |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instructions
-------

* A feature test has been included in './integration/features_spec.rb'
* Dishes can be added and removed from the menu manually or loaded from a file
* Upon confirmation of payment the customer should receive a text message stating the order total, who is in charge of the order and the estimated time of delivery.
* The restaurant keeps a history of all orders.


```ruby
[5] pry(main)> menu = Menu.new
=> #<Menu:0x007f84618c4988 @dishes={}>
[6] pry(main)> r=Restaurant.new menu
=> #<Restaurant:0x007f846088de48
 @menu=#<Menu:0x007f84618c4988 @dishes={}>,
 @order_klass=Order,
 @order_log=[],
 @sms=#<Sms:0x007f846088dd30 @client=<Twilio::REST::Client @account_sid=XXXXXXXXXXXXXXXXXXXXXX>>>
[7] pry(main)> menu.load_menu
=> {:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0}
[8] pry(main)> menu.add 'lasagne', 7.99
=> "lasagne has been added to the menu"
[9] pry(main)> r.read_menu
=> {:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0, :lasagne=>7.99}
[10] pry(main)> menu.remove 'lasagne'
=> "lasagne has been removed from the menu"
[11] pry(main)> r.read_menu
=> {:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0}
[12] pry(main)> r.order :pizza, 2
=> "2x pizza(s) added to your basket."
[13] pry(main)> r.order :pasta
=> "1x pasta(s) added to your basket."
[14] pry(main)> r.show_order
=> "pizza x2 = 14.0, pasta x1 = 7.5"
[15] pry(main)> r.order_total
=> "Total: £21.5"
[16] pry(main)> r.remove :pasta
=> "1x pasta(s) removed from your basket."
[17] pry(main)> r.order_total
=> "Total: £14.0"
[18] pry(main)> r.checkout 14
=> "Thank you! Your order is being prepared."
[19] pry(main)> r.order_log
=> [#<Order:0x007f846329c130
  @basket={:pizza=>2},
  @menu=#<Menu:0x007f84618c4988 @dishes={:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0}>>]
```
