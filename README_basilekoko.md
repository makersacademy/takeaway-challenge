[![Build
Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

## The Takeaway Challenge
- irb test
```
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> t = TakeAway.new
=> #<TakeAway:0x007f90594ca4c8
 @items={},
 @menu=
  #<Menu:0x007f90594ca478
   @dishes=
    {"Crab"=>8.5, "Curry"=>9, "Soup"=>10.32, "Sandwich"=>12, "Steak"=>20}>,
 @message=#<Message:0x007f90594ca4a0>>
[3] pry(main)> t.read_menu
=> {"Crab"=>8.5, "Curry"=>9, "Soup"=>10.32, "Sandwich"=>12, "Steak"=>20}
[4] pry(main)> t.order("Crab")
=> "1x Crab(s) added to your basket."
[5] pry(main)> t.order("Curry", 2)
=> "2x Curry(s) added to your basket."
[6] pry(main)> t.order("Soup", 3)
=> "3x Soup(s) added to your basket."
[7] pry(main)> t.basket_summary
=> "Crab x1 = £8.5, Curry x2 = £18, Soup x3 = £30.96"
[8] pry(main)> t.total_price
=> "Total: £57.46"
[9] pry(main)> t.complete_order(52)
RuntimeError: The total you enter does not match checkout
from /Users/Basile/Desktop/makers_2017/projects/takeaway-challenge/lib/takeaway.rb:34:in `complete_order'
[10] pry(main)> t.complete_order(57.46)
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC8223672aa600138e595e1fbfe22ca710/Messages/SMfa84e767c18a41499cad77023453ab28>
[11] pry(main)>
```
