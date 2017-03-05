## Takeaway Challenge
#### Technologies: Ruby, RSpec, Twilio
### Week 2 solo weekend challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [User Stories](#user-stories) | [Gems](#gems) | [Usage Instructions](#usage-instructions) 
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
## Brief
Write a Takeaway program!

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

## Outline
For the second solo weekend challenge at Makers Academy, the task was to create a command line takeaway app.  As with previous challenges, all code was written test first.

My solution uses dependency injection in order to loosen the coupling between the different classes.  This project was also my first introduciton to APIs - the application uses Twilio to send a text message when an order is placed.

## User Stories
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

## Gems
```ruby
ruby '2.3.1'

gem 'twilio-ruby'
gem 'rake'
gem 'coveralls', require: false
gem 'capybara'

group :development, :test do
  gem "rspec"
end
```

## Usage Instructions
* clone the repo and run bundle
```shell
git clone https://github.com/samjones1001/takeaway-challenge
cd takeaway-challenge
rvm 2.3.1
bundle
```
* run the application in irb
```shell
$ irb
2.3.1 :001 > require './lib/takeaway'
 => true 
2.3.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00000002b29790 @menu=#<Menu:0x00000002b29768 @items={"garlic bread"=>2.99, "pizza"=>7.99}>, @order=#<Order:0x00000002b29718 @current_order=[], @total=0.0>, @sms=#<Sms:0x00000002b296c8>> 
2.3.1 :003 > takeaway.view_menu
 => "garlic bread : £2.99,\npizza : £7.99" 
2.3.1 :004 > takeaway.add_to_order("garlic bread")
 => "Your current order total is £2.99" 
2.3.1 :005 > takeaway.add_to_order("pizza", 2)
 => "Your current order total is £18.97" 
2.3.1 :006 > takeaway.check_order
 => "{\"garlic bread\"=>2.99},\n{\"pizza\"=>7.99},\n{\"pizza\"=>7.99} \n Your current order total is £18.97" 
2.3.1 :007 > takeaway.place_order
 => "Thanks for your order!  You will be charged £18.97.  You will receive a confirmation SMS shortly." 
```







