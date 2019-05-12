# User Story 1

As a customer

So that I can check if I want to order something

I would like to see a list of dishes with prices


- create a hash with a list of dishes and prices (menu)
{"dish" => 2, "dish" => 4}

## Red Feature Test


1)
(2.5.0 :001 > require './lib/menu'

 => true
 
2.5.0 :002 > menu = Menu.new

Traceback (most recent call last):

        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        
        1: from (irb):2
        
NameError (uninitialized constant Menu))

2)

(2.5.0 :001 > require './lib/menu'

 => true
 
2.5.0 :002 > menu = Menu.new

 => #<Menu:0x00007fa4bb1b8f70>
 
2.5.0 :003 > menu.italian

Traceback (most recent call last):

        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):3
NoMethodError (undefined method `italian' for #<Menu:0x00007fa4bb1b8f70>))

## Green Feature Test

1)
2.5.0 :001 > require './lib/menu'

 => true
 
2.5.0 :002 > menu = Menu.new

 => #<Menu:0x00007fa4bb1b8f70>
 

2)

2.5.0 :001 > require './lib/menu'

 => true
 
2.5.0 :002 > menu = Menu.new

 => #<Menu:0x00007fe139924538>
 
2.5.0 :003 > menu.italian

 => {"Pizza"=>10}

## Red Unit Test

1)
Failure/Error:

  describe Menu do

  it "allows me to see a new menu" do
    expect(subject.new).to eq subject
  end

  end

NameError: uninitialized constant Menu

  2)
  
  Failures:

    1) Menu allows me to list the items and prices on a menu
       Failure/Error: expect(subject.italian).to eq "Pizza" => 10

       NoMethodError:
         undefined method `italian' for #<Menu:0x00007fc3aed3a468>
       # ./spec/menu_spec.rb:11:in `block (2 levels) in <top (required)>'

  Finished in 0.00227 seconds (files took 0.44612 seconds to load)
  2 examples, 1 failure

## Green Unit Test

1)
Finished in 0.00324 seconds (files took 0.4456 seconds to load)
1 example, 0 failures

2)
Menu
  allows me to see a new menu
  allows me to list the items and prices on a menu

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.00256 seconds (files took 0.42831 seconds to load)
2 examples, 0 failures

# User Story 2

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

- select several dishes from menu - dishes, quantities

## Red Feature Test
1)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
Traceback (most recent call last):
        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):2
NameError (uninitialized constant Order)

2)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007f8d0498f808 @menu=#<Menu:0x00007f8d0498f790 @menu_items={"Pizza"=>10, "Pasta"=>12, "Spaghetti"=>8}>>
2.5.0 :003 > order.order_list
Traceback (most recent call last):
        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):3
NoMethodError (undefined method `order_list' for #<Order:0x00007f8d0498f808>)

## Green Feature Test
1)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007ff109144b80>

2)

## Red Unit Test
1)
Failure/Error:
  describe Order do

    it "allows me to create a new order" do
      expect(subject).to eq subject
    end

  end

NameError:
  uninitialized constant Order

2)
Failures:

  1) Order allows me to select dishes and quantities to order
     Failure/Error: expect(subject.order_list("Pasta", 2)).to eq["Pasta", 2]

     NoMethodError:
       undefined method `order_list' for #<Order:0x00007f94aed9e320>
     # ./spec/order_spec.rb:10:in `block (2 levels) in <top (required)>'


## Green Unit Test
1)
Menu
  allows me to see a new menu
  allows me to list the items and prices on a menu

Order
  allows me to create a new order

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.00225 seconds (files took 0.40603 seconds to load)
3 examples, 0 failures

2)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007fa98307fc18 @menu=#<Menu:0x00007fa98307fbc8 @menu_items={"Pizza"=>10, "Pasta"=>12, "Spaghetti"=>8}>, @order_list=[]>
2.5.0 :003 > order.add("Pasta", 2)
 => [{:dish=>"Pasta", :quantity=>2}]

Menu
  allows me to see a new menu
Pizza: £10
Pasta: £12
Spaghetti: £8
  allows me to list the items and prices on a menu

Order
  allows me to create a new order
  allows me to add dishes and quantities to order

Finished in 0.00302 seconds (files took 0.4192 seconds to load)
4 examples, 0 failures

# User Story 3

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

- check total of order
- raise error message if cant add total

## Red Feature Test
1)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007f8894857c70 @menu=#<Menu:0x00007f8894857bf8 @menu_items={"Pizza"=>10, "Pasta"=>12, "Spaghetti"=>8}>, @order_list=[]>
2.5.0 :003 > order.add("Pasta", 2)
 => [{:dish=>"Pasta", :quantity=>2}]
