## Takeaway Challenge
==================
Second weekend challenge of Makers Academy. In this challenge we are required to build software for a takeaway system. The text sending functionality is implemented using Twilio API.


## User stories
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

## Functionality
-------------

* Has a list of dishes with prices
* Places order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method raises an error, otherwise the customer is sent a text saying that the oder was placed successfully and that it it will be delivered 30 minutes from now.
* The text sending functionality is implemented using the Twilio API
* Uses the twilio-ruby gem to access the API

## Running
-------------
IRB usage

```
2.4.0 :001 > Dir[__dir__ + '/lib/*.rb'].each { |file| require file }
 => ["./lib/menu.rb", "./lib/messenger.rb", "./lib/takeaway.rb"]
2.4.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007f997f871e80 @menu=#<Menu:0x007f997f871e30 @dishes={"biryani"=>3.99, "butter chicken"=>4.5, "chicken tikka"=>3.5, "dal"=>1.99, "tandoori chicken"=>4.99}>, @current_order={}>
2.4.0 :003 > takeaway.menu.dishes
 => {"biryani"=>3.99, "butter chicken"=>4.5, "chicken tikka"=>3.5, "dal"=>1.99, "tandoori chicken"=>4.99}
2.4.0 :004 > takeaway.order 'biryani', 2
 => 2
2.4.0 :005 > takeaway.order 'chicken tikka'
 => 1
2.4.0 :006 > takeaway.order 'tandoori chicken', 2
 => 2
2.4.0 :007 > takeaway.order_list
2x biryani = £7.98
1x chicken tikka = £3.50
2x tandoori chicken = £9.98
 => "2x biryani = £7.98\n1x chicken tikka = £3.50\n2x tandoori chicken = £9.98"
2.4.0 :008 > takeaway.show_total
 => "Total: £21.46"
2.4.0 :009 > takeaway.complete_order(21.46)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC2d9d44552b5415638489da2b5fb7076d/Messages/SMecc55ba4e18047ecb827253fb361bdaa>
2.4.0 :010 >
```
