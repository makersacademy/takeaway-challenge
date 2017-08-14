Takeaway Challenge
==================
Task
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

#Tests#

Menu
  returns menu via read method
  uploads new menu
  checks items are on the menu
  looks up items price

Order
  adds items to hash
  summarises order in hash
  returns order total

Takeaway
  uploads a hash to menu instance
  passes read method to menu instance
  prints returned menu
  prints confirmation for added products
  prints rejection for not present products
  puts order summary
  checks amount paid is correct
  sends payment to order instance


#Features#

p t = Takeaway.new("pizza" => 1.99, "pasta" => 2.99, "spam" => 3.99)
=> #<Takeaway:0x007fac1ec03ec0 @menu=#<Menu:0x007fac1ec03e98 @menu={"pizza"=>1.99, "pasta"=>2.99, "spam"=>3.99}>, @order=#<Order:0x007fac1ec03e70 @order={}, @summary=[]>, @messager=#<Messager:0x007fac1ec03da8>>

p t.order('spame')
=>Sorry, no spame available
=>nil

p t.order 'spam', 3
=>3x spam(s) added to order
=>nil

p t.order 'pasta'
=>1x pasta(s) added to order
=>nil

p t.order_summary
=>3x spam = £11.97
=>1x pasta = £2.99

p t.order_total
=>[{:item=>"spam", :quant=>3, :total=>11.97}, =>{:item=>"pasta", :quant=>1, :total=>2.99}]
=>The total bill is £14.96
