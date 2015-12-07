#Takeaway Challenge

[![Build Status](https://travis-ci.org/hibreez/takeaway-challenge.svg?branch=master)](https://travis-ci.org/hibreez/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/hibreez/takeaway-challenge/badge.png)](https://coveralls.io/r/hibreez/takeaway-challenge)

Solution to [takeaway challenge](https://github.com/makersacademy/takeaway-challenge).

####Installation  
`git clone git@github.com:hibreez/takeaway-challenge.git`  
`cd takeaway-challenge`  
`gem install bundle`  
`bundle`

####Usage
```
[1] pry(main)> require './lib/takeaway.rb'
  => true

[2] pry(main)> chinese = Takeaway.new
  => #<Takeaway:0x007fb1438476e0
  @order_klass=Order,
  @phone=#<Phone:0x0... @client=<Twilio::REST::Client @account_sid=***>>,
  @the_menu=#<Menu:0x0...>>

[3] pry(main)> chinese.menu
  Spring Rolls.............£2.99
  Crispy Duck..............£6.99
  => {"Spring Rolls"=>2.99, "Crispy Duck"=>6.99}

[4] pry(main)> chinese.place_order('99 Carrots', 9.99)
  RuntimeError: Cannot place order: Carrots not available!
  from .../takeaway-challenge/lib/takeaway.rb:23:in `place_order'

[5] pry(main)> chinese.place_order('2 Spring Rolls, 1 Crispy Duck', 11.97)
  RuntimeError: Cannot place order: total does not match pricing!
  from .../takeaway-challenge/lib/takeaway.rb:24:in `place_order'

[6] pry(main)> chinese.place_order('2 Spring Rolls, 1 Crispy Duck', 12.97)
  => <Twilio::REST::Message @path=/2010-04-01/Accounts/***/Messages/***>
```
