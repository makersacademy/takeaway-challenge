Nikita's Takeaway Challenge
===========================

## What is the Takeaway Challenge?

The Takeaway Challenge script allows the user to view a menu, select a quantity of dishes, view their order, and confirm the order amount; successful confirmation results in an SMS being sent to the user's phone, which states that their order will be delivered one hour from now.

I wrote this script in May 2020, in response to the Makers Academy [Takeaway Challenge]()

## How to use the Takeaway Challenge

The Takeaway Challenge is written in Ruby - you will need to install Ruby before using this script.

You can run this script in a REPL such as IRB by loading the `./lib/takeaway.rb` file. You can then enter `Takeaway.new` to create a new takeaway -
I recommend assigning this to a variable for ease of calling the methods that allow you to interact with the Takeaway. You can call `.welcome` on your instance of Takeaway in order to see the commands you can use.

You can clone this script using the green **Clone or Download** button above. On cloning,
you will need to install bundler (take a look [here](https://bundler.io/) if you don't know how to do that)
and then run `bundle install` to install the dependencies.

In order to implement the SMS functionality, you'll have to set up a Twilio account (it's free), and then replace the details in the `send_sms.rb`
file with your Twilio details and mobile number - more info on how to do that [here](https://www.twilio.com/docs/sms/quickstart/ruby). In the highly unlikely event of anyone cloning/forking this repo, please remember to hide any personal details in the `send_sms.rb` using environment variables, before you push to a remote repo. You can learn how to do that in [this blogpost](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html).

The tests were written with RSpec - run `rspec` when you're in the takeaway-challenge root directory to run the tests.

## How I Built the Takeaway Challenge

First off, I decided that I wanted the program to work in IRB. I then went through the user stories and created a sequence diagram, to plan out
what classes and methods I would need to create.

IMAGE

This was my initial plan for the programme, utilising three classes - `Takeaway`, `Menu`, and `Order`. `Takeaway` is responsible for communicating with the customer, interfacing with the other two classes and relaying information between them. `Menu` is responsible for holding the menu, and `Order` contains the user's order, including dishes, quantity and total price.

After I'd created these classes and got them to work, I reformatted the latter two to initialise with a `Formatter` class, responsible for formatting the menu, order, and prices. This was simply a matter of copying over methods and tests into `formatter.rb` and `formatter_spec.rb`, so I didn't illustrate this step with a sequence diagram.

I then implemented my confirmation message, working through the resources on Twilio, the chosen API, and building the `send_sms.rb` file. The [Twilio SMS Ruby Quickstart](https://www.twilio.com/docs/sms/quickstart/ruby) is very intuitive and allowed me to add this functionality quickly and easily.

I did a lot of refactoring in this challenge, as I debated whether my methods should use `puts` statements for communicating with the user, or should just `return` their values. Eventually I went for a combination of both, as I disliked the aesthetics of the return value being `nil` after I had `puts`'ed a statement. Silly, I know, but I'm sensitive to that kind of nonsense.

### Things for me to think about going forward...
- Build your programmes to run on the command line. The aesthetic is preferable.
- __ALWAYS__ run `rspec` after you refactor and before you commit and push.
- A README is like a bibliography - do not leave it til the end. It's a pain.
