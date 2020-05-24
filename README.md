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
## Notes on How Task Went

### How To Use

```irb
irb -r ./lib/front.rb
>Front.new.main_choice
```
Or if you want to use directly from the command line,
uncomment line 69 in front.rb, then
```shell
ruby ./lib/front.rb
```

### Plan For the Code (Edit History to Plan Can be Seen in Commits to plan.md)

treat the Takeaway front face as the main program. (this might be made into a class)
front_menu - user_input to select: show dishes, show order, place order, add to order, leave.

objects         data                      methods

Menu            list of dishes            show dishes
                array of hashes           check is on menu(item)

Item            name, prices             

order           list of dishes ordered    show current order()
                array of hashes           calculate cost of order
                                          add(item, number)
                                          submit order

Need to learn - double check how to do:

formatter                                 format data from order

API - Twilio    phone stuff               interface to utilise Twilio


### Sources Used

* [Twilio](https://www.twilio.com/docs/sms/tutorials/how-to-send-sms-messages-in-ruby)
* [Time formatting](https://apidock.com/ruby/DateTime/strftime)

### Changes From the Original Plan

• I did end up creating a Front class, this means that if the program is run via irb, there are no annoying return values. Also stops the User from having to interact using methods, and just by typing strings that are collected by #gets methods.
* I did create a class for Items (Item class), which did occur to me until creating the class that would end up being called Menu.
* additional I didn't place an 'add to order' method into the Order class until getting relatively late into the writing process

### Process of Writing the Code
My plan was to write as much of the internal workings of the code (using TDD) before building a front end that the user would end up interacting with. The commits confirm that this approach was followed. It did mean that the form of the feature tests did change quite a bit when the Front class was added.


-------
-------
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

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
