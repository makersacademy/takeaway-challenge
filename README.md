# Takeaway challenge

Work done for the week 2 challenge for [Makers Academy](http://www.makersacademy.com)

I broke the challenge down into its User Stories and tried to tackle them one at a time. I was more aware about splitting responsibilities into classes. I struggled mostly with writing rspec tests.

## Example app usage in irb
```sh
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> takeaway = TakeAway.new
=> #<TakeAway:0x007fb6aa859180 @basket=[], @menu=#<Menu:0x007fb6aa859130 @dishes={"Hamburger"=>3.99, "Pizza"=>9.99, "Fish and Chips"=>4.99, "Curry"=>5.99, "Deep Fried Mars Bar"=>0.99, "Coke Zero"=>1.99}>>
[3] pry(main)> takeaway.view_menu
=> "Hamburger £3.99, Pizza £9.99, Fish and Chips £4.99, Curry £5.99, Deep Fried Mars Bar £0.99, Coke Zero £1.99"
[4] pry(main)> takeaway.add("Fish and Chips",2)
2x Fish and Chips added to your basket.
=> ["Fish and Chips", "Fish and Chips"]
[5] pry(main)> takeaway.add("Coke Zero")
1x Coke Zero added to your basket.
=> ["Fish and Chips", "Fish and Chips", "Coke Zero"]
[6] pry(main)> takeaway.total
Total: £11.97
=> 11.97
[7] pry(main)> takeaway.checkout(11.97)
Total: £11.97
SMS successfully sent
=> nil
[8] pry(main)> exit
```
