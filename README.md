# Takeaway Challenge

For this weekend challenge, we were tasked with creating a simple application for a user to place a takeaway order from. 

I approached this challenge by taking on one user story at a time, with a test driven approach. Although for the last one I was unsure how to test for a text sending method. The main needs of the user were:

1. To see a menu - I tested for and created a menu class with a method to create readable menu, and subsequently an order class with a method for seeing this menu.

2. To select dishes for the order - I tested for and created an add(dish) method, in the order class, which added user selections to an @order instance variable that began as an empty array.

3. To check the total cost of the order - I tested for and created a get_price(dish) method in my menu class, and a check_total method in the order class that brings up a summary of the user's order and a total price.

4. To receive a text once the order has been placed that will reassure the user the order will be delivered on time - I was unsure how to test for this, but I created a text class and send_text method that can send a text to the user through the Twilio gem.

## IRB Example

- 2.6.5 :001 > order = Order.new
-  => #<Order:0x00007ff59c0e1390 @menu_class=Menu, @menu="", @order=[]> 
- 2.6.5 :002 > order.see_menu
Menu:
1. Chicken - £10
2. Steak - £15
3. Pasta - £8
4. Pizza - £9
- => {"Chicken"=>10, "Steak"=>15, "Pasta"=>8, "Pizza"=>9} 
- 2.6.5 :003 > order.add("Chicken")
- => "You now have 1 of the Chicken meal in your order" 
- 2.6.5 :004 > order.add("Chicken")
- => "You now have 2 of the Chicken meal in your order" 
- 2.6.5 :005 > order.add("Pizza")
- => "You now have 1 of the Pizza meal in your order" 
- 2.6.5 :006 > order.add("Chicken")
- => "You now have 3 of the Chicken meal in your order" 
- 2.6.5 :007 > order.check_total
- Chicken - £10
- Chicken - £10
- Pizza - £9
- Chicken - £10
- ---------------
- Total - £39
- => nil 
- 2.6.5 :008 > order.place_order