2.5.0 :004 > order.add("Spaghetti", 1)
 => [{:dish=>"Pasta", :quantity=>2}, {:dish=>"Spaghetti", :quantity=>1}]
2.5.0 :005 > order_total
Traceback (most recent call last):
        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):5
NameError (undefined local variable or method `order_total' for main:Object)

2)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007fc9659871b0 @menu={"Pizza"=>10, "Pasta"=>12, "Spaghetti"=>8}, @order_list={}>
2.5.0 :003 > order.add("Garlic Bread", 1)
 => {"Garlic Bread"=>1}
2.5.0 :004 > order.add("Pasta", 2)
 => {"Garlic Bread"=>1, "Pasta"=>2}
2.5.0 :005 > order.add("Spaghetti", 1)
 => {"Garlic Bread"=>1, "Pasta"=>2, "Spaghetti"=>1}
2.5.0 :006 > order.total
Traceback (most recent call last):
        6: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        5: from (irb):6
        4: from /Users/lucybarber/Documents/Makers/weekend_challenges/takeaway-challenge/lib/order.rb:19:in `total'
        3: from /Users/lucybarber/Documents/Makers/weekend_challenges/takeaway-challenge/lib/order.rb:19:in `each'
        2: from /Users/lucybarber/Documents/Makers/weekend_challenges/takeaway-challenge/lib/order.rb:20:in `block in total'
        1: from /Users/lucybarber/Documents/Makers/weekend_challenges/takeaway-challenge/lib/order.rb:20:in `*'
TypeError (nil can't be coerced into Integer)

## Green Feature Test
1)
2.5.0 :001 > require './lib/order'
 => true
2.5.0 :002 > order = Order.new
 => #<Order:0x00007f9a978ab4f0 @menu={"Pizza"=>10, "Pasta"=>12, "Spaghetti"=>8}, @order_list={}>
2.5.0 :003 > order.add("Pasta", 2)
 => {"Pasta"=>2}
2.5.0 :004 > order.add("Spaghetti", 1)
 => {"Pasta"=>2, "Spaghetti"=>1}
2.5.0 :005 > order.total
 => "Your order total is £32"

 2)
 2.5.0 :001 > require './lib/order'
  => true
 2.5.0 :002 > order = Order.new
  => #<Order:0x00007fca601870e0 @menu={"Pizza"=>10, "Pasta"=>12, "Spaghetti"=>8}, @order_list={}>
 2.5.0 :003 > order.add("Garlic Bread", 1)
 Traceback (most recent call last):
         3: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
         2: from (irb):3
         1: from /Users/lucybarber/Documents/Makers/weekend_challenges/takeaway-challenge/lib/order.rb:12:in `add'
 RuntimeError (Item(s) not available, please order again!)
 2.5.0 :004 > order.add("Pasta", 2)
  => {"Pasta"=>2}

## Red Unit Test
1)
Failures:

  1) Order will tell me the order total
     Failure/Error: expect(subject.total).to eq(32)

     NoMethodError:
       undefined method `total' for #<Order:0x00007fc81116ebe0>
     # ./spec/order_spec.rb:16:in `block (2 levels) in <top (required)>'

Finished in 0.00363 seconds (files took 0.4598 seconds to load)
5 examples, 1 failure

2)
Failures:

  1) Order raises an error if item is not in menu
     Failure/Error: total += quantity * @menu[dish]

     TypeError:
       nil can't be coerced into Integer
     # ./lib/order.rb:20:in `*'
     # ./lib/order.rb:20:in `block in total'
     # ./lib/order.rb:19:in `each'
     # ./lib/order.rb:19:in `total'
     # ./spec/order_spec.rb:23:in `block (2 levels) in <top (required)>'

Finished in 0.00404 seconds (files took 0.44376 seconds to load)
6 examples, 1 failure

## Green Unit Test
1)
Menu
  allows me to see a new menu
Pizza: £10
Pasta: £12
Spaghetti: £8
  allows me to list the items and prices on a menu

Order
  allows me to create a new order
  allows me to add dishes and quantities to order
  will tell me the order total

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.00365 seconds (files took 0.47116 seconds to load)
5 examples, 0 failures

2)
Menu
  allows me to see a new menu
Pizza: £10
Pasta: £12
Spaghetti: £8
  allows me to list the items and prices on a menu

Order
  allows me to create a new order
  allows me to add dishes and quantities to order
  will tell me the order total
  raises an error if item is not in menu

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.00838 seconds (files took 0.46346 seconds to load)
6 examples, 0 failures


COVERAGE: 100.00% -- 42/42 lines in 4 files

# User Story 4
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

time = Time.now
delivery_time = time + 1*00*00
send_sms


## Red Feature Test
1)


## Green Feature Test
1)


## Red Unit Test
1)


## Green Unit Test
1)
