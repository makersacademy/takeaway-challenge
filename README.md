# Takeaway Challenge

[Exercise instructions are here](takeaway-challenge.md)

## Installation

1. Fork and clone this repo
2. `bundle install`
3. Copy `twilio-config-EXAMPLE` to `twilio-config-PRIVATE` (the latter is protected by `.gitignore`)
4. Enter your Twilio credentials and phone numbers in `twilio-config-PRIVATE`

## Instructions

First load Twilio credentials: `source ./twilio-config-PRIVATE`.

Then:

```ruby
➜ irb -r ./lib/takeaway.rb      
2.5.0 :001 > t = Takeaway.new
 => #<Takeaway...> 
2.5.0 :002 > t.menu
 => [{:name=>"Mixed Meze", :price=>10}, {:name=>"Lahmacun", :price=>4}, {:name=>"Chicken Beyti", :price=>10}, {:name=>"Iskender", :price=>12}, {:name=>"Icli Kofe", :price=>12}, {:name=>"Baklava", :price=>6}] 
2.5.0 :003 > t.pretty_menu
Oº°‘¨ Welcome to Grill Communication! ¨‘°ºO
0: Mixed Meze, £10
1: Lahmacun, £4
2: Chicken Beyti, £10
3: Iskender, £12
4: Icli Kofe, £12
5: Baklava, £6
 => nil 
2.5.0 :005 > t.add_to_order 2, 1
 => [{:name=>"Chicken Beyti", :price=>10}] 
2.5.0 :006 > t.add_to_order 1, 2
 => [{:name=>"Chicken Beyti", :price=>10}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}] 
2.5.0 :007 > t.total
 => 18 
2.5.0 :008 > t.confirm(18)
 => true 
```

We will confirm delivery time by text message. Bon appetit! 👨‍🍳

## My method

I tried my best to use a strict TDD approach:
1. Convert user story into a feature test in `spec/features/user_stories_spec.rb`
2. When that fails make a unit test for the failing class which fails in the same way
3. Write the minimal code to fix the feature and unit test failures
4. Repeat until the feature is implemented
5. Refactor, rinse, repeat

I didn't attempt to implement ordering via SMS, but I did have it in my mind as I was working on the exercise. That's why I chose for my `Takeaway.add_to_order` method to identify the menu items via an index which is printed in the `Takeaway.pretty_menu` - I thought that would be an easier interface to interact with via SMS then having to e.g. type out the name of each order item.

Having the identifier for the menu items being the array index seems fragile - it means adding more items to the menu will cause the identifiers to change. Not a problem with the current implementation, but for future extensibility I think it would be better for each menu item to have a fixed, unique identifier. Or even be an object

As per the Airport Challenge Exemplar video, I tried to keep all my public methods as readable as possible by moving more complex statements into private methods, e.g. the `Order.remove_one_item` method which is used by `Order.remove`.

### Test coverage

RSpec test coverage is 100% and green at time of writing. All public methods have tests, except maybe `Order.basket`... although that is used in some tests on that class... is that good enough? Rubocop is clear too.

### SRP vibes

I tried to keep all my methods short and focussed. None are longer than 3 lines, many are 1 line. I used four main classes, with the following responsibilities:

- `Takeaway` - provides the user interface
- `Menu` - contains the menu items and methods for getting and checking menu items, and formatting the menu for display
- `Order` - provides a basket to hold order items, methods to add and remove from it, and to confirm the order
- `MessagerTwilio` - provides a method to send an SMS via the Twilio service
- `MessagerStdout` - provides a method to print a message to STDOUT. A drop-in replacement for `MessagerTwilio` that I used in testing
- `Dish` - I was close to extracting a class for a `dish` object for the menu items, but it seemed too pointless since the functionality you need for the current implementation can be achieved with a hash... but I think it could help make the program more extensible, e.g. by adding a method to record how many times a particular dish has been ordered

### Dependency injection

Dependent classes are injected and then stubbed out in the tests, so that tests for each class will still pass if all the other classes are commented out.

## TODO

- Bonus round - order via text
- Basket should be emptied when you confirm your order
- I think my [messager_twilio_spec](spec/messager_twilio_spec.rb) is not very 'test behaviour not state'... would it be better to test for the output of `MessagerTwilio.send`? I think something similar could be said for `Takeaway.confirm` and `Takeaway.send_confirmation_message`
- Check [this pill](https://github.com/makersacademy/course/blob/master/pills/levels_of_stubbing.md) on different strategies for stubbing out 3rd party APIs
- Could have used [modules](https://github.com/Hives/takeaway-challenge/blob/master/docs/review.md#use-of-modules) for the Messager objects. Is that a good idea?
- Use [dotenv gem](https://github.com/bkeepers/dotenv) to manage environment variables
- I'm sure there's loads of other stuff I missed!
