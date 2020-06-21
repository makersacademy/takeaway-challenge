Design
-------

* Top level class Takeaway will handle all the interface with the customer and access Menu class and Order class to satisfy the user story requirements.  
* Takeaway class will retrieve the menu when initialized and create a new instance of order class.
* Takeaway class will allow the customer to add items to the order through the 'add_to_order(item, qty) method.
* Takeaway class will return the order total in a string with "Order total is " and the order total.
* Takeaway class will print out the order items in strings returned to STD out.
* Takeaway class has a 'finalise_order' method that will call send_text method that uses the Twilio API to send a text message with the time of delivery (currently hardcoded) 
* Menu class will store the menu and have a lookup method to return the price for an item when queried.
* Menu class currently uses an array of hashes for food items and is hardcoded with some test values but has scope to take menu from other inputs.
* Order class will store a list of items with quantities and price.  Interface to the class is through an add method to add an item to the order and 'total' method to return the total price of the order.

Userstories
-----

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

Test Coverage
-----
```
COVERAGE:  97.59% -- 81/83 lines in 7 files
```

Usage Example
-----

* New Takeaway
```
irb(main):001:0> takeaway = Takeaway.new
=> #<Takeaway:0x0000000007c64510 @menu=#<Menu:0x0000000007c644e8 @menu=[{:item=>"food1", :price=>"1.00"}, {:item=>"food2", :price=>"2.00"}]>, @order=#<Order:0x0000000007c643a8 @order=[]>>
```

* Read Menu
```
irb(main):002:0> takeaway.read_menu
food1 @ £1.00 each
food2 @ £2.00 each
=> [{:item=>"food1", :price=>"1.00"}, {:item=>"food2", :price=>"2.00"}]
```

* Add Items to Order
```
irb(main):003:0> takeaway.add_to_order('food1', 1)
=> [{:item=>"food1", :qty=>1, :price=>1}]
irb(main):004:0> takeaway.add_to_order('food2', 2)
=> [{:item=>"food1", :qty=>1, :price=>1}, {:item=>"food2", :qty=>2, :price=>2}]
```

* Show Order
```
irb(main):005:0> takeaway.show_order
1x food1 @ £1 each
2x food2 @ £2 each
=> [{:item=>"food1", :qty=>1, :price=>1}, {:item=>"food2", :qty=>2, :price=>2}]
```

* Check Order Total
```
irb(main):006:0> takeaway.order_total
=> "Order total is: £5"
```

* Finalise Order
```
irb(main):007:0> takeaway.finalise_order
```

Follow Up
-----

* Tests are unit tests in menu and order but system tests without stubs in takeaway_spec.  Can be improved to stub the other classes to allow unit testing of Takeaway.
* Personal data removed which now breaks the send_text method.  Need to learn about github secrets and implement.

