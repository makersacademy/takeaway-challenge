# **Takeaway Challenge**
==================

This is a ruby program that simulates a takeaway order service in which users can order food from a menu and receive a text confirmation with an estimated delivery time.

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

* OOP
* SRP
* Class extraction
* Dependency injection

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
![twilio text](https://cloud.githubusercontent.com/assets/18379191/16903101/f5b89ddc-4c6b-11e6-978e-3d19de6058b5.PNG)

## What I learned: ##

* How to work with hashes nested in an array using the select. and reduce. methods.
* Dotenv can be used to protect private information.
* How to incorporate API's into my code.
* More about private methods and when to use them such as with predicative methods (eg.is_correct?).
* Solidified my knowledge of the TDD workflow.
* Calling methods from within methods so that they only have a single responsibility.

## What I struggled with: ##

* Doubles
* Stubbing out the #send_text method whilst keeping my #checkout test.
* I am still struggling with class extraction but most of all dependency injection and when to use it.


## Outlook ##

* My code is extremely inefficient and messy at the moment. My goal was to write all the code and get the program working before refactoring with class extraction and dependency injection.
* However, I am struggling to work out which classes toe xtract first and how to move their methods and tests out of the TakeAway files.
* I will need to extract a lot of the code into Order and Messenger classes with perhaps a Menu case in case the menu changes at a restaurant. At the moment, there are a lot of order methods and it would be ideal for them to be in their own Order class to simplify the TakeAway class and follow SRP.
* I will therefore need to inject these classes into the initialise method of TakeAway so that new Order and Messenger instances are created upon "dragon" creation.
