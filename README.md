Takeaway Challenge
==================

The second weekend challenge at Makers Academy: build a small takeaway restaurant app with order confirmations sent via SMS using the Twilio Gem.  

Instructions
-------

The app can be used as follows.

```sh
2.5.0 :003 > sole_trader = Takeaway.new
 => #<Takeaway:0x00007f89e99665e8 @menu=#<Menu:0x00007f89e99665c0>, @current_order=#<Order:0x00007f89e9966598 @item_list={}, @menu=#<Menu:0x00007f89e99665c0>>> 
2.5.0 :004 > sole_trader.read_menu
small chips: £2.0
large chips: £3.0
dab: £4.0
sole: £4.5
vegan fishcake: £2.5
vegan picked egg: £1.5
 => {"small chips"=>2.0, "large chips"=>3.0, "dab"=>4.0, "sole"=>4.5, "vegan fishcake"=>2.5, "vegan picked egg"=>1.5} 
 ...
```
