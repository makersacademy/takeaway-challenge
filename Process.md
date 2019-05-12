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

Objects     |    Messages<br/>
            |<br/>
takeaway    |    view_menu<br/>
menu        |    prices


*A takeaway class will be built with methods view_menu and order*<br/>


Failed Feature Test<br/>


*Feature test A will check to see if a new instance of a takeaway class can be created*<br/>

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

*Feature test C will check to see if the takeaway menu can display a list with prices<br/>

For a dish list with prices I will create a new class 'Menu' to enable the user to see the full takeaway menu upon request*

C) menu = Menu.new<br/>
Traceback (most recent call last):<br/>
        2: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'<br/>
        1: from (irb):1<br/>
NameError (uninitialized constant Menu)<br/>

i) menu = Menu.new<br/>
=> #<Menu:0x00007feece10a788><br/>

*Next, I will present the prices by using a new method 'prices'*<br/>

ii) .5.0 :005 > menu.prices<br/>
Traceback (most recent call last):<br/>
        2: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'<br/>
        1: from (irb):5<br/>
NoMethodError (undefined method `prices' for<br/> #<Menu:0x00007feece10a788>)<br/>

*For the final step the user should be able to view the full menu with prices in the Takeaway class*<br/>

iii)2.5.0 :001 > require './takeaway'<br/>
 => true<br/>
2.5.0 :002 > takeaway = Takeaway.new<br/>
 => #<Takeaway:0x00007fe20191d3c8><br/>
2.5.0 :003 > takeaway.view_menu<br/>
 => nil<br/>


Green Feature Test<br/>

A) 2.5.0 :001 > require './takeaway'<br/>
 => true<br/>
2.5.0 :002 > takeaway = Takeaway.new<br/>
 => #<Takeaway:0x00007fe254068748><br/>

B) 2.5.0 :002 > takeaway = Takeaway.new<br/>
 => #<Takeaway:0x00007f9bf2135480><br/>
2.5.0 :003 > takeaway.view_menu
 => nil<br/>

C) i) 2.5.0 :001 > require './menu'
 => true<br/>
2.5.0 :002 > menu = Menu.new<br/>
 => #<Menu:0x00007f827c07fc00 @menu={"spaghetti bolognese"=>4.5, "ham and cheese pancake"=>3.75, "double-cheeseburger"=>4.0<br/>
, "curly fries"=>1.75}><br/>

ii)  => true<br/>
2.5.0 :002 > menu = Menu.new<br/>
 => #<Menu:0x00007f93f9984970 @menu={"spaghetti bolognese"=>4.5, "ham and cheese pancake"=>3.75,<br/>
 "double-cheeseburger"=>4.0<br/>
, "curly fries"=>1.75}><br/>
2.5.0 :003 > menu.prices<br/>
spaghetti bolognese: £4.5<br/>
ham and cheese pancake: £3.75<br/>
double-cheeseburger: £4.0<br/>
curly fries: £1.75<br/>
 => {"spaghetti bolognese"=>4.5, "ham and cheese<br/> pancake"=>3.75, "double-cheeseburger"=>4.0, "curly<br/> fries"=>1.75}<br/>

iii) 2.5.0 :001 > require './takeaway'<br/>
 => true<br/>
2.5.0 :002 > takeaway = Takeaway.new<br/><br/>
 => #<Takeaway:0x00007ff4a8876000<br/> @menu=#<Menu:0x00007ff4a8875fb0 @menu={"spaghetti bolognese"=>4.55, "ham and cheese panca
ke"=>3.75, "double-cheeseburger"=>4.25, "curly<br/> fries"=>1.75}>><br/>
2.5.0 :003 > takeaway.view_menu<br/>
spaghetti bolognese: £4.55<br/>
ham and cheese pancake: £3.75<br/>
double-cheeseburger: £4.25<br/>
curly fries: £1.75<br/>
 => {"spaghetti bolognese"=>4.55, "ham and cheese<br/> pancake"=>3.75, "double-cheeseburger"=>4.25, "curly fries"=>1.75}<br/>

*I noticed that the "0's" were not printed! To solve this I changed the amounts ;p*
<br/>
2.5.0 :002 > menu = Menu.new<br/>
 => #<Menu:0x00007f9b2b112948 @menu={"spaghetti-bolognese"=>4.55, "ham and cheese pancake"=>3.75, "double-cheeseburger"=>4.25, "curly fries"=>1.75}><br/>
2.5.0 :003 > menu.prices<br/>
spaghetti bolognese: £4.55<br/>
ham and cheese pancake: £3.75<br/>
double-cheeseburger: £4.25<br/>
curly fries: £1.75<br/>

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

C)Failure/Error:
  describe Menu do
    subject(:menu) { Menu.new }

    it "loads menu at initialization" do

    end
  end

NameError:
  uninitialized constant Menu<br/>

ii) Menu<br/>
  prints a dish list with prices (FAILED - 1)<br/>

Takeaway<br/>
  should respond to #view_menu<br/>

Have you considered running rubocop? It will help you<br/> improve your code!<br/>
Try it now! Just run: rubocop<br/>

Failures:<br/>

  1) Menu prints a dish list with prices<br/>
     Failure/Error: expect(menu.prices).to eq Menu::MENU<br/>

     NoMethodError:<br/>

iii) Failures:

  1) Takeaway#view_menu delegates to prices method<br/>
     Failure/Error: subject(:takeaway) { Takeaway.new(menu) }<br/>

     ArgumentError:<br/>
       wrong number of arguments (given 1, expected 0)<br/>
     # ./spec/takeaway_spec.rb:6:in `initialize'<br/>
     # ./spec/takeaway_spec.rb:6:in `new'<br/>
     # ./spec/takeaway_spec.rb:6:in `block (3 levels) in <top (required)>'<br/>
     # ./spec/takeaway_spec.rb:14:in `block (3 levels) in <top (required)>'<br/>

Finished in 0.01212 seconds (files took 0.45468 seconds to load)<br/>

2 examples, 1 failure<br/>

GREEN Unit Test<br/>

A) Finished in 0.00039 seconds (files took 0.80237 seconds to load)<br/>
0 examples, 0 failures<br/>

