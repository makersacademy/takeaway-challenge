# Takeaway Challenge
A ruby challenge that allows you to run a Takeaway, letting customers view the dishes available, create an order, and then verify an order after which an automatic sms will be sent using the Twilio API.

### Installing
Clone repo and if after changing into directory you see a prompt to rvm install a particular version of ruby please follow.
```
$ gem install bundle
$ bundle
```

### Testing
```
$ rspec
```

### Usage
```
2.5.0 :001 > require './lib/order.rb'
 => true 
2.5.0 :002 > order = Order.new
 => #<Order:0x0000000003727cb8 ...>
2.5.0 :003 > order.view_dishes
fish - £5
chips - £2
curry-sauce - £1
 => {"fish"=>5, "chips"=>2, "curry-sauce"=>1} 
2.5.0 :004 > order.create("chips*2,curry-sauce*3")
 => "chips*2,curry-sauce*3" 
2.5.0 :005 > order.verify(7)
 => "Order placed and sms message sent to confirm delivery" 
2.5.0 :006 > exit
```
