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

Task
-----

#### User Stories

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

#### Hints on functionality implementation:
  * Ensure to have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage gems
  * Make sure that Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

Approach to solving the challenge
-----
#### Domain model

###### Processed user stories

> Customer -> can **see Menu**

> Menu = list of Dishes

> Dish has name and price

> Customer -> can select from Menu and **place Order** (receive total amount and confirmation text message back)

>  - Customer -> will receive text Message "Thank you! Your order for the total amount of £[x] was placed and will be delivered before 18:52"

> Order = list of *selected* Dishes, their quantities, total amount

> Customer -> can **compare Order**'s total amount to Menu prices


#### Domain model diagram

```
Customer    Menu    Order     Dish    Message
----------------------------------------------
(1) -see_menu->
             |
             -load_dishes_from_file
                                |
             <--hash of dishes---            
             |
    <-print_menu

(2) ----place_order-->
                     |
            <--------select_from_menu
            |
            --hash of dishes with quantities
                     |
    <--total_price----
                     |
                      ---send_message----->
                                          |
    <------message with time and amount----

(3) --compare_order--
                     |
    <--detailed_info_about_order              

```


Suggested usage
-----
```
[1] pry(main)> take_away = TakeAway.new
[2] pry(main)> take_away.read_menu
                  Momofuku Noodle Bar, NY
                     -----------------

                           Daily

                1:  Wild Scallop Crudo, $17
               beets, horseradish, olive oil

            2:  Black Winter Truffle Ramen, $48
             Périgord truffles, egg yolk, Hozon

              3:  Smothered Katsu Chicken, $24
            pickled green beans, shiitake gravy

                 4:  Brussels Sprouts, $14
                   miso, chili, pine nuts

                            Buns

                      5:  Shrimp, $13
           spicy mayo, pickled red onion, iceberg

                     6:  Shiitake, $13
                 hoisin, scallion, cucumber

                 7:  Chicken Meatball, $13
              jalapeño, iceberg, paprika mayo

                      8:  Brisket, $13
          horseradish, pickled red onion, cucumber

                        Small Plates

                    9:  Swiss Chard, $8
           Asian pear, sesame, kimchi vinaigrette

                  10:  Spicy Cucumber, $8
                scallion, togarashi, almonds

               11:  Smoked Chicken Wings, $15
              pickled chili, garlic, scallion

               12:  BBQ Pork Belly Ssäm, $17
                    lettuce cups, kimchi
[3] pry(main)> take_away.add_to_order(6,1)
1x Shiitake(s) added to your busket.
=> nil
[4] pry(main)> take_away.add_to_order(1,3)
3x Wild Scallop Crudo(s) added to your busket.
=> nil
[5] pry(main)> take_away.add_to_order(16,1)
RuntimeError: Please select dish from the menu
[6] pry(main)> take_away.order_details
RuntimeError: Order can't be found: looks like it hasn't been placed yet. Please place the order first.
from
[7] pry(main)> take_away.place_order
The From phone number +4411332062011 is not a valid, SMS-capable inbound phone number or short code for your account.
You have placed your order, total: $64.
=> 64
[8] pry(main)> take_away.order_details
                   Details of your order:
                     -----------------

                  Shiitake, $13 x 1 = $13

             Wild Scallop Crudo, $17 x 3 = $51

                         Total: $64
                 Thank you for your order!

=> nil
```

Build Badges
------------------

[![Build Status](https://travis-ci.org/kateloschinina/takeaway-challenge.svg?branch=master)](https://travis-ci.org/kateloschinina/takeaway-challenge.svg?branch=master)

[![Coverage Status](https://coveralls.io/repos/github/kateloschinina/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/kateloschinina/takeaway-challenge?branch=master)
