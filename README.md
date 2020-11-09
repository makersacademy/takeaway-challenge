Takeaway App
==================
```
                            _________
              r==           |       |
           _  //            |  C.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Introduction
-------

The Takeaway App was my own implementation version of the Takeaway Challenge as part of the Makers' curriculum. In short, the app is a command line application that enables the user to place a takeaway order from a predefined restaurant and be able to checkout by receiving a confirmation of their order via SMS.

The implementation of this application provided good training in,

|#| Software Engineering OOP & TDD Aspects |
|-|------------------------|
|1| TDD and Modular Design |
|2| Use of Doubles, Stubbing and Mocking as part of Dependency Injection |
|3| Refactoring |
|4| Polymorphism |
|5| Object Oriented Delegation |
|6| Domain Modelling using UML diagrams (Class, Sequence) |
|7| Class Extraction |
|8| Use of and interaction with a REST API |

To implement the `messaging functionality` of the application, the Twilio API was used via the 'twilio-ruby' gem.

How to use the app
-----

This app is implemented in such a way so that the user can interact with a UI from the command line. In order to reach that stage though, several elementary steps need to be followed to ensure flawless functionality of the program.

#### Getting the code from this Repo

Initially, you would need to `clone this repo` in your local repository,

```bash
$ git clone https://github.com/CodeZeus-dev/takeaway-challenge.git
```

After cloning the repo, make sure to have all necessary gems required,

```bash
$ bundle
```

To install the 'twilio-ruby' gem type the following in the terminal,

```bash
$ gem install 'twilio-ruby'
```

#### Storing and importing sensitive information using ENV variables

The SMS functionality of the application requires the use of sensitive information, such as SID and Authorisation Token from a Twilio account. Thus, in order to ensure a safe and smooth run of the application, `Environment Variables` are used for storing sensitive data. In order to be able to receive an SMS with the confirmation of the order, execute the following steps,

1. Create a free [Twilio Account](https://www.twilio.com/try-twilio)
2. Get a Twilio Phone Number (make sure it belongs to the same country as your phone number)
3. Note down the following
   1. Account SID
   2. Authorisation Token
   3. Twilio Phone Number

Having aquired all aforementioned data, create the appropriare ENV variables in which to store them. For instance,
```bash
$ echo "export TWILIO_SID=ACxxxxxxxxxxxxxxxxx" >> ~/.zshrc
$ echo "export TWILIO_AUTH_TOKEN=xxxxxxxxxxxxxxxxx" >> ~/.zshrc
$ echo "export TWILIO_PHONE_NUMBER=+44xxxxxxxxxx" >> ~/.zshrc
$ echo "export PHONE_NUMBER=+44xxxxxxxxxx" >> ~/.zshrc
```
In this example, the ENV variables are appended to the end of the `.zshrc` dot file in my root directory; other alternatives are `.bash_profile` and `.bashrc`. For the changes to take effect (save and load new configuration), execute the following,

```bash
$ source ~/.zshrc
```
In order to use those ENV variables from inside the application, there is no need to change anything in the code itself, but just for reference purposes, in order to access an ENV variable from inside a ruby script, use the following syntax,

```ruby
# Access an ENV variable and store it in variable
account_sid = ENV['TWILIO_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
```
Similarly, the twilio and personal phone numbers can be accessed.

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

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
