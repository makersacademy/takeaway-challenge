## Project title

This is the takeaway challenge, a week(end) 2 project from Makers Academy, used to develop my skills as a junior developer over the weekend following week 2 at Makers Academy Coding Bootcamp.

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

## Motivation

This project was started to build my skills with Ruby and Rspec at the suggestion of Makers Academy. 

The aims:
> All tests passing
> High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
> The code is elegant: every class has a clear responsibility, methods are short etc.


## Build status

No further development expected.

## Testing 

96.75% test coverage.

## Customer story

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

## Code style

Rubocop 0.65.0 was used for linting and styling the Ruby code.
 
## Screenshots

Although UML (class and sequence diagrams) were created on paper before coding started photos of them were not taken. The diagrams were binned after many alterations and they were not fit for purpose.

## Tech/framework used

Ruby was used as the main language, with RSpec used for testing.

## Features

The code is complex for my current level of skill, features include API integration with and external source, considerate use of mocks, stubs, dependency injection. There are other features, such a loops, hashes, arrays, symbols, errors being raised. There is use of time and date and gems.

## Installation

Ruby v 2.5.0 was used in the construction of the project, if gems were used (such as twilio here), please find attached a gem file listing those gems for installation.

## API Reference

Twilio API was a feature, for sending text messages.

## Tests

A TDD process was used in the development of this project, please see the attached RSpec files for details of the testing that was carried out. However I stress that I had to revert to follow the walkthrough exercise online to complete the project as found the project too complex for me at this time.

## How to use?

You should be able to run the code via irb.

## Contribute

No contributions are required at this time, as this is a training exercise, provided by Makers Academy.

## Credits

Full credit given to Makers Academy who created the challenge and provided the walkthrough which i followed (strictly) for this exercise after trying unsuccessfully for an extended period of time. Their youtube video is here: https://www.youtube.com/watch?v=mgiJKdH9x8c which I verbatim followed, which helped me understand the reasons why a more experienced developer did what he did (and allowed me to play with his code).

#### Comments

Although I have developed a system and have got fairly confident in writing code, I don't think I have enough experience to complete a project of this complexity (after only 2 weeks onsite!) I look forward to the day that i call this project easy.


<!-- * Hints on functionality to implement:
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

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend. -->
