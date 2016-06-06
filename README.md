[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

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
The aim of the challenge was to create a Takeaway restaurant that has a menu and allows a customer to order food, see the breakdown of the order, and checkout. When checked out, the customer received a message, confirming that they will receive their order in an hour.

Instructions on how to load
-------
1 - Clone this repository by using `git clone [html link of this repo]`
2 - If you do not have bundle first do `gem install bundle` and then `bundle` in your command line
3 - `twilio-ruby` gem has been used for sending SMS messages. Should you wish to use this, you will need to register to twilio, and then create an `.env` file , which will include account sid, auth token, the number you will get from twilio and the number you will like to send the message to. `.env` file will keep the sensitive information private, and it is read by the `dotenv` gem.

Example on how to use:

```sh
2.3.1 :001 > require "./lib/takeaway"
 => true
2.3.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fe2a302b010 @menu=#<Menu:0x007fe2a302afe8>, @order=#<Order:0x007fe2a302ae80 @basket={}>>
2.3.1 :003 > takeaway.see_menu
 => {:margarita=>5, :mushroom_pizza=>6, :pepperoni_pizza=>7, :chips=>3, :soft_drink=>2, :alcohol=>5}
2.3.1 :004 > takeaway.order_food(3, "soft_drink")
 => "3 x soft_drink(s) added to the basket."
2.3.1 :005 > takeaway.order_food("chips")
 => "1 x chips(s) added to the basket."
2.3.1 :006 > takeaway.order_food("chips")
Chips is already in the basket. Would you like to add another one? (Yes/No)
No
 => "Thank you for confirming. Chips is not added to the basket."
2.3.1 :007 > takeaway.order_food("margarita")
 => "1 x margarita(s) added to the basket."
2.3.1 :008 > takeaway.total
 => "The total cost of your basket is £14."
2.3.1 :009 > takeaway.check_total(14)
 => "You have ordered: 3 x soft_drink(s) = £6\n1 x chips(s) = £3\n1 x margarita(s) = £5\nThe total is: £14."
2.3.1 :010 > takeaway.checkout
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC9*********/Messages/SM7**********>
```
*
