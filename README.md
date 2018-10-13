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
----------
* Write a Takeaway program with the following user stories:

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

  <!-- ### Domain Model

  | Objects        | Methods           
  | ------------- |:-------------:|
  |Air Traffic Control||
  |Airport|land(plane),takeoff(plane),full?|
  |Plane|status?|
  |Weather|stormy?| -->

  ### My approach

  I made a decision not to have a separate class for weather and just to call it when needed.  The weather could change at any time so didn't feel it needed to be created up front.  I did separate weather into a module though as still felt I wanted to keep it separate.

  Some additional steps that I might extend this with is to add in an overarching airport network object that can double check that there are no planes landed in the middle of nowhere or planes that are flying but are also booked into an airport.  This shouldn't happen using the recommended steps of creating airports and planes and asking them to land and take off but could be useful to if things get more complex.

  ### Instructions

  #### Before you start

  * Requires Ruby 2.5.0
  ```
  rvm install "ruby-2.5.0"
  ```
  * Install the Bundle Gemfile
  ```
  bundle install
  ```
  * Sign up for an account and get an API SID and Authorisation Token as well as a phone number to use.  For testing purposes you can get a single number to use

  you will need to use these as environment variables

  #### Running in IRB

  ```
  require "./lib/takeaway.rb"
  require "./lib/order.rb"
  require "./lib/messaging.rb"
  ```

  To create a shop and start placing an order:
  ```
  takeaway = Takeaway.new
  ```
  You will be given a menu to peruse with:
  ```
  takeaway.menu
  ```

  To add an item to your basket:
  ```
  takeaway.add("Small chips", 2)
  ```
  keep adding items until done

  To check your basket and total cost:
  ```
  takeaway.print_basket
  ```

  When ready to submit your order:
  ```
  takeaway.submit_order
  ```

  #### Testing in Rspec

  Run
  `
  rspec
  `
  in terminal

  ### Test results

  ```
  100% COVERAGE
  ```

  ```
  0 Offenses in Rubocop
