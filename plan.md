# Plan

## Gemfile
Make sure I include all the gems I use into my gemfile.
- twilio-ruby
- rspec
- rubocop

## Readme

Update README to briefly explain my approach to solving this challenge.
If I don't finish the challenge, explain where I got to in my readme and how I'd plan to finish it.
Add a 'how to use' section to show how my app is used from a user's perspective - IRB code.

## N.B.
Private methods don't require tests.
I may want to make a method private if it's only going to be used internally by Restaurant 
e.g. 'is_correct_amount?(price)' method.

Each object should only have limited knowledge about other units and only those units closely related.
Each object should only talk to its friends.
Avoid calling lots of methods on one object e.g. subject.menu.dishes.length where subject = Restaurant.
These properties belong to the menu, not the restaurant.

Do something where every time an order is created, it creates an order ID?

Order Class <-- Menu Class
Restaurant Class <-- Order Class
Restaurant Class <-- Messager Class

## User Stories
### User story 1
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
1. List of dishes with prices - hash in an array.
Menu class
display method
menu.show_menu --> displays dishes and prices in a list.

### User story 2
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
Order class
- read menu from Menu class
- subject.add_item(dish, quantity = 1)
Test to a few of one time, and a different quantities of a few different items.

### User story 3
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

When the customer places the order, they should be shown 1) the list of dishes 2) their quantities
and 3) the exact total.
Raise an error if the sum is not correct.

In Order Class
- show order summary subject.order_summary --> lists item and quantity
- create method to calculate total_cost (make this private?)
- add the total_cost into the order_summary to then show the order summary and total cost to the customer.
- Create a place_order method that returns true or false based on whether or not the expected cost = total_cost. Return a message that thanks them for placing an order and that the restaurant will confirm when they've received it.

### User story 4
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
Create Restaurant class
- create receive_order method which reads and receives the place_order method from the Order class, based on whether place_order == true. Could this be a module?
- create complete_order method which thanks customer for order, confirming it was received and when it will be delivered.
- Create module with encrypt method to encrypt my phone number? See this http://ruby-for-beginners.rubymonstas.org/advanced/modules.html

Create Messager class to handle Twilio stuff.

If the sum is correct, send a text to the customer that the order was successfully placed and will be delivered in 1 hour from now e.g. 'Thank you! Your order was placed and will be delivered before 18:52'.

I will need to use Twilio API for this; use the twilio-ruby gem to access the API;
use the gemfile to manage my gems.

N.B. Use mocks and/or stubs to make sure I don't send texts when my tests are running! I want to stub
out behaviour as I'm using a 3rd party API.
E.g.
describe Takeaway
  subject(:takeaway) {described_class.new }
before do
  allow(takeaway).to receive(:send_sms)
end
it 'sends a payment confirmation text message' do
  expect(takeaway).to receive(:send_sms).with("<input message>")
  takeaway.complete_order(20.93)
end
I stub out the send_sms method. Expect --> RSpec chescks that the subject received the message send_sms.

I will need something like a Messager class to handle the Twilio messaging, which the Restaurant class will be dependent on. So I'll need to inject the Messager class into the Restaurant class.
E.g.
class Restaurant
def initialize(messager = Messager.new)
@messager = messager
end
end
restaurant = Restaurant.new(dummy_messager) --> dummy = test double.
https://github.com/makersacademy/course/blob/master/pills/levels_of_stubbing.md

The text should be automatically sent if Takeaway is loaded into IRB and the order is placed.

N.B. As I will have a UK account, you can only send a text to UK numbers.
Don't worry about creating the customer's mobile phone - just use mine.

Explore environment variables to keep my phone number private when everything will be on Github.
