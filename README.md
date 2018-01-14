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
Approach
-------

You may have noticed that the menu is disgusting. That's because this is a subsidiary of the Wem's current horrible project; FishyWheelz. Check out the [repo](https://github.com/wemmm/fishbot) and the [twitter](https://twitter.com/magicalbestbest) for more delightful fishy and sometimes edible products.

##### Diagramming

![diagram](https://github.com/elliewem/takeaway-challenge/blob/master/IMG_4018.jpg)

My approach for this challenge was to create four classes; takeaway, menu, checkout and confirmation_text. The checkout would be the only class that could access the confirmation_text.

###### How to use

* Viewing the menu

```
=> require takeaway.rb
=> t = Takeaway.new
=> t.viewmenu
=> 2.4.1 :004 > t.viewmenu
tuna soaked nut butter, £2.00
sweaty eel sausage, £2.50
microwaved xmas crab, £3.00
easy peasy hot & eely cheesy balls, £3.50
Kenny Loggins' mackeral tagine, £9.00
chubby tea bags, £1.50
mushed tadpole burrito, £6.00
cod monsieur, £6.50
steamy bream hot box, £6.250
fishy goods and services, £7.00
muddy fish-finger aeoli, £1.00
hot pollacks, £4.00
scaley protein shake, £5.00
freaky lamp fish, £10.00
code smells, £0.50

```

* Adding a 'food item' to the basket more than once, and viewing the basket

```
=> t.order(4,1)
 => "You added easy peasy hot & eely cheesy balls 1 time(s)!"
=> t.order(6,2)
 => "You added chubby tea bags 2 time(s)!"
=> t.order(9,1)
 => "You added steamy bream hot box 1 time(s)!"
=> t.menu.basket
 => [{:"easy peasy hot & eely cheesy balls"=>3.5}, {:"chubby tea bags"=>1.5}, {:"chubby tea bags"=>1.5}, {:"steamy bream hot box"=>6.25}]
 ```

 * Checking the order

 ```
=> t.check_order
fishy goods and services: 7.0
muddy fish-finger aeoli: 1.0
 => "Your total is £8.00!"
```

* Completing the order
```
=> t.complete_order
```
![diagram](https://github.com/elliewem/takeaway-challenge/blob/master/IMG_6527.jpg)

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
