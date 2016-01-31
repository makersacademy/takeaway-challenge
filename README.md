michaelcollins at Michaels-MacBook-Pro-2 in ~/projects/takeaway-challenge on master*
$ pry
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> t = Takeaway.new
=> #<Takeaway:0x007fb1a322dbf0
 @basket={},
 @credentials=
  {"ACCOUNT_SID"=>"AC8bd1098ecfdd34da6881b6dff31079bd",
   "AUTH_TOKEN"=>"6794497d9374c3ed5a1b4fe7a87155da"},
 @menu=
  #<Menu:0x007fb1a322dbc8
   @dishes=
    {"prawn crackers"=>2,
     "ribs"=>4,
     "special fried rice"=>6,
     "singapore noodles"=>5,
     "duck pancakes"=>8,
     "beef satay"=>7}>,
 @total=0>
[3] pry(main)> t.menu
=> {"prawn crackers"=>2,
 "ribs"=>4,
 "special fried rice"=>6,
 "singapore noodles"=>5,
 "duck pancakes"=>8,
 "beef satay"=>7}
[4] pry(main)> t.order('ribs')
=> 4
[5] pry(main)> t.order('beef satay')
=> 11
[6] pry(main)> t.order('duck pancakes')
=> 19
[7] pry(main)> t.basket
=> {"ribs"=>1, "beef satay"=>1, "duck pancakes"=>1, "Total"=>"£19"}
[8] pry(main)> t.confirm_order(20)
RuntimeError: Total is not correct, please try again
from /Users/michaelcollins/Projects/takeaway-challenge/lib/takeaway.rb:27:in `confirm_order'
[9] pry(main)> t.confirm_order(19)
=> "Thanks for your order, it will be delivered by 19:24"
[10] pry(main)> 
