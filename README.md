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

 ###takeaway README

 ####Domain model:
   User  |  Menu  |  Takeaway
 ------------------------------
              <----Create menu
 ------------------------------
 See menu --->
 ------------------------------
 Place order --------->
 ------------------------------
 <----------------Return bill
 ------------------------------
 Check &
 approve ------------->
 ------------------------------
 <----------------Receive
                  confirmation
                  text
 ------------------------------

 My approach:
 First diagrammed the domain model from the provided user stories with pen and paper.

 This has helped me to work out which classes I might need, split the job into its smallest components and how they might need to interact. Next step is to build the first tests so I can make them fail, and then write the code to pass them.

 I need each instance of the User class to be able to access the contents of the menu, which I suppose could be hard-coded inside the Takeaway class, but it would make more sense to put it in its own class and file, and make it editable by the Takeaway class. I can see how this builds on the picnic exercise yesterday - we created an array of sandwiches (instances of the Sandwich class) inside a Hamper class, and we could then remove or add sandwiches as needed. So, here, I'd have a Menu class which creates a hash of dishes, with each one's name and price as a key and value respectively. For the moment I'll just hard-code something and add editability later.

 So I'll make this menu viewable by the user.
 They should then be able to place an order - they'll need to view the menu (print to command line), create an order by selecting any number of menu items each in any quantity, check the order for accuracy, place the order and receive a confirmation text saying it'll be delivered in 1 hour, giving the ETA.

 As a place to start I've created a Menu hash with a range of items and saved it to menu.rb in the /lib folder. Next up is to write the first test. I suppose, as viewing the menu is the most basic function in the user stories, it ought to test that takeaway responds_to view_menu? Since this is going to run in the command line, I guess the way you view a menu is by printing it to the console, so the next test would be that takeaway.view_menu outputs to stdout.
 News at 14/01/2017/16:20: Passed!

 Next up: building the place_order functionality. To test for this, again I suppose it's done in the command line, so place_order, and either dish names and quantities given in parentheses, or there's a prompt and a gets.chomp loop that ends and prints the order for review when you press enter twice? The latter sounds like a better, more controllable option, so I'll go for that. How do I test it though?
 -First I need to test that place_order works, so test that it elicits the printing of a specified prompt to the console.
 News: Passed!

 -Then I need to test that the input is stored in some kind of list, not lost, when Enter is pressed (this implicitly tests that the user can provide input here). So I need to create an empty instance of an 'order' array or hash and check that its length is augmented by 1, e.g. expect(orders.length).to change_by 1.
 News: This, I'm realising, is possibly better being created/tested in an Order class - you create an instance of Order which contains an empty array, which is augmented with the user's input.
 News: Done. There is now an Order class in its own file, and it passes the test! It uses an 'add' method to add a subarray of the dish and quantity to an array, and I've used a while loop -  a bit messy but it works - to keep allowing input until the user presses Enter twice. The only problem is testing gets.chomp - I'm not sure how to stub this to simulate keyboard input and expect a certain result. Going to return to that.
 Update: I think I may inadvertently have done it - the tests pass anyway, which is gratifying.

 -Then I need to test that when Enter is pressed twice the loop ends and the order is printed. First to test, in the Takeaway spec file: create an order array, and expect{print_order}.to output{"array contents"}.to_stdout.


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
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
