Week 2 Weekend Challenge: Takeaway challenge!
by Max Provin


Take a TDD approach to implementing features based on the following user stories:


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


I have approached this weeks challenge in a similar fasion to the previous weeks work, using IRB to design and test the functionality I wanted my program to have and using RSPEC to create unit tests that I then used to drive my written code.
The newest feature we have been introduced to is the implementation and use of API's which I found hard to create effective tests for. As a result I ended up adding it into my code efectively more through trial and error than in a test driven manner although the end result was still functional and I believe it still adheres to the user stories.

The following is an example run of the code in terminal (missing line was an error due to typo):

2.2.3 :001 > require './lib/restaurant'
 => true

2.2.3 :002 > dallhas_chicken = Restaurant.new
 => #<Restaurant:0x007fc1fc27ca20 @menu=#<Menu:0x007fc1fc27c9f8 @dishes={"beef burger"=>"1.99", "cheese burger"=>"1.99", "chicken wings"=>"0.49", "coke"=>"0.99"}>, @order=#<Order:0x007fc1fc27c8e0 @trolley=[], @cost=0, @messenger=#<Messenger:0x007fc1fc27c8b8>>>

2.2.3 :003 > dallhas_chicken.show_menu
 => {"beef burger"=>"1.99", "cheese burger"=>"1.99", "chicken wings"=>"0.49", "coke"=>"0.99"}

2.2.3 :004 > dallhas_chicken.place_order('beef burger')
 => [{"beef burger"=>"1.99"}]

2.2.3 :005 > dallhas_chicken.place_order('gumbo', 2)
RuntimeError: Dish is not on the menu: Please make another selection
  from /Users/Luiz/Max/weekend_challenges/takeaway-challenge/lib/menu.rb:24:in `required_dish'
  from /Users/Luiz/Max/weekend_challenges/takeaway-challenge/lib/menu.rb:10:in `select_dish'
  from /Users/Luiz/Max/weekend_challenges/takeaway-challenge/lib/restaurant.rb:16:in `place_order'
  from (irb):5
  from /Users/Luiz/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'

2.2.3 :006 > dallhas_chicken.place_order('cheese burger', 2)
 => [{"beef burger"=>"1.99"}, {"cheese burger"=>"1.99"}, {"cheese burger"=>"1.99"}]

2.2.3 :007 > dallhas_chicken.place_order('chicken wings', 4)
 => [{"beef burger"=>"1.99"}, {"cheese burger"=>"1.99"}, {"cheese burger"=>"1.99"}, {"chicken wings"=>"0.49"}, {"chicken wings"=>"0.49"}, {"chicken wings"=>"0.49"}, {"chicken wings"=>"0.49"}]

2.2.3 :009 > dallhas_chicken.check_order
 => [{"beef burger"=>"1.99"}, {"cheese burger"=>"1.99"}, {"cheese burger"=>"1.99"}, {"chicken wings"=>"0.49"}, {"chicken wings"=>"0.49"}, {"chicken wings"=>"0.49"}, {"chicken wings"=>"0.49"}]

2.2.3 :010 > dallhas_chicken.confirm_order
Sent message to somebody out there
 => #<Order:0x007fc1fc04ea28 @trolley=[], @cost=0, @messenger=#<Messenger:0x007fc1fc04ea00>>