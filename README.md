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

 # Takeaway Challenge - Karim's version

 ### Steps taken to complete
 1. Create a fork of repo
 2. Clone to local git machine, install ruby 2.6.5 for simplecov, bundle install
 3. Create a physical list of potential objects and methods needed, inc. interactions
 4. Create lib dir with Menu and Order files, and respective spec files
 5. Feature/unit tested existence of a menu class. Created menu class to pass.
 6. Feature/unit test for checking menu has a hash, and responded to print_dishes. Fulfilled by creating instance var menu equal to a constant hash, and empty print_dishes meth
 7. Feature/unit test that print_dishes outputs dishes. Created a constant menu that menu classes default to (but can take other menus as init argument), as failed to use allow rspec syntax to force menu to return a smaller hash of dishes for menu. Used .map loop to produce output of dishes, with regex (gsub and sprintf) to format hash key and values for output.
 8. Feature/unit tested select dish method. Create method to pass tests. Also tested that the method takes two arguments, as need to pass these into order.
 9. Feature/unit tested the creation of an order class, and made sure it was initialised to empty array. Then tested + created a feature that allowed it to take dishes passed onto it from the Menu class and store in basket. 
 10. Feature/unit tested a verify method for the Order class, that would print a list of items in the basket including prices, and print the total price. Decided to split these responsibilities into two more methods; dish_print (for dishes and their prices) and total_print (for working out and printing the total). 
11. Created code for price summary.
12. Created test for text method in order.
13. Created text object to satisfy text method. New class that utilises twilio API
14. Created twilio trial account, and gained access to twilio trial number based in the USA
15. Added twilio gem to gemfile and installed using bundle
16. Modified Text class init to utilise twilio client
17. Created ignored local project environment variable (ignored by git) to store twilio credentials
18. Modified text tests now I understood what final class would look like. Modified tests using mocks to ensure that RSpec runs would not fire off live texts and consume twilio trial balance
19. With fixed tests, created a method that generated a text message based on texts and current time
20. Noticed that time test was testing state (i.e local computer time), not method. Installed gem Timecop and used its functionality to freeze time, ensuring I could use Text's time function (used within message generator) within my test without referencing logic used in actual method.
21. Fixed message tests by stubbing environmental variables
22. 2 lines of test missing on Menu (.view_order). Testing is mostly covered in the order_spec tests, but wrote equivalent tests anyway.
23. Noticed that program was only 97% test coverage. Earmarked final two tests for attention the next day.
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
