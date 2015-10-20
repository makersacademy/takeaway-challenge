# Introduction
Welcome to the code review for Takeaway Challenge!  Again, don't worry - you are not expected to have all the answers. The following is a code-review scaffold for Takeaway Challenge that you can follow if you want to.  These are common issues to look out for in this challenge - but you may decide to take your own route.

If you don't feel comfortable giving technical feedback at this stage, try going through this guide with your reviewee and review the code together.

Please use [this form] to record each of the following issues as they occur.  This form helps us get an overall picture of how the whole cohort is doing - it's not an assessment of an individual student.

# Step 0: Checkout and Run tests

Please checkout your reviewee's code and run their tests. Read the code and try some manual feature tests in IRB. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?

# Step 1: Structure and supporting files

## Ensure that all gems being used are in Gemfile

Please do include all the gems you use in your Gemfile. This is an important courtesy to other developers and yourself in the future, so that all the project dependencies can be pulled in whenever the project is checked out on a new machine, e.g. `twilio-ruby` gem

## README not updated

Please do update your README following the [contribution notes](https://github.com/makersacademy/takeaway-challenge/blob/master/CONTRIBUTING.md), i.e.

* Make sure you have written your own README that briefly explains your approach to solving the challenge.
* If your code isn't finished it's not ideal but acceptable as long as you explain in your README where you got to and how you would plan to finish the challenge.

The above is a relatively straightforward thing to do that doesn't involve much programming - I'll often get it done while thinking about other problems in the back of my mind :-)

## Instructions in README

It's a great idea to show the full story of how your app is used (from a user's perspective) in the README.

```sh
2.2.3 :001 > c = Customer.new
 => #<Customer:0x007f975b1a39a8 @menu=#<Menu:0x007f975b1a3890 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007f975b1a33e0>>
2.2.3 :002 > c.read_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
2.2.3 :003 > c.add 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :004 > c.add 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :005 > c.add 'spring roll', 4
 => "4x spring roll(s) added to your basket."
2.2.3 :006 > c.basket_summary
 => "spring roll x4 = £3.96"
2.2.3 :007 > c.add 'pork dumpling', 3
 => "3x pork dumpling(s) added to your basket."
2.2.3 :008 > c.basket_summary
 => "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
2.2.3 :009 > c.total
 => "Total: £12.93"
2.2.3 :010 > c.checkout(12.93)
```

# Step 2: Tests and \*\_spec.rb files  

## Stubbing the Twilio API
- link to pill on stubbing & VCR etc.

## Watch out for Vacuous tests

This is an unnecessary ('vacuous') test. If you remove it, you'll have coverage just as high as you do now.
```ruby
it 'sends a payment confirmation text message' do
  expect(text_api).to receive(:send_sms)
  text_api.send_sms(20.93)
end
```
You can confirm this test is 'vacuous' by checking that the code coverage doesn't change when you remove it.

- make sure the object under test is not a double

## Unit vs Integration tests

Note that if you create real objects in your tests other than that which is the subject, then you are creating an integration test (or using the Chicago style).  In general you want to separate up your unit from your integration/feature tests.  Unit tests can just rest in the root of the spec folder, but features of integration tests should go in a subfolder (spec/features or spec/integration) or even in a separate folder on the root directory to allow them to run completely separately.

If you are using Chicago style unit tests where you are using other real classes apart from the subject under test, you  should be trying to use them as sparingly as possible.

## Use of named subject etc.
https://github.com/makersacademy/airport_challenge/blob/master/docs/review.md#use-named-subject-with-described_class

## Ensure there are explicit tests for every element of the public interface
- should method be private? (The Takeaway#verify method is not being accessed by the test or any collaborator object so it could be private)

# Step 3: Application code and \*.rb files

## Use of modules

## Demeter Violations

The [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter) suggests that:

* Each object should have only limited knowledge about other units: only units "closely" related to the current unit.
* Each object should only talk to its friends; don't talk to strangers.
* Only talk to your immediate friends.

The following test shows a process of reaching through a series of related objects.  The warning sign is the multiple periods in `subject.menu.dishes.length`.  Here we are seeing Restaurant is being tested for properties that belong to the menu - effectively they are none of restaurant's business and shouldn't be tested here; and we shouldn't be seeing chains like this in application code either

```ruby
describe Restaurant do
  it "has a menu" do
    expect(subject.menu.dishes.length).to eq(2)
  end
end
```

## Appropriate use of Dependency Injection

One way to do this would be to make Takeaway a class and then have Customer refer to that via composition, e.g. just `@takeaway = Takeaway.new` in the customer constructor, although we might then want to clean that up with dependency injection (DI) like so:

```ruby
require 'takeaway'

class Customer

  def initialize(klass = Takeaway)
    @takeaway = klass.new
  end

  def view_menu
    @takeaway.menu
  end
```

## Separation of Concerns

Note that you should generally prefer to avoid having `puts` in your classes or modules.  If there is output to present on the command line we should prefer to return it from the method and have all output displayed from some ruby code in a base takeaway.rb file or similar, i.e. one that doesn't have classes/modules.  The idea here is 'separation of concerns' - the same reason why we try not to mix different languages (e.g. ruby and html) wherever possible.  We don't want to lock our business logic to a particular output representation, i.e. in this case takeaway and customer are business objects and so they shouldn't do anything that locks them to STDOUT/STDIN i.e. prefer not to use gets and puts inside those classes/modules

## Design for Single Responsibility Principle

This method should probably exist in its own class, as right now this current class has too many responsibilities.

You only have two classes and they don't interact, so you don't find yourself in a situation needing doubles to stub out interaction between the two - you should probably pull out a menu class and then test TakeAway and Menu independently, so their responsibilities can be separated according to the Single Responsibility Principle (SRP)

## Personal Details and Tokens on GitHub
Your phone/sid/auth_token are on github see https://help.github.com/articles/remove-sensitive-data/ to remove them, and prefer ENV variables and possibly also the dotenv gem in order to avoid this in future


## Use Hash.new(0) to simplify code tracking numbers of things
- Use the language to solve problems that have already been solved
- use inject
The logic for managing counts of things can be simplified by creating a hash with a default value `Hash.new(0)`

## Tell don't ask
https://pragprog.com/articles/tell-dont-ask

## Open/ closed principle
- e.g. hard coding the menu

## Use consistent styles and indentation
