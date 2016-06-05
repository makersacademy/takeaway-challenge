Takeaway Challenge
==================

Makers Academy Week 2 Weekend Challenge
-----

Building a program to print a menu. Order from the menu, confirming the order and then sending a text to confirm order and give delivery time estimate.

IRB Example
-----

2.3.1 :002 > menu = {"bread" => 1.40, "chicken" => 4.00, "rice" => 2.00}
 => {"bread"=>1.4, "chicken"=>4.0, "rice"=>2.0}
2.3.1 :003 > customer = Customer.new(menu)
 => #<Customer:0x007fdfc0af2060 @printer=#<Printer:0x007fdfc0af2038>, @order=#<Order:0x007fdfc0af2010 @menu={"bread"=>1.4, "chicken"=>4.0, "rice"=>2.0}, @order={}, @total_price=0>, @menu={"bread"=>1.4, "chicken"=>4.0, "rice"=>2.0}>
2.3.1 :004 > customer.choose("bread", 3)
 => 3
2.3.1 :005 > customer.choose("chicken", 1)
 => 1
2.3.1 :006 > customer.choose("rice", 2)
 => 2
2.3.1 :007 > customer.order.total_price
 => 12.2
2.3.1 :008 > customer.pay(12.2)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/******/Messages/******>


User Stories
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

Progress
-----

Managed to implement the program. Did not manage to finis the rspec tests, unable to get the Messenger rspec to work with Twilio.
