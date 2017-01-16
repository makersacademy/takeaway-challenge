Takeaway Challenge
==================
### How to use

![alt tag](https://raw.githubusercontent.com/J-Marriott/takeaway-challenge/master/images/instructions.png)


Task
-----

######User Story 1
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

1)	Created takeaway.rb and takeaway_spec.rb <br>
2)	Defined module Order <br>
3) 	Defined read_menu method <br>
4) 	Defined module Menu <br>
5) 	Menu stored in Hash in Menu module <br>
6) 	read_menu method formats menu_list and displays to user <br?

######User Story 2

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
1)	Takeaway initializes with empty basket
2)	add_to_order method defined that checks if item is available and returns hash with price that can be stored in basket <br>
3)	order method calls add_to_order and adds returned hash to basket <br>
4) 	added extra parameter to order to allow addition of multiple items in one call <br>

######User Story 3

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
1)	total method defined that displays formatted total in GBP <br>

######User Story 4

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

1) Implemented use of Twilio API to send text message on completion of checkout <br>
2) Unit test implemented with stubbing of text message service to prevent a bazillion texts being sent out on my account <br>
3) Refactoring
