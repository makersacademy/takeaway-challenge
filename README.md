Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/nryn/takeaway-challenge.svg?branch=master)](https://travis-ci.org/nryn/takeaway-challenge)
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

 Usage
 ---------

 * Open a Ruby shell in the project's root directory
 * To start, type
     `require './lib/session.rb'`
 * Then to start your session, simply type
     `Session.new`
 * The rest of the instructions will appear on screen :)


 Dependencies
 --------------

 * Ruby 2.3.1
 * To get dependencies `gem install bundle` and then `bundle`.


 Description
 -------------

 Software which provides a customer-facing service for ordering takeaway food from the command line.

 Here are the user stories that form part of the work:

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

 The code defends against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as attempting to order items that are not being offered, removing non-existent items from a meal, etc.
