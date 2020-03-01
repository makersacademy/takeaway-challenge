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

**Domain Model**

| RESTAURANT     | MENU         | ORDER          | MESSAGE         |
| :------------- |:-------------|:---------------|:----------------|
| -------------- |--------------|----------------|-----------------|
|                | @menu_list   | @current_order | @phone_number   |
|                |              | @total_price   | @message        |
| -------------- |--------------|----------------|-----------------|
| #see_menu      | #print_menu  | #add_dish      | #get_number     |
| #place_order   |              | #sum_total     | #create_message |
| #checkout      |              | #print_order   | #twilio_text    |

That is the domain model I made at the beggining but I ended up having more methods, specially to keep single responsability in all my code, but I preserved the functionality I had in this plan.

**Notes on the Project:**
My main goal for this past week was learning class delegation and at the begining this was my main focus for the project. But while I was doing it with TDD I realized that although I felt more or less confortable with distributing the functionality between classes I had a very big gap with testing.<br/>
I created all my code on a test-first basis but they were constantly breaking because I was not using Rspec mocking. At this point I decided that I wouldn't worry too much about completely finishing the project or adding extra fancy features (I was planning to add some more raising errors, and some loop to being asked for more dishes without calling the method everytime, ecc).<br/> 
Instead I just did a basic working structure to cover the user stories. It all works in IRB but the SMS is not being sent. With the SMS I decided to focus more in understanding what Twilio was and setting it up, and in learning about environment variables to keep credentials safe. All this is in my code but the credentials stored in my .env file are not being loaded into the message.rb file (I quit at this point and didn't really tried to fix it so may be a very simple error).<br/>
I still had almost all Sunday to keep working so I set myself the goal to, at least, get a minimum understanding of doubles and mocking. I really struggled (as it had happened all the week) to find information in google, as most of the tutorials I found were using code that was too difficult for me at this level (if I couldn't understand the Ruby syntax they were using leave alone understand mocking itself). But I happened to talk to one of my colleagues (Nima) and he gave me a very clarifying explanation with examples applied to this project (THANK YOU!). So with this new understanding I started all over the tests for restaurant class (restaurant_spec.rb) to make them all be based in mocking and be tested independently of any of the other classes existing or not. (The tests for the other classes are still as I had them before the enlightment :D)


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
