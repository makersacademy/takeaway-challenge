## Notes
* Ability to select variety of cuisine (Pizza, Indian or Turkish) - POLYMORPHISM

(NB - Default is Turkish)
* Run feature_test.rb for an automated, random output
* Testing can be done using FakeTextMessage class to prevent text messages
```
takeaway.pay(71.44,FakeTextMessage.new)
```
* rspec test coverage is low on TextMessage class to avoid triggering messages
* No isolated unit testing on Takeaway class as it is responsible for very little functionality
* Rubocop clean, rspecs green

#### Screenshots

<img width="1382" alt="screen shot 2017-04-23 at 10 32 33" src="https://cloud.githubusercontent.com/assets/24992029/25312448/f8dc0dba-2810-11e7-9b23-7b8c089858d8.png">

![img_0608](https://cloud.githubusercontent.com/assets/24992029/25312450/fa1d7ace-2810-11e7-837c-5de7cf838f11.PNG)

#### REPL example

```
[1] pry(main)> load './lib/takeaway.rb'
=> true
[2] pry(main)> takeaway = Takeaway.new('indian')
=> #<Takeaway:0x007fc340937320
 @basket=#<Basket:0x007fc3409372f8 @current_order=[], @total_cost=0>,
 @takeaway_menu=
  ["--------INDIAN MENU--------",
   {"Chicken Korma"=>9.5},
   {"Lamb Ghost"=>10.5},
   {"Chicken Tikka Masala"=>12.99},
   {"Prawn Danzak"=>10.5},
   {"Vegetable Rogan Josh"=>9.99},
   {"King Prawn Dopiaza"=>15.99},
   {"Popadoms"=>2.5},
   {"Pilau Rice"=>3.99},
   {"Set Menu 1"=>24.99},
   {"Set Menu 2"=>45.99}]>
[3] pry(main)> takeaway.show_menu
--------INDIAN MENU--------
1. Chicken Korma (£9.50)
2. Lamb Ghost (£10.50)
3. Chicken Tikka Masala (£12.99)
4. Prawn Danzak (£10.50)
5. Vegetable Rogan Josh (£9.99)
6. King Prawn Dopiaza (£15.99)
7. Popadoms (£2.50)
8. Pilau Rice (£3.99)
9. Set Menu 1 (£24.99)
10. Set Menu 2 (£45.99)
=> nil
[4] pry(main)> takeaway.checkout
RuntimeError: You have nothing in your basket
from /Users/adamsnow/OneDrive/MacBook Only/Coding/weekend_challenge/takeaway-challenge/lib/takeaway.rb:27:in `checkout'
[5] pry(main)> rand(5..10).times { takeaway.order(rand(1..takeaway.takeaway_menu.count))}

=> 9
[6] pry(main)> takeaway.basket
=> #<Basket:0x007fc3409372f8
 @current_order=
  [{"Popadoms"=>2.5},
   {"Chicken Korma"=>9.5},
   {"Set Menu 1"=>24.99},
   {"Popadoms"=>2.5},
   {"Vegetable Rogan Josh"=>9.99},
   {"Pilau Rice"=>3.99},
   {"Pilau Rice"=>3.99},
   {"Vegetable Rogan Josh"=>9.99},
   {"Pilau Rice"=>3.99}],
 @total_cost=71.44>
[7] pry(main)> takeaway.checkout
-------------------------
Your Order:
-------------------------
2x Popadoms (£2.50)
1x Chicken Korma (£9.50)
1x Set Menu 1 (£24.99)
2x Vegetable Rogan Josh (£9.99)
3x Pilau Rice (£3.99)
-------------------------
Total: £71.44
-------------------------
=> nil
[8] pry(main)> takeaway.pay(71.44,FakeTextMessage.new)
FAKE TEXT: Your payment of £71.44 has been accepted.
    Your food should be with you by 19:51. Enjoy your meal
Your order will be confirmed by text message. Thank you.
```
