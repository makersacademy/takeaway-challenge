# Introduction
Welcome to the code review for Takeaway Challenge!  Again, don't worry - you are not expected to have all the answers. The following is a code-review scaffold for Takeaway Challenge that you can follow if you want to.  These are common issues to look out for in this challenge - but you may decide to take your own route.

If you don't feel comfortable giving technical feedback at this stage, try going through this guide with your reviewee and review the code together.

Please use [this form](https://goo.gl/forms/kl8BCIwaEqu9G0Nx2) to tick off where your reviewee has successfully avoided these issues!  This form helps us get an overall picture of how the whole cohort is doing - it's not an assessment of an individual student.

# Step 0: Checkout and Run tests

Please checkout your reviewee's code and run their tests. Read the code and try some manual feature tests in IRB. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?

# Step 1: Structure and supporting files

## Ensure that all gems being used are in Gemfile

Please do include all the gems you use in your Gemfile. This is an important courtesy to other developers and yourself in the future, so that all the project dependencies can be pulled in whenever the project is checked out on a new machine, e.g. `twilio-ruby` gem

## README updated

Every good code base will have its README updated following the [contribution notes](https://github.com/makersacademy/takeaway-challenge/blob/master/CONTRIBUTING.md), i.e.

* Make sure you have written your own README that briefly explains your approach to solving the challenge.
* If your code isn't finished it's not ideal but acceptable as long as you explain in your README where you got to and how you would plan to finish the challenge.

The above is a relatively straightforward thing to do that doesn't involve much programming.  Pro-tip: work on this while letting your sub-conscious work on those trickier coding problems :-)

## Instructions in README

The README is a great place to show the full story of how your app is used (from a user's perspective), e.g.

```sh
2.2.3 :001 > t = TakeAway.new
 => #<TakeAway:0x007f975b1a39a8 @menu=#<Menu:0x007f975b1a3890 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007f975b1a33e0>>
2.2.3 :002 > t.read_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
2.2.3 :003 > t.order 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :004 > t.order 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :005 > t.order 'spring roll', 4
 => "6x spring roll(s) added to your basket."
2.2.3 :006 > t.basket_summary
 => "spring roll x6 = £5.94"
2.2.3 :007 > t.add 'pork dumpling', 3
 => "3x pork dumpling(s) added to your basket."
2.2.3 :008 > t.basket_summary
 => "spring roll x6 = £5.94, pork dumpling x3 = £8.97"
2.2.3 :009 > t.total
 => "Total: £14.91"
2.2.3 :010 > c.checkout(14.91)
```

# Step 2: Tests and \*\_spec.rb files  

## Tests should test real behaviours not stubs

We already talked about ["Vacuous" tests](https://github.com/makersacademy/airport_challenge/blob/master/docs/review.md#vacuous-tests) in the airport challenge code review.  The example there focused on how we shouldn't test the behaviour of a double; but we can get into similar trouble if we are stubbing a real object, e.g.

```ruby
it 'sends a payment confirmation text message' do
  expect(subject).to receive(:send_sms)
  subject.send_sms(20.93)
end
```

In the above the `expect(subject).to receive(:send_sms)` command "stubs" out any existing method called `send_sms` on the subject.  Using `expect` instead of `allow` means that at the end of the it block, RSpec checks that subject did receive the message `send_sms`, which we have ensured by calling `subject.send_sms`, so this test passes without ever touching the application code.

You can confirm this test is 'vacuous' by checking that the [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) doesn't change when you remove it.

In general you shouldn't be stubbing out behaviour on the object under test.  The two key exceptions are when you have randomness or a 3rd party API.  We saw how to [stub random behaviour](https://github.com/makersacademy/airport_challenge/blob/master/docs/review.md#handling-randomness-in-tests) in the airport challenge code review, but how do we stub a 3rd party API?  See the next section.

## Stubbing the Twilio API

The Twilio gem provides access to the online Twilio service.  If we don't stub out this interaction, we will send test SMS messages every time we run our tests.  Not a good thing.

The simplest approach is to stub out a method that calls the service, for example:

```ruby
class Takeaway

  def complete_order
    send_text("Thank you for your order: £#{total_price}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end

  ...
end
```

can be stubbed out like so:

```ruby
describe Takeaway
  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:send_text)
  end

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text).with("Thank you for your order: £20.93")
    takeaway.complete_order(20.93)
  end
end
```

This ensures that Takeaway#complete_order gets some test coverage and that no SMS will be sent by our tests.  This is acceptable, but we still don't have very good test coverage.  See the pill on [levels of stubbing 3rd party services](https://github.com/makersacademy/course/blob/master/pills/levels_of_stubbing.md) for some alternatives.

## Unit vs Integration tests

Note that if you create real objects (not doubles) in your unit tests other than that which is the subject, then you are using the [Chicago style)[http://programmers.stackexchange.com/questions/123627/what-are-the-london-and-chicago-schools-of-tdd] of unit testing (also called [integration testing](http://stackoverflow.com/a/7876055/316729)).  In general you want to separate up your unit from your integration (or "feature") tests.  Unit tests can just rest in the root of the spec folder, but features of integration tests should go in a subfolder (spec/features or spec/integration) or even in a separate folder on the root directory to allow them to run completely separately.

At Makers Academy we recommend using the London style with doubles to effectively isolate the single class being tested in a unit test.

```ruby
# London Style
describe Order do
  let(:menu) { double :menu, price: '£1.00', contains?: true }
  subject(:order) { described_class.new(menu) }

  it 'order total to be sum of items added' do
    order.add('Pizza')
    order.add('Pizza')
    expect(order.total).to eq '£2.00'
  end
end
```

```ruby
# Chicago Style --> arguably an 'integration' or 'feature' test
describe Order do
  subject(:order) { described_class.new(Menu.new) } # note real Menu class

  it 'order total to be sum of items added' do
    order.add('Pizza')
    order.add('Pizza')
    expect(order.total).to eq '£2.00'
  end
end
```

## Explicit tests for every element of the public interface

The public interface of a class is any method that can be accessed publicly. So for example:

```ruby
class Takeaway

  def complete_order(price)
    is_correct_amount?(price)
    ...
  end

  def is_correct_amount?(price)
    total_price == price
  end
end
```

has two public methods, `complete_order` and `is_correct_amount?`, that both should be tested independently `is_correct_amount?` will be implicitly tested by any test of `complete_order`, but since it is public it should have it's own expilcit test.

However, perhaps `is_correct_amount?` will only ever used internally by Takeaway, and never called by any collaborator objects?  In which case we can make the public interface of Takeaway simpler like so:

```ruby
class Takeaway

  def complete_order(price)
    is_correct_amount?(price)
    ...
  end

  private

  def is_correct_amount?(price)
    total_price == price
  end
end
```

`private` methods do not require tests; although having too many private methods is a design smell.  Anyhow, having moved `is_correct_amount?` into a private method we have reduced the complexity of the public interface of Takeaway (a good thing) and we no longer have to test `is_correct_amount?` explicitly, which also slims down our tests.  Reducing the complexity of the public interface of any class (both in terms of number of methods, and numbers of arguments they take) is generally a good thing as it reduces the numbers of ways in which the object can interact with other objects, and encourages a loose coupling between objects that promotes re-use.

# Step 3: Application code and \*.rb files

## Use of modules

There are two main uses of modules in Ruby; one is to provide 'utility' libraries (which are sometimes a code smell) and the other is to provide mixins.  However, using a module as a mixin can violate the Single Responsibility Principle.  Although code is _defined_ in the module, when it is `include`d in a class, its behaviour becomes part of that class and therefore part of the class's responsibilities.  Shared behavioiur can be refactored into mixins (e.g. `BikeContainer` in Boris Bikes), but other responsibilities the class is dependent on (e.g. sending text messages for the restaurant) should be injected (see [Appropriate use of Dependency Injection](appropriate-use-of-dependency-injection)).

## Law of Demeter

The [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter) suggests that:

* Each object should have only limited knowledge about other units: only units "closely" related to the current unit.
* Each object should only talk to its friends; don't talk to strangers.
* Only talk to your immediate friends.

The following test shows a process of reaching through a series of related objects.  The warning sign is the multiple periods in `subject.menu.dishes.length`.  Here we are seeing `Restaurant` is being tested for properties that belong to the menu - effectively they are none of restaurant's business and shouldn't be tested here; and we shouldn't see deep-reaching chains like this in application code either:

```ruby
describe Restaurant do
  it "has 2 items on the menu" do
    expect(subject.menu.dishes.length).to eq(2)
  end
end
```

Note this is different to *method chaining*, which enables the calling of multiple methods _on the same object_ in one line of code.  The Demeter violation applies to reaching down through multiple objects.

## Appropriate use of Dependency Injection

It is likely that the `Restaurant` (or equivalent) class is dependent on another object to handle the Twilio messaging.  If not, then this is a violation of Single Responsibility Principle.  In order to invert dependencies and make testing easier, the Twilio class should be _injected_ into the `Restaurant` class.  So instead of:

```ruby
class Restaurant
  def initialize()
    @mmessager = Messager.new
  end
end
...
restaurant = Restaurant.new
```

You can have (note you can define a default for the dependency as shown here, but that's optional):
```ruby
class Restaurant
  def initialize(messager = Messager.new)
    @messager = messager
  end
end
...
restaurant = Restaurant.new
# or
restaurant = Restaurant.new(dummy_messager)
# where dummy_messager might be a test double for example
```

## Separation of Concerns

Applications generally comprise a number of *concerns*.  For example, pure business logic is a concern; interacting with the user (UI) is a concern; persisting data to a file or database is a concern; and so on.  Generally, as well as having a single responsibility, a class should only be involved in one concern (which kind of follows, right?).

To this end, a class that contains pure business logic should not also be concerned with the User Interface or presentation logic.  If your business logic class uses `puts` statements to communicate with the user, then it has poor separation of concerns.  Business logic objects should return other objects and status indicators that can be translated in a separate presentation layer into user-friendly messages and interactions.  This means our business logic is not constrained to a particular output representation.

Separation of concerns leads to some very powerful design patterns such as Model View Controller (MVC), which we will meet in Week 4.

```ruby
# good
class Menu
  def to_s
    'the menu is empty'
  end
end
```

```
$ menu = Menu.new
$ puts menu # note that the to_s is called by default when `puts`ing an object in Ruby
=> "the menu is empty"
```

```ruby
# bad
class Menu
  def display
    puts 'the menu is empty'
  end
end
```

```
$ menu = Menu.new
$ menu.display
=> "the menu is empty" # note that this string will be outputed in your tests etc.
```

## Design for Single Responsibility Principle

It's easy to overlook responsibilities and end up with a class that does too much.  This is a great opportunity to refactor your design to extract those responsibilities. One common indication is that a group of methods share a noun.  For example, in `Restaurant` we might have:

```ruby
def add_to_order(item)
...
end

def order_total
...
end

def finalize_order
...
end
```

The noun 'order' appears in three method names and this is a clear indication that we need an `Order` class.  The beauty of OO is that as soon as we extract this responsibility into another class, our design becomes instantly much more powerful.  Enabling the restaurant to handle multiple orders is suddenly much easier.


## Personal details and tokens on GitHub

A well ordered codebase will use ENV variables and the [dotenv gem](https://github.com/bkeepers/dotenv) to ensure that sensitive infomration such as phone numbers and security tokens are not pushed up to public repos on Github.

## Explore the language for solutions to common problems
### Use `Hash.new` to specify defaults other than `nil`

This can be particularly useful if you are managing counts of things (e.g. dishes).  Instead of:
```ruby
def initialize
  @items = {}
end

def add_dish(dish, quantity = 1)
  @items[dish] = 0 unless items[dish]
  @items[dish] += quantity
end
```
You can remove the test and initialization in the first line of `add_dish` by defining `0` as the default:
```ruby
def initialize
  @items = Hash.new(0)
end

def add_dish(dish, quantity = 1)
  @items[dish] += quantity
end
```

### Use `reduce` to aggregate over a collection (e.g. when calculating the total)

instead of the following (which assumes `@items` is an array rather than a hash):

```ruby
def total_price
  total = 0
  @items.each do |item|
    total += item.price
  end
  total
end
```
You can use the `reduce` method (alias `inject`) already provided by Ruby:
```ruby
def total_price
  @items.reduce { |sum, item| sum + item }
end
```

## Open Closed Principle

The Open Closed Principle tells us that we want our code to be *open* for extension but *closed* for modification.  The idea is that if we need to add some new functionality then we can do that by *extending* our code rather than *modifying* it.

For example the menu items should not be hard coded into a restaurant class.  Arguably they should not be in the business logic at all, e.g. being added at runtime (i.e. in IRB) or loaded from an external hash or maybe even a file.  We are concerned that the menu items will likely change, so if they are hard coded in like this:

```ruby
class Restaurant
  def initialize
    @menu = {}
    @menu[:pizza] = 100
    @menu[:coke] = 70
  end
end
```

Then in order to make any changes to the menu we have to open up the Restaurant class itself.  Restaurant is not open for extension at all in the above example.  It must be opened up for modification in order to make any changes to the menu.  Consider this alternative:

```ruby
class Restaurant
  def initialize(menu = Menu.new)
    @menu = menu
  end
end
```

The type of Menu that Restaurant uses can now easily be changed.  It is "open for extension".  We can create a new type of Menu class that loads from a file, takes dynamic user, whatever we want, and Restaurant will happily collaborate (assuming the menu has the correct public interface, e.g. Menu#contains?, Menu#price etc.).  This latter Restaurant is also "closed for modification".  We don't need to modify because it can easily be extended through the use of different collaborator objects.

## Use consistent styles and indentation

The Ruby community has a very consistent style guide and you should follow it.  Use tools like [Rubocop](https://github.com/bbatsov/rubocop) (`gem install rubocop ; rubocop`) to analyze your code for violations.

You may find it difficult to remember the indentation rules, but one helpful rule of thumb for indentation is to ensure that you are two space indented inside any `do ... end`, `class ... end` or `def ... end` block.
