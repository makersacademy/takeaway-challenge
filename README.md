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
-------
This a weekend challenge to build a takeaway program with following user stories

User Stories Covered With Unit Tests
-------------------------------------

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

How to use
---------------------

- Clone it (command line -git git@github.com:reenz/takeaway-challenge.git)
- Install dependencies (command line - bundle install)
- Go to irb
```
  require "./lib/takeaway.rb"
  takeaway = Takeaway.new
  takeaway.read_menu
=> {"Bombay aloo"=>3.25, "Dal tadka"=>3.35, "Boiled rice"=>2.0, "Fried rice"=>3.0, "Naan"=>1.5, "Lassi"=>3.0, "Juice"=>2.0}
  takeaway.order("Lassi", 2)
=> "Lassi * 2 added to basket"
  takeaway.view_basket
=> "Lassi * 2 = 6.0"
  takeaway.complete_order(6)
```

Technologies Used
---------------------
- Ruby
- Rspec
- Twilio-ruby
- Rake
- Rubocop
- Capybara
- Simplecov
```

Possible Enhancements
---------------------

1. Fully unit test the `messenger.rb` file
2. Mock out the usage of `Time`
3. Enable the functionality to back out orders
