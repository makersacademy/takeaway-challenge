Here is the process I used for the takeaway-challenge at Makers

## User Stories


**ONE**

User story

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

Objects     |    Messages

takeaway    |    view_menu
            |    order

*A takeaway class will be built with methods view_menu and order*

Failed Feature Test

*Feature test A will check to see if a new instance of a takeaway class can be created*

A)2.5.0 :001 > require './takeaway'
 => true
2.5.0 :002 > takeaway = Takeaway.new
Traceback (most recent call last):
        2: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):2
NameError (uninitialized constant Takeaway)


Green Feature Test

A) 2.5.0 :001 > require './takeaway'
 => true
2.5.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fe254068748>




RED Unit Test

*Unit test A will check to see if a new instance of a takeaway class can be created*

A) Failure/Error:
  describe Takeaway do
    subject(:takeaway) { Takeway.new }
  end

NameError:
  uninitialized constant Takeaway

B)



GREEN Unit Test

A) Finished in 0.00039 seconds (files took 0.80237 seconds to load)
0 examples, 0 failures

B)


rubocop


A) .....

5 files inspected, no offenses detected

B)

**TWO**

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

Failed Feature Test







Green Feature Test







RED Unit Test







GREEN Unit Test




**THREE**

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

Failed Feature Test







Green Feature Test







RED Unit Test







GREEN Unit Test







**FOUR**

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


Failed Feature Test







Green Feature Test







RED Unit Test







GREEN Unit Test
