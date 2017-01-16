#DOMAIN MODEL

##User Story 1

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

-------------------------------------------------------
Customer | to check if want to make an order
Menu    | list dishes and prices
```

###Feature Tests:

```
require './lib/customer.rb'
customer = Customer.new
customer.menu

2.3.1 :001 > require './lib/customer'
 => true
2.3.1 :002 > customer = Customer.new
NameError: uninitialized constant Customer
	from (irb):2
	from /Users/pedrocastanheira/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
2.3.1 :003 > customer.menu
NoMethodError: undefined method `menu' for nil:NilClass
	from (irb):3
	from /Users/pedrocastanheira/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
```

###Unit Test:

```
For the unit tests I used a csv test file "list_dishes_test" in order to be able to fully test Menu class methods. For that I did change the FILANAME constant the following:

		before :each do
			Menu.send(:remove_const, "FILENAME")
			Menu::FILENAME = "./lib/list_dishes_test.csv"
		end
```

##User Story 2

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

-------------------------------------------------------
Customer | to order the meal
Order   | select some number of several available dishes
```

###Feature Tests:

```
require './lib/customer.rb'
customer = Customer.new
customer.menu
```

##User Story 3

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

-------------------------------------------------------
Customer | to verify that my order is correct
Bill    | check that the total I have been given matches the sum of the various dishes in my order
```

###Feature Tests:

```
```

##User Story 4

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

-------------------------------------------------------
Customer | to reassure that my order will be delivered on time
Order  | receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

###Feature Tests:

```
```

##Diagram

```
Customer              Menu              Order                 Bill            OrderTracker
-------------------------------------------------------------------------------------------

   - ask -------------->
   - select dishes ---->
   - place order ------------------------->
                                          <------- Given total -
   - order detailed total ---------------->
   - ask feedback ---------------------------------------------------------------->
   <---------------------------------------------------------------- send message -
```
