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
Instructions
------------
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program

Task
-----
Our task was to create a Takeaway program with the following user stories:

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

Here is an example of a feature test of my program:
```
2.4.0 :001 > require './lib/order.rb'
 => true
2.4.0 :002 > menu = Menu.new
 => #<Menu:0x007fbf5e036e78>
2.4.0 :003 > order = Order.new
 => #<Order:0x007fbf5e1a1c90 @basket=[], @updated_basket={}>
2.4.0 :004 > order.order_dish('Kobe Slider')
1 Kobe Slider(s) added to your basket.
 => nil
2.4.0 :005 > order.order_dish(3, 'Shrimp Tempura')
3 Shrimp Tempura(s) added to your basket.
 => nil
2.4.0 :006 > order.show_basket
(1) Kobe Slider(s): £7
(3) Shrimp Tempura(s): £12
Total to pay: £19
 => nil
2.4.0 :007 > order.place_order
```

Approach to solving the challenge:
----------------------------------

First, I created a domain model for each User Story (above) to keep track of the specified criteria.

My program ensures that:

* The menu can be read; it gives the list of dishes and associated prices
* The customer can choose a quantity for the available dishes from the menu
* If the dish is not listed on the menu, the customer is prompted to select an available item from the menu
* The customer can see their basket which gives the total items and prices of the various dishes they ordered
* The customer receives a text when their order is placed and what time to expect their delivery to arrive

Creating the menu
-----------------

I wrote a few test cases for creating my menu. First describing what I wanted to test and then running it through RSPEC and expecting errors to occur.

```ruby
describe Menu do
  describe '#initialize' do
    it { is_expected.to respond_to(:initialize) }
  end
```

I expected the errors to show that I didn't have a 'Menu' class or an 'initialize' method. So, then proceeded to write the code for the tests to pass.

```ruby
class Menu
  def initialize

  end
end
```
I then proceeded to write tests to actually create and output the menu and the supporting code for that. I removed the respond to method expectation as it seemed redundant; I knew it would expect that and need a method to be able to work.

**Tests:**  
```ruby
describe Menu do
  describe '#initialize' do
    it 'initializes with the list of dishes' do
      expect(menu.dishes).to eq @dishes
    end
  end

  describe '#read_menu' do
    it 'outputs the menu' do
      expect { menu.read_menu }.to output(@dishes).to_stdout
    end
  end
end
```

**Code:**  
```ruby
class Menu
  attr_reader :dishes

  def initialize
    create_menu
  end

  def create_menu
    @@dishes = { 'Kobe Slider' => 7,
                 'Shrimp Tempura' => 4,
                 'Salmon Teriyaki' => 5,
                 'Chicken Katsu' => 8,
                 'Edamame Pot' => 2 }
  end

  def read_menu
    @@dishes.each do |key, value|
      puts key + ": £" + value.to_s
    end
  end
end
```

Creating the order
------------------
In much the same way as the menu class, the order class was tested and created following the TDD method.


  **Ordering the dish:**  
  When a customer orders a dish, I set the default balance to equal 1 under the assumption that the customer would order at least 1 of any of the dishes. This quantity is also changeable at the time of ordering. The dish is looked up (from the menu list hash from the menu class) to retrieve the name and price key-value pair and adds it to the basket. Each combination of dishes ordered is grouped and pushed to an updated basket whilst also being displayed to the customer as being added to the basket.

  **Showing the basket:**  
  The basket shows the customer all the dishes and prices they have ordered and gives them a total price to pay.

  **Placing the order:**  
  Once the customer is satisfied with their choices, they can place the order which sends them a text that thanks them for their order, with their name and what time it will be delivered (I set it to deliver an hour after the order was placed).

  [I used a Twilio number and my phone number to test the text(s) deliveries could be received.]


How I plan to finish the challenge
----------------------------------
Although, I have met the requirements from the user stories, I would like to incorporate some doubles, mocks and stubs into my program. I found it difficult to add these without the tests breaking, even though the code was working correctly.
