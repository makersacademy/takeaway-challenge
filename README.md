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

```ruby
  subject(:takeaway) { described_class.new(menu_items: menu_items) }

  let(:menu_items) { double(:menu_items, display: displayed_menu) }

  let(:displayed_menu) { "Pepperoni Pizza" }

  describe "#display_menu_items" do
    context "Displays the menu to the user" do
      it "returns a menu list" do
        expect(subject.display_menu_items).to eq(displayed_menu)
      end
    end
  end
```

This test will call the takeaway class and expects a method called display_menu_items to return
a string of "Pepperoni Pizza".

Lets see what happens when we run the test?

```ruby
  1) Takeaway#display_menu_items Displays the menu to the user returns a menu list
     Failure/Error: subject(:takeaway) { described_class.new(menu_items: menu_items) }

     ArgumentError:
       wrong number of arguments (given 1, expected 0)
     # ./spec/takeaway_spec.rb:8:in `initialize'
     # ./spec/takeaway_spec.rb:8:in `new'
     # ./spec/takeaway_spec.rb:8:in `block (2 levels) in <top (required)>'
     # ./spec/takeaway_spec.rb:20:in `block (4 levels) in <top (required)>'

Finished in 0.00405 seconds (files took 0.86231 seconds to load)
1 example, 1 failure
```

Now that is interesting, we have gone from a Green test to a failed test, looking at the result of the test
its clear that the takeaway class was expecting some arguments to be given in its initialize method.

Lets write some code now to to see if we can fix this.

In the takeaway class we will add the initialize method and pass in an argument.
```ruby
  def initialize(menu_items)
  end
```

Lets see what rspec says now

```ruby
Failures:

  1) Takeaway#display_menu_items Displays the menu to the user returns a menu list
     Failure/Error: expect(subject.display_menu_items).to eq(displayed_menu)

     NoMethodError:
       undefined method `display_menu_items' for #<Takeaway:0x00007faf48a8ea68>
     # ./spec/takeaway_spec.rb:20:in `block (4 levels) in <top (required)>'

Finished in 0.00307 seconds (files took 0.6915 seconds to load)
1 example, 1 failure
```

As expected we received another red error, this time it is complaining that it is unable to find the method
\#display_menu_items

```ruby
     NoMethodError:
       undefined method `display_menu_items' for #<Takeaway:0x00007faf48a8ea68>
     # ./spec/takeaway_spec.rb:20:in `block (4 levels) in <top (required)>'
```

This is simple to fix, we will create a new method in takeaway with this name and repeat this process

```ruby
  def display_menu_items
    
  end
```

Now we are finally getting an interesting error and getting close to the expected output.

Rspec is telling use that we returned nil from the method we created
```ruby
  1) Takeaway#display_menu_items Displays the menu to the user returns a menu list
     Failure/Error: expect(subject.display_menu_items).to eq(displayed_menu)

       expected: "Pepperoni Pizza"
            got: nil

       (compared using ==)
     # ./spec/takeaway_spec.rb:20:in `block (4 levels) in <top (required)>'
```

This is exactly what we wanted, we can now return the expected string from the class to pass the initial part of the test
once we have all green for the pass, we can start to refactor the code and add in some logic as required.

The output that is expected is "Pepperoni Pizza", lets add this in now.

By adding the following code, we are able to get to green on our test

```ruby
➜  takeaway-challenge (master) ✗ rspec

Takeaway
  #display_menu_items
    Displays the menu to the user
      returns a menu list

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.0061 seconds (files took 0.95652 seconds to load)
1 example, 0 failures
```

Clearly this isnt the desired end outcome, since we would like to print an actual list of items,
as we dont have that class at the moment, this will do for now and covers the first user story, we will come back to
this later when we need to implement the order class
-----
## Story two

So this one ties in to the first user story in that they would like to select from a list
of options, so we will need to add some functionality to to our takeaway class so the user can order
multiple items, this also ties in to the third user story in that they would also like to 
see a total cost of the order.

We will need a way to pass in a menu, and have it calculate the costs and return the total back to the user

We will start by creating our test for this. We will also require an order list to pass in to the test
to check we get the desired results.

The initial test I have written just checks that we get a positive response from a new method in takeaway
I will call customer order which will take in an order (A fake order for now), this method will be responsible
for creating a key, value list like a basket we can work with later 

The fake order will be:

```ruby
  let(:customer_order) { { bbq_chicken: 3, vegan: 2, hawaiian: 3 } }
```

We have not yet created our order class, but I suspect with this user story it will be something that
we cannot put off any longer. At this point, we will need to start thinking about the logic of the application
and how the classes are going to interact with one another.

```ruby
  describe "#customer order" do
    context "creates a new customer order" do
      it "responds to placing an order" do
        expect(takeaway.customer_order(customer_order)).to be_truthy
      end
    end
  end
