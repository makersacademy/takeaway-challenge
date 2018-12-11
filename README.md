# Takeaway Challenge

## What does it do?
This should allow a customer to:
- see a menu containing dishes and their prices
- order dishes from the menu, specifying their quantity
- request the total cost
- place the order, which confirms all items ordered and the total price

In addition, an SMS should be sent to the customer, using the Twilio API, after the order has been placed, to advise on delivery time.

## Goals
This is a weekend challenge given by Maker's Academy, at the end of week 2.
The aim is to help us to:
- TDD anything
- Learn how to do anything

## How to use it
Firstly, you will need to instantiate an instance of the Takeaway Class.

Step1: takeaway = Takeaway.new

Then follow each of the steps below:

Step2: takeaway.menu   (to see the menu)

Step3: takeaway.select_item   (to select a dish and the quantity required)

Step4: takeaway.add_item_to_list   (to store the customer's selected dish to an array)

Step5: takeaway.get_total_cost   (to sum the total of all dishes stored)

Step6: takeaway.sum_correct?  (will return false if you did not get_total_cost)

Step7: takeaway.print_order   (will output a string detailing customer's order and cost)

Step8: takeaway.send_sms   (will send an sms thanking customer for their order)  

NOTE: Steps 3 and 4 ('select_item' and 'add_item_to_list') can be done as many times as you like.
When you have added all the items you want, then go to Step5.


## Code
Below is my Takeaway class:
```
require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :dishes, :prices, :total, :item, :cost, :quantity

  def initialize
    @menu = {}
    @dishes = []
    @prices = []
    @total = 0
    @item = item
    @cost = 0
    @quantity = 0
  end

  def menu
    @menu = {
      "saveloy" => 2.50,
      "chicken" => 2.50,
      "chips" => 2.00,
      "cod" => 5.00,
      "plaice" => 5.00,
      "pizza" => 3.00,
      "salad" => 4.00,
      "peroni" => 3.50
    }
  end

  def select_item(item, quantity)
    @item = item.downcase
    @quantity = quantity
  end

  def add_item_to_list
    @cost = @menu[@item]
    @quantity.times do
      @dishes << @item
      @prices << @cost
    end
  end

  def get_total_cost
    @total = @prices.reduce(0){|sum,num| sum + num }
  end

  def sum_correct?
    @total == @prices.reduce(0){|sum,num| sum + num } ? true : false
  end

  def print_order
    fail 'Incorrect total' if !sum_correct?
    summary = @dishes.each_with_object(Hash.new(0)) { |dish,counts| counts[dish] += 1 }
    puts "You have ordered the following:"
    summary.each do |dish, counts|
      puts "#{dish.capitalize}: x #{counts}"
    end
    puts "Total cost: £#{@total}"
    "Thank-you for your order."
  end

  def send_sms
    fail 'Cannot send sms until total price is correct' if !sum_correct?
    account_sid = 'ACc498e5e24694e51d025e18855db889d1'
    auth_token = '224cf41c7fbdc3727d9388670a7a9a9f'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441423740290'
    to = '+447494454370'

    client.messages.create(
    from: from,
    to: to,
    body: "Thanks for ordering from Baker's Chipshop! Delivery will be within 45mins."
    )
  end
end
```

## Tests
Below are my tests
```
require 'takeaway'

RSpec.describe Takeaway do

  let (:takeaway) { described_class.new }

  it 'will return a list of dishes and prices' do
    expect(takeaway.menu).to be_instance_of(Hash)
  end

  it 'will take the name of dish and the quanity required when selecting an item' do
    takeaway.menu
    expect(takeaway).to respond_to(:select_item).with(2).arguments
  end

  it 'will add your selected dish to a list' do
    takeaway.menu
    takeaway.select_item("CHIPS", 3)
    takeaway.add_item_to_list
    expect(takeaway.dishes).to eq ["chips", "chips", "chips"]
  end

  it 'will sum the total price of all items ordered' do
    takeaway.menu
    takeaway.select_item("plaice", 1)
    takeaway.add_item_to_list
    takeaway.select_item("COD", 2)
    takeaway.add_item_to_list
    takeaway.select_item("CHIcken", 3)
    takeaway.add_item_to_list
    takeaway.select_item("chips", 6)
    takeaway.add_item_to_list
    takeaway.select_item("PERONI", 18)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    expect(takeaway.get_total_cost).to eq 97.5
  end

  it 'will return true or false when asked if sum is correct' do
    takeaway.menu
    takeaway.select_item("chicken", 2)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    expect(takeaway.sum_correct?).to be(true).or be(false)
  end

  it 'will raise an error if total cost is incorrect' do
    takeaway.menu
    takeaway.select_item("SAVELOY", 5)
    takeaway.get_total_cost
    allow(takeaway).to receive(:sum_correct?).and_return(false)
    expect { takeaway.print_order }.to raise_error 'Incorrect total'
  end

  it 'will print order if total price is correct' do
    takeaway.menu
    takeaway.select_item("PIZZA", 20)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    allow(takeaway).to receive(:sum_correct?).and_return(true)
    expect(takeaway.print_order).to be_instance_of(String)
  end

  it 'will send sms if print_order was successful' do
    takeaway.menu
    takeaway.select_item("PIZZA", 3)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    allow(takeaway).to receive(:sum_correct?).and_return(true)
    allow(takeaway).to receive(:print_order).and_return("Thank-you for your order.")
    expect(takeaway).to respond_to(:send_sms)
  end

  it 'will not send sms if total price is incorrect' do
    takeaway.menu
    takeaway.select_item("PIZZA", 3)
    takeaway.add_item_to_list
    allow(takeaway).to receive(:sum_correct?).and_return(false)
    allow(takeaway).to receive(:print_order).and_return("Incorrect total")
    expect { takeaway.send_sms }.to raise_error 'Cannot send sms until total price is correct'
  end

end
```

## Adding Cohesion
My plan had been to firstly do it all in one class, and once it was all working successfully, I would re-group it cohesively into separate classes. However, it took me so long to do the above that I had no time to do this.
I will, however, try to come back to this challenge during the Christmas holidays to add encapsulation & cohesion.

## Evaluation
All of my tests pass, and the sms works. I am therefore happy with my progress.

I successfully used TDD and learned how to use Twilio by using the Twilio docs.

However, I was supposed to use the Twilio gem to order items from the menu, which I didn't do. I also put everything in to one class. I therefore believe I have met many of the required goals of this challenge, although not all.

________________________________________________________________



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
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
