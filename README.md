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

Intro
-----

This is a program all about how, your burgers get flipped, turned upside down. So I'd like to take a minute here just to say; that this program handles online orders for a take-away.

Functionality
-------------

1. Order
  * Collect dishes selected from the menu into a meal.
  * Calculate total cost of meal from individual dish prices.
  * Allows a user to view how many of each dish their is in their meal, and price.
  * Allows user to confirm their final order.
  * Sends a text to the user to confirm their order has been placed.
2. Menu
  * List all available dishes and prices.
  * Let's a customer add a dish to their meal.
3. Dish
  * Contains the name, description and price of an individual dish.
4. Confirmation text
  * Has a message thanking customer for their order.
  * Gives an estimated delivery time, which is 1 hour from the time of order.

  Project Structure
  -----------------
```
  ├── CONTRIBUTING.md
  ├── Gemfile
  ├── Gemfile.lock
  ├── LICENSE
  ├── README.md
  ├── Rakefile
  ├── docs
  │   └── review.md
  ├── lib
  │   ├── confirmation_text.rb
  │   ├── dish.rb
  │   ├── menu.rb
  │   └── order.rb
  └── spec
      ├── confirmation_text_spec.rb
      ├── dish_spec.rb
      ├── feature_spec.rb
      ├── menu_spec.rb
      ├── order_spec.rb
      └── spec_helper.rb
```
Usage
-----
To run:
```
$ ruby ./lib/order.rb
```
To install required files and prerequisites:

```
$ gem install bundle
$ bundle
```

Development Methodology
-----------------------

This program was built using Test Driven Development

Tools Used
----------
- Language:
  Ruby - v2.4.0p0 (2016-12-24 revision 57164)

- Testing Framework:
  Rspec - v3.5.4

- Cybernetic style enforcement from the future:
  Rubocop - v0.48.1
  
- SMS Messaging API: Twilio - 4.13.0

- Domain-specific language: Sinatra - 2.0.0 

Acknowledgement
---------------
Thanks to Chris Harrop (github: bannastre) for writing a great README which I pilfered from mercilessly.

Thanks to Makers Academy (github: makersacademy) and Sam Morgan (github: sjmog) for teaching me to do the code good(we hope.)

Thanks to Charlotte Feather (github: Charliefea), Charlotte Fereday (github: charlottebrf), Michael Jacobson (github: michaelbjacobson) and Kye Bracey (github: Kynosaur) for showing me how to check my output before I wreck my output.
