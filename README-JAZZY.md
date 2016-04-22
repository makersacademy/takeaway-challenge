TAKEAWAY CHALLENGE

Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".

2.2.3 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fe622053c90 @menu=#<Menu:0x007fe622053c68 @menu_list={"pizza"=>3.5, "chips"=>1.5, "burger"=>3}>, @order_class=Order>
2.2.3 :003 > takeaway.read_menu
 => {"pizza"=>3.5, "chips"=>1.5, "burger"=>3}
2.2.3 :004 > takeaway.new_order
 => #<Order:0x007fe622038350 @this_order={}, @menu=#<Menu:0x007fe622038328 @menu_list={"pizza"=>3.5, "chips"=>1.5, "burger"=>3}>>
2.2.3 :005 > takeaway.add_to_order("pizza")
 => "1xpizza was added to your order"
2.2.3 :006 > takeaway.add_to_order("chips", 2)
 => "2xchips was added to your order"
2.2.3 :007 > takeaway.order_price
 => "Total: 6.5"
2.2.3 :008 > takeaway.finalize_order(6.5)
 => "Thank you! Your order was placed and will be delivered before 00:59"
2.2.3 :009 >
