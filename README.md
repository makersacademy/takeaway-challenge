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

# Takeaway Challenge
In this app, you can create **Takeaway** objects and pass dishes into them, which can then be displayed by that Takeaway in a menu format. The user can select dishes from the menu and it will create an **Order**, storing them in a **basket**. You can then see the **.total** cost of the current items, and **confirm_order** to receive a text notification summarising the order, and estimating the delivery as 1 hour from when you confirmed it.

Includes 21/21 tests passing, 100% coverage across 158 lines in 8 files

## Using the application in irb
```
irb

require './lib/dish'
require './lib/order'
require './lib/sms'
require './lib/takeaway'

dish1 = Dish.new("Dish name here", -price(integer)-)
dish2 = Dish.new("Dish name here", -price(integer)-)
# add as many dishes as you want, the currency is £

takeaway = Takeaway.new([dish1, dish2])
# if passing multiple dishes, they must be in an array

takeaway.menu
# shows the menu

takeaway.select_dish(dish1, -optional quantity(integer)-)  # must be a dish object
takeaway.select_dish(dish2, -optional quantity(integer)-)

takeaway.remove_dish(dish) # must be a dish in the menu
takeaway.reset_order # if you changed your mind and want to start again

takeaway.total # returns the total cost of the current order

takeaway.confirm # sends a text confirming the order, and clears the order ready for a new one
```

## My Approach
This challenge required a firm grasp of mocking. I tried to implemented mocks for everything except Ruby's Time class (this looked like it required a gem as you can't freeze a time and stub it). Every class is tested in isolation, including my best attemps to mock Twilio. 

There were many different approaches I found for this, one being another gem 'twilio_mock' which I couldn't quite implement, another being creating an entire mock **SMS** class which accurately mimicked Twilio's behaviour and expectations, and then using stub_const in the Rspec spec_helper to replace the real Twilio client. 

After struggling to get both to work, I tried to mock it as best as possible with just the existing methods. It currently tests that the string passed in with the **.text** method in Takeaway is successfully sent as the **:body** and received by a mock client. I'm not sure how effective this test is.

The other tests account for some edge cases but not all, as there were some I was not sure how to handle. The program supports functionality with multiple **Takeaway** objects, each with their own selection of **dishes**, however in theory you could pass the same **Dish** object into multiple takeaways (let's say takeaway1 and takeaway2), and then order this dish in takeaway1's instance from takeaway2.

I couldn't make an efficient solution in the time allocated. I think it would probably need a new Class that stores all known takeaways to check if each set of Dishes is unique, perhaps using some sort of id number.
