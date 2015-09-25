The task is to write a takeaway program with the following user story:

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

I have 2 classes:
- Customer
- Order

Order can add dish, knows the total, knows if it is empty.
Each customer has an order.
Customer can add dish to an order, can see his order, can check total, can place order.

Also I have 2 modules:
- Menu
- TwilioText

Customer includes Menu to see the menu, Order includes menu to see the price of each dish (to calculate total).
Customer also includes TwilioText to place order and receive text.

irb example:

```irb

$irb

:001 > customer = Customer.new
 => #<Customer:0x007fb55e014b98 @order=#<Order:0x007fb55e014b70 @dishes={}>>
:002 > customer.add_dish(:pizza, 1)
 => 1
:003 > customer.add_dish(:dip, 1)
 => 1
:004 > customer.my_list
 => {:pizza=>1, :dip=>1}
:005 > customer.total_correct(16)
 => false
:006 > customer.total_correct(13.48)
 => true
:007 > customer.place_order(13.48)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC5c7f51a9ef5ab4cae242e91d8e98a940/Messages/SM8d4abc08e7cd415bb888a06fa7845991>

```



