Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

[![Build Status](https://travis-ci.org/rkclark/takeaway-challenge.svg?branch=master)](https://travis-ci.org/rkclark/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/rkclark/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/rkclark/takeaway-challenge?branch=master)

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

Approach
-----

I approached the challenge by creating the follow domain objects:
- `Takeaway`
- `Order`
- `Dish`
- `ArrayPrinter`
- `OrderTotalChecker`
- `SMSMessager`
- `TwilioClient`
- `SMSReceiver`

Which operate within this domain model:

![Domain Model](https://github.com/rkclark/takeaway-challenge/blob/master/img/Takeaway_domain_model.png)

The `Takeaway` module is the engine of the program and the primary point of user interaction. It will display the takeaway menu and allow a new `Order` to be created. Dishes can be added to this order along with an expected total. The `Order` is then placed via the `Takeaway`, which generates a command line as well as text message confirmation.

All of the modules were written using TDD, and a spec file exists for each one. I've used verified doubles extensively as well as stubbed methods.

The project reports 100% test coverage with Coveralls except for the SMSReceiver module which is still in development.


Usage
-----

The project contains a .pryrc file that will require the relevant files and assign a new `Takeaway` instance to `takeaway` with a `Menu` containing three instances of `Dish`.

Where `takeaway` is an instance of `Takeaway` and `order` is an instance of `Order`, the following commands can then be used:
- `takeaway.show_menu` (show takeaway menu)
- `takeaway.new_order` (return a new order)
- `order.add_dish(number, quantity)` (add a dish to the order, where number is the dish number as shown in the takeaway menu, and quantity is the desired quantity)
- `order.expected_total(total)` (adds the expected total to the order)
- `takeaway.place_order(order)` (places the order at the takeaway)

Here is an example pry session showing program usage:

```
[1] pry(main)> takeaway.show_menu
1. Pepperoni pizza 7.0
2. Hawaiian pizza 9.0
3. Meat Feast pizza 8.0=> nil
[2] pry(main)> order = takeaway.new_order;
[3] pry(main)> order.add_dish(1,2);
[4] pry(main)> order.add_dish(2,1);
[5] pry(main)> order.expected_total(23);
[6] pry(main)> order.ordered_dishes
=> {#<Dish:0x007ff81433b508 @name="Pepperoni pizza", @price=7.0>=>2, #<Dish:0x007ff81433b490 @name="Hawaiian pizza", @price=9.0>=>1}
[7] pry(main)> takeaway.place_order(order)
Your order has been accepted, you will receive a text message confirmaton shortly!=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC80bb171e8ce5d212877da1b83da3217d/Messages/SM979faf10a45c482e80ac2910ad9768a5>
[8] pry(main)> order.expected_total(24);
[9] pry(main)> takeaway.place_order(order)
RuntimeError: Your expected total order cost is wrong!
from /Users/rickclark/Documents/Makers/takeaway-challenge/lib/takeaway.rb:25:in `place_order'
```
