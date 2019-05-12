Here is the process I used for the takeaway-challenge at Makers


#### User Stories

The following user stories will be used to guide TDD for a takeaway order program<br/>

**ONE**<br/>

User story

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

Objects     |    Messages
            |
            |
takeaway    |    view_menu
            |
            |
            |    order


*A takeaway class will be built with methods view_menu and order*


Failed Feature Test<br/>


*Feature test A will check to see if a new instance of a takeaway class can be created*

A)2.5.0 :001 > require './takeaway'
 => true\
2.5.0 :002 > takeaway = Takeaway.new<br/>
Traceback (most recent call last):<br/>
        2: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'<br/>
        1: from (irb):2<br/>
NameError (uninitialized constant Takeaway)<br/>

*Feature test B will check to see if user can view the takeaway menu*<br/>

B) 2.5.0 :001 > require './takeaway'<br/>
 => true<br/>
2.5.0 :002 > takeaway = Takeaway.new<br/>
 => #<Takeaway:0x00007fc2fc13da50><br/>
2.5.0 :003 > takeaway.view_menu<br/>
Traceback (most recent call last):<br/>
        2: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'<br/>
        1: from (irb):3<br/>
NoMethodError (undefined method `view_menu' for #<Takeaway:0x00007fc2fc13da50>)<br/>

C)<br/>

Green Feature Test<br/>

A) 2.5.0 :001 > require './takeaway'<br/>
 => true<br/>
2.5.0 :002 > takeaway = Takeaway.new<br/>
 => #<Takeaway:0x00007fe254068748><br/>

B) 2.5.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007f9bf2135480>
2.5.0 :003 > takeaway.view_menu
 => nil<br/>

C)<br/>

RED Unit Test<br/>

*Unit test A will check to see if a new instance of a takeaway class can be created*<br/>

A) Failure/Error:<br/>
  describe Takeaway do<br/>
    subject(:takeaway) { Takeway.new }<br/>
  end

NameError:<br/>
  uninitialized constant Takeaway<br/>

B) 1) Takeaway should respond to #view_menu<br/>
     Failure/Error: it { is_expected.to respond_to(:view_menu) }<br/>
       expected #<Takeaway:0x00007f85da2767c8> to respond to :view_menu<br/>
     # ./spec/takeaway_spec.rb:6:in `block (2 levels) in <top (required)>'<br/>

Finished in 0.04075 seconds (files took 0.51122 seconds to load)<br/>
1 example, 1 failure<br/>

C)<br/>


GREEN Unit Test<br/>

A) Finished in 0.00039 seconds (files took 0.80237 seconds to load)<br/>
0 examples, 0 failures<br/>

B) Takeaway
  should respond to #view_menu<br/>

Have you considered running rubocop? It will help you improve your code!<br/>
Try it now! Just run: rubocop<br/>

Finished in 0.00441 seconds (files took 0.77983 seconds to load)<br/>

1 example, 0 failures<br/>

<br/>
rubocop

<br/>
A) .....<br/>

5 files inspected, no offenses detected<br/>

B)Inspecting 5 files<br/>
.....<br/>

5 files inspected, no offenses detected <br/>

**TWO**<br/>

User Story<br/>

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

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