B) Takeaway
  should respond to #view_menu<br/>

Have you considered running rubocop? It will help you improve your code!<br/>
Try it now! Just run: rubocop<br/>

Finished in 0.00441 seconds (files took 0.77983 seconds to load)<br/>
1 example, 0 failures<br/>

C) Finished in 0.01126 seconds (files took 0.51422 seconds to load)<br/>
1 examples, 0 failures<br/>

ii) Menu
spaghetti bolognese: £4.55
ham and cheese pancake: £3.75
double-cheeseburger: £4.25
curly fries: £1.75
  prints a dish list with prices

Takeaway
  should respond to #view_menu

Have you considered running rubocop? It will help you improve your code!

Try it now! Just run: rubocop
<br/>

Finished in 0.00532 seconds (files took 0.78205 seconds to load)<br/>
2 examples, 0 failures


iii) Takeaway
  #view_menu
    delegates to prices method

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.01128 seconds (files took 0.5369 seconds to load)
2 examples, 0 failures


COVERAGE: 100.00% -- 27/27 lines in 4 files

<br/>
rubocop

<br/>
A) .....<br/>

5 files inspected, no offenses detected<br/>

B)Inspecting 5 files<br/>
.....<br/>

5 files inspected, no offenses detected <br/>

C) i) .......<br/>

7 files inspected, no offenses detected<br/>

ii) Inspecting 7 files<br/>
.......<br/>

7 files inspected, no offenses detected<br/>

iii) Inspecting 7 files<br/>
.......<br/>

7 files inspected, no offenses detected<br/>


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
