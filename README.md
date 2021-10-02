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


## Planning

1. Read all user stories
2. Identify classes, states and behaviours using the black box model

![Menu Class](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/faaf48fa-4bb8-452e-acb8-e6210c8e82d6/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211002T114641Z&X-Amz-Expires=86400&X-Amz-Signature=18e0cfeb53895c77b1f0a76b8464ca12dc8bda0b81e74fbdc5ad761862e8587b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

![Basket Class](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/75b5a5ba-ea43-4089-953a-01e26ae59f90/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211002T114751Z&X-Amz-Expires=86400&X-Amz-Signature=9ea8b0d6bf6a461b0b8dbe0e4e9d592f7e6023394bcdd343880f460c4e4adfa1&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

![Takeaway Class](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8adde183-6f0b-4ead-a2e7-02c4a8a34b3b/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211002%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211002T114812Z&X-Amz-Expires=86400&X-Amz-Signature=0be07018572d0acdf7e3e2e818b11846f37dbe4186afadaca57f021c8346ee23&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

![Black Box Model](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/40b030da-da00-492f-b68a-e9b3f566fdb9/Untitled.png)


3. Write unit tests that fail
4. Write methods to satisfy the requirements of the unit tests above, until they all pass
5. Review code before submissions to ensure:
- Is this code presentable? Am I proud to show it off to others?
- Have I cleaned up things like whitespace, commented-out code, debugger statements from my code?
- Does the indentation look right?
- Have I conformed my code to styleguide rules (Hound will help you out here)?
- Is it clear to someone unfamiliar with my codebase what's going on?
1. Submit a pull request

