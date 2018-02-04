# Takeaway Challenge

I originally set about doing this challenge with a domain model that had the menu talking to an order class and a 'till' class. However after implementing this, I realised it made no sense to have the menu dictating the other classes, and so changed it to takeaway, and got rid of the till, outsourcing most of the functionality to other things, leaving the takeaway to just print the order.

I didn't quite finish the full implementation of everything, however my next steps were as follows:

* implement dynamic times in the phone class so that texts say delivery will occur one hour from when the order was placed.
* Test the twilio api and text messages are working correctly
* double the use of menu, order and phone class fully within the rspec tests.
* Fix current total and place order with a more elegant solution to the problem of totalling the order.
* Refactor order class to deal with 'final order' functionality currently being done by Takeaway class.
* Refactor all classes to ensure that they are adhering to the single responsibility principle.
* Refactor the menu and print order methods to look nicer.

Here is a quick run through of what I have so far:

```
takeaway = Takeaway.new
 => #<Takeaway:0x00007f97ae201820 @menu={:pizza=>10, :bolognese=>8, :risotto=>9, :red_wine=>4, :white_wine=>4.5}, @total=0, @order=#<Order:0x00007f97ae2016e0 @items=[]>, @phone=#<Phone:0x00007f97ae2017f8>, @final_order={}>
2.5.0 :002 > takeaway.new_order(:pizza)
 => [{:pizza=>10}]
2.5.0 :003 > takeaway.new_order(:pizza)
 => [{:pizza=>10}, {:pizza=>10}]
 takeaway.new_order(:bolognese)
 => [{:pizza=>10}, {:pizza=>10}, {:bolognese=>8}]
 takeaway.current_total
 => 28
 takeaway.place_order
you have ordered:
2 pizza
1 bolognese
for a total of £28.
```
