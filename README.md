Robs Takeaway Challenge
==========


```
         _....._
     _.:`.--|--.`:._
   .: .'\o  | o /'. '.
  // '.  \ o|  /  o '.\
 //'._o'. \ |o/ o_.-'o\\
 || o '-.'.\|/.-' o   ||
 ||--o--o-->|<o-----o-||
 \\  o _.-'/|\'-._o  o//
  \\.-'  o/ |o\ o '-.//
   '.'.o / o|  \ o.'.'
     `-:/.__|__o\:-'
        `"--=--"`

```

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)



### How to use:

* Fork and clone this repo
* Run  ```bundle install```
* Open your favourite shell to use


```ruby
[1] pry(main)> require './lib/takeaway.rb'
=> true
[2] pry(main)> takeaway = Takeaway.new
=> #<Takeaway:0x007f83628247d0 @order=#<Order:0x007f83620a12b0 @basket={},@bill_total=[],@menu=#<Menu:0x007f83620a0d38 @menu={"Margarita"=>12,"The special"=>18,"Chicago classic"=>18,"Meat & more meat"=>19,"Fresh spinach"=>14,"Super veggie"=>18,"Bacon bbq chicken"=>18,"Chicken sausage deluxe"=>18}>,@order_qty=0,@sms_message="">,@sms=#<Sms:0xxxxxxxxxxxxxxx @client=<Twilio::REST::Client @account_sid=ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx>>>
[3] pry(main)> takeaway.order.menu
=> #<Menu:0x007f7f5ab34620
 @menu=
  {"Margarita"=>12,
   "The special"=>18,
   "Chicago classic"=>18,
   "Meat & more meat"=>19,
   "Fresh spinach"=>14,
   "Super veggie"=>18,
   "Bacon bbq chicken"=>18,
   "Chicken sausage deluxe"=>18}>
[4] pry(main)> takeaway.place_order("Margarita,1,The special,2,=£48")
 => "Thanks for your order, a confirmation message has been sent"
[5] pry(main)>
 ```

### Future Plans

* Spend more time on readme

* To increase user interaction

* To make user input more realistic

* To implement SMS order placing