```

As expected, ruby is complaining that it cant find the customer_order method, so lets create it and see
what rabbit hole this will lead us down!

```ruby
 Failure/Error:
     def customer_order

     end

 ArgumentError:
   wrong number of arguments (given 1, expected 0)
```

The test failed, but it looks like it was expecting us to pass something in to the method,
if we take a look at the test above, we are passing in customer_order, which is a fake order
we have created for test, so we will modify the method to take in an argument.

```ruby
 Failure/Error: expect(takeaway.customer_order(customer_order)).to be_truthy

   expected: truthy value
        got: nil
 # ./spec/takeaway_spec.rb:32:in `block (4 levels) in <top (required)>'
```

Now we are getting an interesting error, as with the first user story, we were expecting something
to be returned but received nil responce. Since we are only expected a truthy value, we could pass
in any string we want to get this to pass, for example, if I pass in "Order Complete" as the methods
return, we will pass the test, but this time it does not match the user story, they want pass in an actual
order with maybe multiple items.

Now we are at green we will refactor and add in some logic before retesting, and refactor our
tests to see if we can match the fake order and get it to return the desired result.

#### Adding some logic to meet the user story.

First we will create an empty hash to store a key value pair as the customers order / or basket
customer order will then push the customer order to the order hash so we can use this later to calculate
the total cost. We will also expose this has with the attr_reader method.

With the added logic, our code now looks like this;

```ruby
class Takeaway
  attr_reader :order
  def initialize(order)
    @order = order

  end

  def display_menu_items
    "Pepperoni Pizza: 12.99"
  end

  def customer_order(customer_order)
    customer_order.each do |item, amount|
        order.add(item, amount)
    end
  end
end
```

Now we have added this we get another error, we have an undefined method called "add"
this is not unexpected. We dont need the Takeaway class to be responsible for all the functionality
so we now finally need to create a second class, I will call this order and will also create a spec file for it

```ruby
touch lib/order.rb
touch spec/order_spec.rb
```

This creates the files we need, we will add some tests to the spec file and some methods to the class hopefully that 
fix our initial issue and we can move on to creating more logic to fulfill the user stories.

So this README.md does not get too unreadable, I will not record each step I take to compelte
this as I would only be repeating what we have already covered. Instead from this point forward
I will provide updates and code snippets of my progress.

Before creating any logic within the order class, we will start by writing our tests with
what we expect the outcome to be.

### A little issue
I ran in to an interesting issue while trying to add the order method "add" to the order class
by doing this, I started to have rspec fails on the takeaway class.

The interesting part about this is that in takeaway, I defined an add mother to the order instance variable.

```ruby
  1) Takeaway#customer_order creates a new customer order responds to placing an order
     Failure/Error: order.add(item, amount)

     NoMethodError:
       undefined method `add' for {:menu_items=>#<Double :menu_items>}:Hash
```

This test was previously passing, to fix this, I have added a require in to the takeaway class of the order class.
This makes takeaway aware of the class, so hopefully when I run rspec again, it will find add in that class and call it.

Sadly, this did not fix the issue, it appears that takeaway is not receiving the add method yet.
Doing some research in to this, I have found that I need to inject the add method in to the test
since we are trying to keep out test isolated and not dependant on other classes.

The code we will use, is:  
```rspec
    expect(order).to receive(:add).at_most(3).times
```

I found that this allows the test to pass, but we need to keep in mind that we have not yet created an order class, so we will need to create this
at some point we we work though the user stories and logic

The code to create the fake order is:
```ruby
  let(:order) { instance_double("Order", basket: 125.92) }
```
We will also require the Order class in to takeaway so it is aware it exists.

You will notice we have Order as "Order", this will throw an error
to let us know we dont have have a method called basket in the Order class, I will use this to ensure that
these methods actually exist and created as we go though the user stories

------------------
## Out of time

Due to spending time researching stubs, mocks, doubles and perhaps spending too much time on the README, I have run out 
of time and unable to complete the SMS integration for the final story. Also, due to time constrains and trying to rush though the stories I had forgot to 
commit.

I was initially running Rubocop after each commit, but I found myself spending too much time trying to please RuboCop when
I could have been spending that time actually writing the code and testing.

I found the TDD process both frustrating and fun, frustrating when you get an error you have not seen before and sets
you back a while, but fun and interesting when you see it all turn green.

This commit is my final commit for the project, but I will complete this as a personal goal with the ability to send SMS
messages with an update on the delivery times. There appears to also be a further challenge to allow you to order via 
SMS so if I find the time I will certainly look at that.

Finally, I didnt get a change to look at the DOTENV gem, I have used this software with NodeJS, so will look to implement
this in to the project when I add SMS functionality.

Aaron - December 2019 / Makers

