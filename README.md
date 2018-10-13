Takeaway Challenge
==================
Friday challenge - Week 2 of the Makers Academy Apprenticeship course
----------------------

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

 - [Task](#task)
  * [My approach](#my-approach)
  * [Instructions and assumptions](#instructions-and-assumptions)
    + [Assumptions](#assumptions)
    + [Before you start](#before-you-start)
    + [Running in terminal/Ruby file](#running-in-terminal-ruby-file)
    + [Running in IRB](#running-in-irb)
    + [Testing in Rspec](#testing-in-rspec)
  * [Test results](#test-results)

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

  TBA

  ### Instructions and assumptions

  #### Assumptions

  * You are online when running - the Twilio integration and my approach to testing the API over rspec requires it.  


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

  #### Running in terminal/Ruby file

  ```
  ruby ./lib/takeaway_order.rb
  ```
  This will give you an interface to place your order and select items

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
  97.86% COVERAGE
  ```

  ```
  0 Offenses in Rubocop
  ```
