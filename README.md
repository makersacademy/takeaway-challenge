Takeaway Challenge
==================

What is it?
---------

Takeaway challenge is a take-away simulation program made in ruby using OOP and
BDD/TDD methodologies, a client is able to select dishes from the takeaway
menu and place an order,
an SMS is sent confirming the order and the time of the delivery.
The User stories were the following:

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


Design Process
-------
I tried using SOLID principles for this challenge to get into the habit
of proper programming. By using encapsulation, SRP, DIP.
I also followed the BDD life cycle.
* First I isolated the different user stories, eg.:
  **As a customer
  So that I can check if I want to order something
  I would like to see a list of dishes with prices**
* I created the acceptance tests (or feature tests):
  **Restaurant, Order, SMS**
* Then multiple unit tests for every acceptance test eg.:
  **Order: current_order, place_order...**
* And last the implementation:
  **class Order end, class Sms end**


Build Process
-----

I made this challenge the TDD way, by writing the Rspec Unit/Feature tests
before my actual code. I created the Unit tests the London way as DRY
as i could, and the feature test using the Chicago way.

At first i created the whole system into one file/class and then i decided that
i had functionalities that could be separated into different classes, then i
created the Order class that's responsible for anything related to orders, and
the Sms class handling our sms responses. I also configured Rspec accordingly
to reflect the different class separation by using mocks and stubs.

For the SMS responses i used the Twilio's API. I also attempted to make my
program able to receive incoming texts and place an order, for this to happen i
needed to convert it into a web app using Sinatra framework,
which i didn't spend too much time creating the whole app,
as we haven't covered web technologies yet.
I made only the part that you can send an sms and get an automated reply back.
the url that hosts the sms-receive functionality:
http://vps193319.ovh.net:4567/sms_receive


Example running this program on IRB
-----

```
[1] pry(main)> require './lib/ristorante'
=> true
[2] pry(main)> r = Ristorante.new
=> #<Ristorante:0x007fe441bdd5a8
 @order=
  #<Order:0x007fe441bdd580
   @current_order=[],
   @order_log=[],
   @order_total=0,
   @sms=
    #<Sms:0x007fe441bdd558 @account_sid="AC5f0916482a7dd3822a118d4b27a4e49b">>>
[3] pry(main)> r.menu
=> {1=>[:egg_fried_rice, 3],
 2=>[:chicken_legs, 2],
 3=>[:miso_soup, 3],
 4=>[:sofrito, 5],
 5=>[:pasta, 1],
 6=>[:garlic_bread, 1.5]}
[4] pry(main)> r.select_dishes(1, 2)
=> 6
[5] pry(main)> r.current_order
=> nil
[6] pry(main)> r
=> #<Ristorante:0x007fe441bdd5a8
 @menu=
  {1=>[:egg_fried_rice, 3],
   2=>[:chicken_legs, 2],
   3=>[:miso_soup, 3],
   4=>[:sofrito, 5],
   5=>[:pasta, 1],
   6=>[:garlic_bread, 1.5]},
 @order=
  #<Order:0x007fe441bdd580
   @current_order=[{:dish=>:egg_fried_rice, :quantity=>2, :price=>6}],
   @order_log=[],
   @order_total=6,
   @sms=
    #<Sms:0x007fe441bdd558 @account_sid="AC5f0916482a7dd3822a118d4b27a4e49b">>>
[7] pry(main)> r.order.current_order
=> [{:dish=>:egg_fried_rice, :quantity=>2, :price=>6}]
[8] pry(main)> r.select_dishes(3, 2)
=> 12
[9] pry(main)> r.order.current_order
=> [{:dish=>:egg_fried_rice, :quantity=>2, :price=>6},
 {:dish=>:miso_soup, :quantity=>2, :price=>6}]
[10] pry(main)> r.order.order_total
=> 12
[11] pry(main)> r.place_order
=> 0
[12] pry(main)> r.order.current_order
=> []
[13] pry(main)> r.order.order_total
=> 0
[14] pry(main)>
```
