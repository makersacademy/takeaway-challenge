This the way it works:

You can read a list of dishes plus prices, order items and get them delivered. the user gets an email confirmation through Trilio. Exceptions are raised if the total of dishes does not agree with the total given during finishing the order. Also a dish ordered that does not exist also raises an error message. Orders are confirmed on the app as well as per email.

I used two classes on for the restaurant and one for email confirmations via Trilio.

2.3.1 :001 > require "./lib/restaurant.rb"
 => true
2.3.1 :002 > burger = Restaurant.new
 => #<Restaurant:0x007face481fd10 @menu=[{"fried-rice"=>"£ 5"}, {"beef-stew"=>"£ 4"}, {"lemon-meringue"=>"£ 3"}, {"assorted-chocolates"=>"£ 3"}], @order=[], @count=0, @mailer=#<Email_conf:0x007face481fa18>, @time=2017-01-15 20:34:05 +0000>
2.3.1 :003 > burger.display_menu
"Dish: fried-rice ----- Price: £ 5"
"Dish: beef-stew ----- Price: £ 4"
"Dish: lemon-meringue ----- Price: £ 3"
"Dish: assorted-chocolates ----- Price: £ 3"
 => [{"fried-rice"=>"£ 5"}, {"beef-stew"=>"£ 4"}, {"lemon-meringue"=>"£ 3"}, {"assorted-chocolates"=>"£ 3"}]
2.3.1 :004 > burger.order_items("lemon-meringue",5)
 => nil
2.3.1 :005 > burger.order_items("beef-stew",5)
 => nil
2.3.1 :006 > burger.order_items("whatever",2)
this dish does not exist
 => nil
2.3.1 :007 > burger.finish_order(10)
you have ordered 10 dishes
 => []
 email confirmation received
2.3.1 :008 > burger.order_items("assorted-chocolates",2)
 => nil
2.3.1 :009 > burger.finish_order(1)
RuntimeError: the total given does not equal the dishes ordered
	from /Users/konradschlatte/Projects/takeaway-challenge/takeaway-challenge/lib/restaurant.rb:35:in `finish_order'
	from (irb):9
	from /Users/konradschlatte/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
2.3.1 :010 > burger.finish_order(2)
you have ordered 2 dishes
 => []
 email confirmation received
2.3.1 :011 > exit
