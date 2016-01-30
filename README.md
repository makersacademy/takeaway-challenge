Takeaway Challenge
==================

Implementation
--------

I created a features test file to guide my design, which consists of three classes - takeaway, menu and calculator. Each class has a corresponding spec file for unit tests, which are each mocked and stubbed to remove dependencies on each other, and the main class has been refactored for dependency injection. My implementation is fully functional when spiking in irb/pry, and allows for a confirmation text message to be sent via the Twilio API. This API has disabled by way of stubs in the feature and unit tests. Dotenv gem was utilized to hide the Twilio account SID and authentication tokens, and the .env file added to .gitignore. 

In my feature test, the following user stories were implemented:

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

Instructions
-------

The takeaway object is initialized with three parameters - menu, calculator, twilio. 

```
[6] pry(main)> takeaway = Takeaway.new(Menu.new, Calculator.new,Twilio::REST::Client.new(Dotenv.load["ACCOUNT_SID"], Dotenv.load["AUTH_TOKEN"]))
=> #<Takeaway:0x007fbcdb5f7c98
 @calculator=#<Calculator:0x007fbcdb635390>,
 @menu=
  #<Menu:0x007fbcdb6353e0
   @show={:ribs=>3, :beef=>4, :rolls=>3, :chips=>2, :pies=>5}>,
 @twilio=
  <Twilio::REST::Client @account_sid=###>>
[7] pry(main)> takeaway.show_menu
=> {:ribs=>3, :beef=>4, :rolls=>3, :chips=>2, :pies=>5}
[8] pry(main)> takeaway.select({beef: 2, rolls: 3}, 19)
=> {:beef=>2, :rolls=>3}
[9] pry(main)> takeaway.confirm_order
RuntimeError: incorrect bill amount
from /Users/GotWai/Dropbox/Projects/takeaway-challenge/lib/takeaway.rb:21:in `confirm_order'
[10] pry(main)> takeaway.select({beef: 2, rolls: 3}, 17)
=> {:beef=>2, :rolls=>3}
[11] pry(main)> takeaway.confirm_order
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/###>
```

Build Badge
------------------

[![Build Status](https://travis-ci.org/ggwc82/takeaway-challenge.svg?branch=master)](https://travis-ci.org/ggwc82/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/ggwc82/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/ggwc82/takeaway-challenge?branch=master)
