#Takeaway challenge
The Takeaway challenge is weekend challenge given by Makers Academy. The aim is to create a software for a takeaway shop. The software is expected to meet the following four user story requirements.

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
The software is built using TDD.

# Approach to solving challenge
I decided to firstly look at the user stories and translate them into a domain model to have a clearer understanding of the objects and messages. I drafted a domain model flow chart to clearly display what objects and messages where needed to build the software.

```sh
2.5.0 :004 > takeaway = Takeaway.new
 => #<Takeaway:0x00007f9cfd015ad0 @menu=#<Menu:0x00007f9cfd015aa8>, @order=#<Order:0x00007f9cfd015a80 @basket={}>>
2.5.0 :005 > takeaway.print_menu
 => {"Burger"=>1, "chips"=>2, "chicken"=>3, "drink"=>1}
2.5.0 :006 > takeaway.add_to_basket('chips' ,2)
 => 2
2.5.0 :007 > takeaway.add_to_basket('Burger' ,1)
 => 1
2.5.0 :008 > takeaway.order_summary
chips x 2 total: £4
Burger x 1 total: £1
=> {"chips"=>2, "Burger"=>1}
2.5.0 :009 > takeaway.order_total
Total: £5

```
