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

Instructions given
-------

* Challenge time: until 4pm on the same day the challenge is given
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, still check in a partial solution
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
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
----

For this challenge, I will be able to use what I have learnt from the Boris Bikes and Airport challenge. 

The final user story seems to require an external provider to give the ability to send text messages.
To complete this challenge, I will use TDD (Test Driven Development) and RGR (Reg Green Refactor) to guide
me on what needs to be implemented to complete the challenge.

Because we will be using several classes which will need to interact with each other, I wil be isolating the
tests using mocks and doubles to fake the behaviour of other classes to ensure that the class I am testing does
not fail because of a dependency in another class.

To create these, I will be referring to https://github.com/rspec/rspec-mocks which contains a list of syntax and code
I will need to use.

---------
## User story one

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

For the first user story, I feel there should be two classes to handle this, the first class will be 
the takeaway class, the second will handle displaying the menu to the user with prices. The takeaway class generally 
should't care about the menu or the items, but will take in this information from another class.

To start, I will create the takeaway class and spec first and follow RGR to extract the expected behaviour
```shell script
mkdir lib
touch lib/takeaway.rb
touch spec/takeaway_spec.rb
```
This creates the initial files we will be working on, in the spec file, we will describe the takeaway class
and create any mocks we need to get the tests to pass once we start RGR.

The initial spec file will contain the following code to get us started
```ruby
require './lib/takeaway'

describe Takeaway do

end
```

We require the file that will contain the class and describe the class we wish to test.

This is where we will see our first RED in the RGR processes.

```ruby
An error occurred while loading ./spec/takeaway_spec.rb.
Failure/Error:
  describe Takeaway do

  end

NameError:
  uninitialized constant Takeaway
# ./spec/takeaway_spec.rb:1:in `<top (required)>'
No examples found.
```

This error tells us we have not yet created a class called Takeaway, so we will now write our first ruby
code to get passed this error.

In the takeaway.rb file, we will add some code.

```ruby
class Takeaway
  
end
```

When we run Rspec now, we should see a GREEN pass for the test.

```ruby
No examples found.
Finished in 0.00094 seconds (files took 0.74689 seconds to load)
0 examples, 0 failures

COVERAGE: 100.00% -- 3/3 lines in 2 files
```

We get no examples found as we haven't actually written any tests yet. But now we 
have the initial test failing, we can look at the the first user story that 
the customer would like a list of items printed.

The takeaway class will call a method called display_menu_items that will call a menu class
to display these to the user.

As we dont have a menu class yet, we will fake these with a double.

