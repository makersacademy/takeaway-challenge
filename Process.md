As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

- create a hash with a list of dishes and prices (menu)
{"dish" => 2, "dish" => 4}

Red Feature Test

1)
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > menu = Menu.new
Traceback (most recent call last):
        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):2
NameError (uninitialized constant Menu)

2)
2.5.0 :001 > require './lib/menu'
 => true
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fa4bb1b8f70>
2.5.0 :003 > menu.italian
Traceback (most recent call last):
        2: from /Users/lucybarber/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        1: from (irb):3
NoMethodError (undefined method `italian' for #<Menu:0x00007fa4bb1b8f70>)

Green Feature Test

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

Red Unit Test

1)
Failure/Error:
  describe Menu do

  it "allows me to see a new menu" do
    expect(subject.new).to eq subject
  end

  end

NameError:
  uninitialized constant Menu

  2)
  Failures:

    1) Menu allows me to list the items and prices on a menu
       Failure/Error: expect(subject.italian).to eq "Pizza" => 10

       NoMethodError:
         undefined method `italian' for #<Menu:0x00007fc3aed3a468>
       # ./spec/menu_spec.rb:11:in `block (2 levels) in <top (required)>'

  Finished in 0.00227 seconds (files took 0.44612 seconds to load)
  2 examples, 1 failure

Green Unit Test

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




As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

- select several dishes from menu - dishes, quantities and total price (order)
- order = menu.to_a.sample(n).to_h (to get a random sample from a hash)

Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

- check total price(order) is sum of all dishes
order_total = order.value.inject(:+)
if customer_price == order_price
complete_order

Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

- raise error if numbers don't match
- if they do match send text
time = Time.now
delivery_time = time + 1*00*00
fail "error" if customer_price != order_total
send_sms


Red Feature Test

Green Feature Test

Red Unit Test

Green Unit Test
