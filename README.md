# Maker's Week 2: Weekend challenge
This challenge was the second of my Maker's weekend challenge, intended to be done alone to reinforce the week's learning and concepts.
This was the first time in Maker's I came across actual difficulty and had to go away to strategise. 
Upon realising this was essentially a challenge of RSpec doubles and dependency injection I soon figured it out.

The necessary skills covered in this challenge were:

* TDD and RSpec
* Knowing when to split a class and how to add functionality
* Basic class structure and attributes


Successes
-----

* Successful usage of complex doubles with stubbed attributes and methods
* Multiple uses of dependency injection to create a flow of functionality from dependent to controlling objects
* A successful use of the Twilio gem to send a text
* Debugged Twilio API using their documentation
------

To improve
-----
* Test coverage is incomplete as I was unsure how to test for the output of the text messages timer function without complex REGEX
* Current iteration satisfies User story but is not particularly user friendly and would make for a poor product due to it being REPL only
* Improper usage of environment variables meant that the Twilio IRB test had to be hard coded with real info, requires further study
* Testing for Twilio API is inadequate, but using stubbed methods to check for results is not an adequate test as it can pass with no text being sent




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

Usage
-------

* Dishes are created with two arguments, one for name (either a string or a symbol is acceptable) and a price.
* A Menu is created by feeding an optional number of dishes in as arguments to be stored on the object, more can be manually added later in the terminal
* An Order is created by supplying the following 
    * A Menu (to show it is flexible, real use case can set a default, but allow changes for seasonal menus)
    * A TwilioApi, separated to cater to SRP
    * A customer number, which must currently be supplied as a string with the correct dialing formats (I.E '+44123456789' for UK numbers)
    * This currentky uses manual dependency injection in cases to allow optional creation, but this can easily be set to a default for ease of use
* Once your objects are initialized you can use the add_dish method on the Order object to take menu items into the basket
* The Menu has functionality to return errors if non existent items are selected
* Once the customer is satisfied with the order they can use the check_total method to see the price, and the complete_order method to receive a confirmation text


