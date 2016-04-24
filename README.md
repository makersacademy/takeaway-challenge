This is program is for delivery food at "Nick's Family Restaurant". Enjoy.


An example of how the program works:


2.2.3 :001 > order = TakeAway.new
 => #<TakeAway:0x007feba181cf60 @menu=#<Menu:0x007feba181cf38 @menu={"Fried Rice"=>5.99, "Chicken Chow Mein"=>7.99, "Cheeseburger"=>6.99, "Pizza"=>8.99}>, @order=#<Order:0x007feba181cec0 @menu=#<Menu:0x007feba181cf38 @menu={"Fried Rice"=>5.99, "Chicken Chow Mein"=>7.99, "Cheeseburger"=>6.99, "Pizza"=>8.99}>, @order={}>> 
2.2.3 :002 > order.read_menu
 => {"Fried Rice"=>5.99, "Chicken Chow Mein"=>7.99, "Cheeseburger"=>6.99, "Pizza"=>8.99} 
2.2.3 :003 > order.order_food("Fried Rice", 2)
 => "2 order(s) of Fried Rice added to your cart" 
2.2.3 :004 > order.order_food("Pizza", 3)
 => "3 order(s) of Pizza added to your cart" 
2.2.3 :005 > order.order_summary
 => "Fried Rice x 2 = $11.98, Pizza x 3 = $26.97" 
2.2.3 :006 > order.confirm_order(11.98)
RuntimeError: Incorrect total
	from /Users/macpro/Projects/takeaway-challenge/lib/takeaway.rb:29:in `confirm_order'
	from (irb):6
	from /Users/macpro/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :007 > order.confirm_order(38.95)
 => "Thank you! Your order was placed and will be delivered before 12:18" 
