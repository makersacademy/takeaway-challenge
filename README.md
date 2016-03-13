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

* Challenge time: rest of the day and weekend, until Monday 9am

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
[1] pry(main)> require './lib/restaurant'
=> true
[2] pry(main)> require './lib/order'
=> true
[3] pry(main)> require './lib/menu'
=> true
[4] pry(main)> require './lib/sms'
=> true
[5] pry(main)> menu = Menu.new
=> #<Menu:0x007fb30a9620e8 @dishes={}>
[6] pry(main)> menu.load_menu
=> {:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0}
[7] pry(main)> r=Restaurant.new menu
=> #<Restaurant:0x007fb30abb37c0
 @menu=#<Menu:0x007fb30a9620e8 @dishes={:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0}>,
 @order_klass=Order,
 @order_log=[],
 @sms=#<Sms:0x007fb30abb3798 @client=<Twilio::REST::Client @account_sid=AC4d884080618a7f0dbde8223d27f647f9>>>
[8] pry(main)> r.read_menu
=> {:pizza=>7.0, :burger=>9.99, :pasta=>7.5, :"something healthy"=>8.0}
[9] pry(main)> r.order :pizza, 2
=> "2x pizza(s) added to your basket."
[10] pry(main)> r.order :pasta
=> "1x pasta(s) added to your basket."
[11] pry(main)> r.show_order
"pizza x2 = 7.0"
"pasta x1 = 7.5"
=> {:pizza=>2, :pasta=>1}
[12] pry(main)> r.order_total
=> 21.5
[13] pry(main)> r.remove :pasta
=> 0
```
