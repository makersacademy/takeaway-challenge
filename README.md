William's frustrating and miserable attempt at the weekend challenge on a weekend with very limited time due to family commitments. I had set aside a few hours on Saturday and another few on Sunday to try and get this done, but wasn't optimistic due to how long the previous weekend's took. I was still using AWS on my windows PC for my coding, but for some reason it had ran out of space and wouldn't install the bundle. I wasted a lot of time trying to fix this problem, and despite every single file being deleted in there bar the minimum, I could not for the life of me get it to update it's disk space. Help online was not helpful at all, and I guessed that clearly it wasn't properly deleting files and they were still on there.

None the less I did make a start and managed to get a basic interactive menu working for the program, despite the instructions being extremely vague on how exactly the user is supposed to run the program (is it in IRB, is there a menu process, or is it none of the above?), I did push this to Github, but it wasn't anything special, since the main challenge here was obviously the text message part which I couldn't do.

The few hours I had to spare on Sunday evening were only met with similar frustrations. I gave up completely on AWS and swapped to the Macbook that Makers had been generous enough to lend me, which despite not using until now, I had left set up and ready to go should I need it...or so I thought. Once again I could not, for the life of me, get the gem bundler to install. It was just one problem after the next, and error message upon error message. After much toil and perseverance, I finally seemed to get everything working and ready to go, at which point it is now 10 minutes past midnight on Monday morning. And I can barely keep my eyes open, let alone think straight.

I had also deleted and re forked and cloned my initial repo in a desperate attempt to get the bundler to finally start working, which meant I had lost what little work I had even in the first place (not that it was a lot), and thus have absolutely nothing to show for this challenge.

Real shame because it looked quite interesting, but a combination of barely any free time and a bombardment of technical difficulties meant I never got to properly try. I have more commitments next weekend also, and am dreading the challenge then too, and will have no choice but to get a headstart in an already quite packed week no doubt.


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
