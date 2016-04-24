This is program is for delivery food at "Nick's Family Restaurant". Enjoy

All prices are in USD because 'Merica

I went to copy the Travis CI badge but I kept getting a 'build error' even though it would show all tests passing. I will continue to work on that and get it to you hopefully before the deadline, if not, sorry.

Hound issues: The hound wanted me to make the menu line shorter in the tests but it's hard to when the menu has more than 2 items. I left it as is since I didn't feel it was completely realistic to have a menu with one item. I would imagine in the future I could import a file with all the items but for now this will have to suffice.


My approach: It was hard to really understand what was going on since the interface is pretty IRB at this point. But from that I had the customer initiate a new order, view the menu and then place an order, one dish at a time, as you would in a restaurant.
"I would like two tacos" <-- one request
"I would like two slices of pizza" <--- another request

I also had a edge case to prevent ordering an item not on the menu. Can't expect a Chinese restaurant to have tacos. After they're done ordering, or even if they want to see how much they've ordered mid order, they can request an order summary. This will show everything ordered so far with the total of each item next to it. So if they have three tacos and each taco is 50 cents, then the total for tacos would be $1.50. If they are done ordering then they checkout with confirm order with the total of the order as the argument. I took this as the customer saying, "I'm paying this amount" and if it's the right amount, the order is complete and a text message is sent confirming it. If the total entered is incorrect than it's not correct and they can re-enter the correct amount.


An example of how the program works:

2.2.3 :001 > order = TakeAway.new
 => #<TakeAway:0x007fe9e9359c08 @menu=#<Menu:0x007fe9e9359be0 @menu={"Fried Rice"=>5.99, "Chicken Chow Mein"=>7.99, "Cheeseburger"=>6.99, "Pizza"=>8.99}>, @order=#<Order:0x007fe9e9359b40 @menu=#<Menu:0x007fe9e9359be0 @menu={"Fried Rice"=>5.99, "Chicken Chow Mein"=>7.99, "Cheeseburger"=>6.99, "Pizza"=>8.99}>, @order={}>>
2.2.3 :002 > order.read_menu
 => {"Fried Rice"=>5.99, "Chicken Chow Mein"=>7.99, "Cheeseburger"=>6.99, "Pizza"=>8.99}
2.2.3 :003 > order.order_food("Fried Rice", 2)
 => "2 order(s) of Fried Rice added to your cart"
2.2.3 :004 > order.order_food("Apple Fritters", 2)
RuntimeError: Apple Fritters not available
	from /Users/macpro/Projects/takeaway-challenge/lib/takeaway.rb:18:in `order_food'
	from (irb):4
	from /Users/macpro/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :005 > order.order_food("Pizza", 1)
 => "1 order(s) of Pizza added to your cart"
2.2.3 :006 > order.order_summary
 => "Fried Rice x 2 = $11.98, Pizza x 1 = $8.99"
2.2.3 :007 > order.confirm_order(21.00)
RuntimeError: Incorrect total
	from /Users/macpro/Projects/takeaway-challenge/lib/takeaway.rb:28:in `confirm_order'
	from (irb):7
	from /Users/macpro/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 > order.confirm_order(20.97)
Sent message to Nick
 => "Your order has been placed"
