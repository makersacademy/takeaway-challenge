[![Build Status](https://travis-ci.org/tobenna/takeaway-challenge.svg?branch=master)](https://travis-ci.org/tobenna/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/github/tobenna/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/tobenna/takeaway-challenge?branch=master)

Takeaway Challenge
==================

Summary
-------

This is a Ruby app allows for customers to place orders from a restaurant using specific commands.
The customer would be receive a text message with the estimated delivery time at the end of the order.(Twilio Api)


Installation Instructions
-------

* Clone this repo
* install the `bundle` gem
* Run `bundle` in your terminal
* Create in .env file in the root directory
* Order food

Creating a .env file
-----

The following environment variables are needed in your .env file
* 'TWILIO_SID' -> Your Twillio SID
* 'TWILIO_TOKEN' -> Your Authentication token
* 'SOURCE_NUM' -> You Twillio source number
* 'DEST_NUM' -> The number you want to be receiving the text messages

A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.



Usage Example
-----

Adding items to the menu

```sh
2.2.3 :001 > m = Menu.new
 => #<Menu:0x007fb0dc074d08 @dish_klass=Dish, @dishes=[]>
2.2.3 :002 > m.add('Eba and soup', 200)
 => [#<Dish:0x007fb0da22dae8
  @name="Eba and soup",
  @price=#<BigDecimal:7fb0da22d958,'0.2E3',9(18)>>]
2.2.3 :003 > men.add('Pounded Yam', 150)
 => [#<Dish:0x007fb0da22dae8
  @name="Eba and soup",
  @price=#<BigDecimal:7fb0da22d958,'0.2E3',9(18)>>,
 #<Dish:0x007fb0da30deb8
  @name="Pounded Yam",
  @price=#<BigDecimal:7fb0da30dc60,'0.15E3',9(18)>>]
```
Ordering Items

```sh
2.2.3 :004 > r = Restaurant.new(menu_instance: m)
 => #<Restaurant:0x007fb0dd883728
2.2.3 :005 > r.view_menu
 => [#<Dish:0x007fb0da22dae8 @name="Eba and soup", @price=#<BigDecimal:7fb0da22d958,'0.2E3',9(18)>>,
 #<Dish:0x007fb0da30deb8 @name="Pounded Yam", @price=#<BigDecimal:7fb0da30dc60,'0.15E3',9(18)>>,
 #<Dish:0x007fb0da8708d8 @name="Fried Chicken", @price=#<BigDecimal:7fb0da8706a8,'0.3E3',9(18)>>,
 #<Dish:0x007fb0da054e60 @name="Borga", @price=#<BigDecimal:7fb0da054cf8,'0.1E4',9(18)>>]
2.2.3 :006 > r.order_add('Pounded Yam', 25)
 => [{:dish=>#<Dish:0x007fb0da30deb8 @name="Pounded Yam", @price=#<BigDecimal:7fb0da30dc60,'0.15E3',9(18)>>, :quantity=>25}]
2.2.3 :007 > r.order_add('Eba and soup', 15)
 => [{:dish=>#<Dish:0x007fb0da30deb8 @name="Pounded Yam", @price=#<BigDecimal:7fb0da30dc60,'0.15E3',9(18)>>, :quantity=>25},
 {:dish=>#<Dish:0x007fb0da22dae8 @name="Eba and soup", @price=#<BigDecimal:7fb0da22d958,'0.2E3',9(18)>>, :quantity=>15}]
2.2.3 :008 > r.order_summary
 => "Total: $6750.00"
2.2.3 :009 > r.checkout(6750)
```

After checkout SMS would be sent to the number in your ENV
