Anthony's Takeaway Challenge
=================
[Readme adapted from here](https://github.com/makersacademy/takeaway-challenge)
==================
```
                            _________
              r==           |       |
           _  //            |  A.O. |   ))))
          |_)//(''''':      |  M.A. |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Introduction
-------

My solution to the Makers Academy Week 2 Takeaway Challenge.


Setting up  
-----  

Please run `bundle install` before opening `irb` to test functionality.  

Task  
-----

`irb`  
`require './lib/takeaway.rb'`

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

* Creating the takeaway  
`shop = Takeaway.new`
* The menu must be manually created when the shop is first created:  
  
`shop.add_item("sausages","£5.00")`    
`shop.add_item("burger","£10.00")`  
`shop.add_item("bread","£9.00")`  
`shop.add_item("toast","£3.00")`  
`shop.add_item("lobster","£12.00")`  
`shop.add_item("generic curry","£4.99")`  
  
* The menu can then be viewed:  
`shop.menu`  

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
* The customer can then pick items:  
`shop.pick("burger")`  
`shop.pick("generic curry")`  
  
* The customer can view their current basket:  
`shop.display_basket`  
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
* The customer can check their current basket sub-total:  
`shop.sub_total`  
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
* The customer can confirm their choice and order:  
`shop.place_order`  
  
What I have learned during this project  
-----  
  
* Mocks when testing in order to test each class independently
* Dependency injection in order to be able to use mocks effectively
* Environmental variables in order to retain security when uploading to public spaces (ie github)
* Testing method behaviour over state

What I would like to implement in the future  
-----  

* Attempt the advanced challenge:  
`Implement the ability to place orders via text message.`
* Better display of information (e.g. the list of menu items)
* Adding a default menu display (perhaps loading from an external csv file)

Features
-----

* All tests pass - 15 examples, 0 failures
* [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md): COVERAGE: 100.00% -- 156/156 lines in 8 files
