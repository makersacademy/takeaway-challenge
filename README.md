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

## Makers Academy - Weekend 2 Challenge

A piece of software that lets the user order some food from a takeaway and sends a delivery confimation text with an estimated delivery time.

Text messaging is handled by the `twilio-ruby` gem API and sensitive user authentication data is hidden with use of the `dotenv` gem.

Feature tests for each user story are included and demonstrated below.

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

## Getting started

1. Clone this repo `git clone git@github.com:Sindex42/takeaway-challenge.git`
2. Change directory `cd takeaway-challenge`
3. Run bundle to install dependencies `bundle install`
4. Run the tests with `rspec` in the project root folder


## Approach

I started by creating a Dish class that would be able to create dishes and add them to a Menu class. After making an Order class to deal with selecting dishes, I realised this was more tedious than I originally thought and scrapped both of them in favour of a simple ruby file containg a hash of available dishes.

I separated the Takeaway class from the Order class early on, to preserve SRP. Figuring out how to integrate the Twilio messaging function was hard and could ben improved on. Testing the Message class needs further work as the only tests I could figure out turned out to be completely vacuous. 


## Usage

Use pry or a similar REPL to interact with the program eg.:

Getting started

```
[1] pry(main)> require "./lib/takeaway"
=> true
[2] pry(main)> burger_bar = Takeaway.new
 ...

```

Viewing the menu

```
[3] pry(main)> burger_bar.menu
=> {"Hamburger"=>5,
 "Cheeseburger"=>6,
 "Bacon Burger"=>7,
 "Bacon Cheeseburger"=>8,
 "Hot Dog"=>3,
 "Veggie Burger"=>4,
 "BLT"=>6}
```

Ordering and verifying the total amount

```
[4] pry(main)> burger_bar.add_to_order("Bacon Cheeseburger", 2)
=> 2
[5] pry(main)> burger_bar.add_to_order("Hot Dog", 1)
=> 1
[6] pry(main)> burger_bar.basket
=> ["Bacon Cheeseburger", "Bacon Cheeseburger", "Hot Dog"]
[7] pry(main)> burger_bar.total
=> 19
```

Completing an order  

```
[8] pry(main)> burger_bar.checkout
=> "Thank you! Your order was placed and will be delivered before 22:16"
```

