# **Takeaway Challenge**
==================

This is a ruby program that simulates a takeaway order service in which users can order food from a menu and receive a text confirmation for its delivery.

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

## Instructions

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

## User stories

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

## Domain models ##

### #1

| Objects   |  Messages |  
|    ---    |    ---    |
| Customer  |    see    |
| List/Menu |           |

#####  Customer → see → List

### #2

| Objects   |  Messages    |  
|    ---    |    ---       |
| Customer  | select/order |
|   Dishes  |              |

#####   Customer → select/order → Dishes

### #3

| Objects   |  Messages   |  
|    ---    |    ---      |
| Customer  |  checkout   |
|   Sum     | is_correct? |
|  Total    |             |

#####  Customer → checkout → Sum → is_correct? ← true || false ← (Total == Sum)?

### #4

| Objects   |  Messages     |  
|    ---    |    ---        |
| Customer  |finalise_order |
|           |  receive      |
|   Text    |      send     |

#####   Customer → finalise_order → send_text
#####   Customer ← receive ← Text


## Learning objectives ##


## Demonstration in IRB ##

```
2.3.1 :001 > dragon = TakeAway.new
 => #<TakeAway:0x000000026fc1b8 @basket=[], @menu={:wonton_soup=>2.99, :spring_roll=>2.99, :kung_po=>5.99, :fried_squid=>6.99, :chow_mein=>9.99, :roasted_duck=>9.99}>

2.3.1 :002 > dragon.see_menu
 => {:wonton_soup=>2.99, :spring_roll=>2.99, :kung_po=>5.99, :fried_squid=>6.99, :chow_mein=>9.99, :roasted_duck=>9.99}

2.3.1 :003 > dragon.order(:wonton_soup)
 => "1x wonton_soup(s) added to your basket."

2.3.1 :004 > dragon.order(:spring_roll, 3)
 => "3x spring_roll(s) added to your basket."

2.3.1 :005 > dragon.see_basket
 => [{:wonton_soup=>2.99}, {:spring_roll=>2.99}, {:spring_roll=>2.99}, {:spring_roll=>2.99}]

2.3.1 :006 > dragon.basket_summary
 => "Total = £11.96, Basket = [{:wonton_soup=>2.99}, {:spring_roll=>2.99}, {:spring_roll=>2.99}, {:spring_roll=>2.99}]"

2.3.1 :007 > dragon.checkout(11.45)
RuntimeError: Please pay the correct amount of £11.96.
	from /home/richard/Documents/Projects/takeaway-challenge/lib/takeaway.rb:46:in `checkout'
	from (irb):7
	from /home/richard/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'

2.3.1 :008 > dragon.checkout(11.96)
 => "Thank you for your payment of £11.96. Your food will be delivered before 22:52."

```

## What I learned: ##


## What I struggled with: ##


## Outlook ##
