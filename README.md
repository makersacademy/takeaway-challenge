# Takeaway Challenge

The program allows to order food from your favorite take-away. It displays a list of dishes with prices, where you can chose several number of dishes from. Once the order has been placed it displayes the list of choosen dishes with the total for the user to confirm it with Yes or No.
If the total is confirmed then the custormer receives a message with the delivery time, that is usually one hour later.

## Domain model

* This is the domain model extracted from the user stories

Takeaway   --->  menu  --->  LIST
Takeaway  --->  select  --->  Order
Order   --->  return  --->  selected dishes
Takeaway   --->  check   --->  total
total(not correct)  ---> raise_error
Takeaway   --->  place_order  --->  Message 

## Getting started

* Please clone the repository typing on your terminal: `git clone git@github.com:l-palermo/takeaway-challenge.git`
* Then run `bundle` to install dependecies

## How to use the software

* From the folder `TAKEAWAY-CHALLENGHE` run `IRB` then `require './lib/takeaway.rb'` 

### Example of usage

MAKERSs-MBP-5:takeaway-challenge student$ irb -r './lib/takeaway.rb'
2.5.0 :001 > takeaway = Takeaway.new
 => #<Takeaway:0x00007f7eddac4f50 @message=Message, @order=Order> 
2.5.0 :002 > takeaway.menu
 => {:olives=>4.0, :cheese_board=>10.0, :pizza=>8.0, :carbonara=>10.0, :chicken=>12.0, :salad=>8.0, :burrata=>6.0, :steak=>15.0, :brownie=>5.0} 
2.5.0 :003 > takeaway.select
Type the dish name, close to end
olives
Quantity ?
5
Next dish
pizza
Quantity ?
6
Next dish
burrata
Quantity ?
8
Next dish
close
 => {:olives=>5, :pizza=>6, :burrata=>8} 
2.5.0 :004 > takeaway.order.total
 => 116.0 
2.5.0 :005 > takeaway.check_total
Enter the total
116
 => "The total match the sum of 116£" 
2.5.0 :006 > takeaway.place_order
 => <Twilio.Api.V2010.MessageInstance account_sid:
