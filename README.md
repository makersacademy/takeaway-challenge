Takeaway Challenge
==================

## Approach by Claire Nelson

#### Break down the requirements using tables and Excalidraw following techniques learnt in Intro to TDD workshop and Domain Modelling workshop

- Capture the nouns in the user stories as objects and verbs in user stories as messages. Use the techniques learnt in the first week of Makers to create [object model tables](https://github.com/nelsonclaire/takeaway-challenge/blob/master/task_stories/user_stories.md) which should assist with how to create the tests, classes and methods for the four user stories worked out with the client.
- Draw a diagram using [Excalidraw](https://github.com/nelsonclaire/takeaway-challenge/blob/master/task_stories/excalidraw.png) to outline how these interact which each other and also create a class diagram.

#### Load a CSV file of available dishes as learnt on the pre-requisite Villain Academy challenge
#### Need to add an identifier for each row along with the dish, quantity that is available and the 
#### price

```
def load_menu(filename = "dishes_file.csv")
    # open the file
    if File.exists?(filename)
      dishes_file = CSV.read(filename)
      identifier = 1
      dishes_file.each do |line|
        name, quantity, price = line
        add_item(Dish.new(identifier, name, quantity.to_i, price))
        identifier += 1
      end
    else
      raise "#{filename} doesn't exist."
    end
  end
```

#### Investigate and use Twilio App to send SMS confirmation messages

- Details on how to use Twilio with Ruby are:
[Twilio](https://www.twilio.com/docs/libraries/ruby)
[Youtube](https://www.youtube.com/watch?v=ASmCvopXy_A)

let's pretend we want to send a text message from our Ruby program. Text messages can be sent by Twilio, a communications provider that developer its own gem called twilio-ruby for us to use.

First, we'll need to install it. In your command line type

$ gem install twilio-ruby
This will download it from the internet (from RubyGems.org, to be exact) and install into your system. Gem installations are specific to your ruby version, so if you install a gem for ruby-2.0.0 and then switch to ruby-1.9.3, you'll need to install it for that version as well.

require 'twilio-ruby' # we're telling ruby to load the gem
# put your own credentials here, get them at twilio.com
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token

# send an sms
client.account.sms.messages.create(
  :from => '+14159341234',
  :to => '+16105557069',
  :body => 'Hey there!')
Provided that you have the credentials (account ID and authentication token) from Twilio, this code is everything you need to send a text message from your Ruby code.

The first line is necessary to load the gem into memory. This makes the classes defined inside the gem available to our program. In particular, after the gem has loaded, we get access to Twilio::REST::Client class that we instantiate on line 8 and use on line 11.

#### Write the most basic first test using techniques learnt in Intro to TDD workshop

- Set up first spec file for dish.rb.
- Update dish_spec.rb on first line to say Require 'dish.rb'.
- Run rspec and see spec file fail.
- Create 'dish.rb' file.
- Run rspec and see spec file pass.
- Write basic first test and see it fail when running rspec.
- Write the minimum code required to pass test following the red-green-refactor process.

#### Debug the error messages produced when running rspec using techniques learnt in Intro to Debugging Workshop

- Work from the top fixing the first error.
- Use the full path of the error line to drill down to the exact code that is erroring.
- Do not be tempted to fix any error other than the one that is being highlighted.
- Move onto the next error message and repeat. 
- Continue until all tests pass.

#### Run irb features tests to confirm that the expected behaviour is being demonstrated

```


```

#### What I know I need to work on
- 



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
  * The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) when you run your tests.
