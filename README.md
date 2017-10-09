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
The Brief
-------

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

How To Use
-----

* Fork this repo
* Load dependencies
```
$ gem install bundle
$ bundle install
```
* This app uses the 'twilio-ruby' gem and as such you will need an account for the following variables in text.rb:
  * account_sid  - Twilio Account SID
  * auth_token  - Twilio Auth Token
  * to_number   - Phone number for receiving messages
  * from_number  - Twilio-verified phone number for sending messages

* Load the app in pry or IRB
```
[1] pry(main)> require './lib/takeaway.rb'
```

Functionality
-----
```sh
[1] pry(main)> eat = TakeAway.new
=> #<TakeAway:0x00007fc4195954e0 @basket={}, @menu= #<Menu:0x00007fc4195954b8
   @dishes = {"sushi"=>5.99,
     "pizza"=>7.99,
     "burger"=>4.99,
     "pie"=>15.99,
     "water"=>2.99,
     "beer"=>3.99 }>>
[2] pry(main)> eat.order 'sushi'
=> "You've added 1 sushi dish to your basket"
[3] pry(main)> eat.empty_basket
=> "Your basket is now empty"
[4] pry(main)> eat.order 'pie', 2
=> "You've added 2 pie dishes to your basket"
[5] pry(main)> eat.order 'pizza'
=> "You've added 1 pizza dish to your basket"
[6] pry(main)> eat.show_basket
=> "pie x 2 = £31.98, pizza x 1 = £7.99"
[7] pry(main)> eat.order_total
=> "Your total is: £39.97"
[8] pry(main)> eat.complete_order(35.99)
RuntimeError: Sorry the amount given is incorrect
[9] pry(main)> eat.complete_order(39.97)
=> {}
```
Text Confirmation
-----
<img src=/img/text.png width='250'>

Further Developments
-----
* Add a basket class to delegate responsibility from takeaway which should only manage public interface
* Ability to order via text
* Read menu from a file
