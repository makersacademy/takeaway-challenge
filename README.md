README: TEAKO WARFIELD-GRAHAM

GOALS OF CLASSES CREATED
    1- Takeaway Class Goal: Allow customers to view menu

    2- Menu Class Goal: Populate the menu utilized by other classes to view, select, and calculate meals/prices

    3- Order Class Goal: Allow customer to select and add dishes to a new order

    4- Delivery Class Goal: To populate the message and time of delivery sent via text to customer cell phone

WHAT WORKS?/STATUS OF APP

Functionality currently allows
    • A menu to be viewed with meal options and prices
      (cafe = Takeaway.new > cafe.menu)

    • Menu items to be selected and placed in a new order list
    (order = Order.new > order.select_pizza)

    • An accurate calculation of the order total
      (order.order_total)

    • A reminder of the menu options during order phase
      (order.options)

    • A new delivery time to be assigned
      (order.delivery_time)


WHAT IS IN PROGRESS...

    • Dynamically populated menu that allows new items to be added on-the-fly instead of hard-coded (see troubleshooting section below)

    • Delivery text message providing time. (Working on proper install of twilio gem)

TROUBLESHOOTING

  Dynamic Menu
    I tried to have my Menu class work so that new meal items would be added into a dynamically updated array. I created .add_meal(meal, price) method which created a hash and put it into the menu_list array. This worked fine within the class; BUT when I tried to access the populated menu list in Takeaway and Order classes for selecting items it always populated an empty array. I realized after being driven nuts that this is because the class always created a brand new version of my Menu class, which didn’t have a populated list (of course!!). After a couple hours I scratched the idea in favor of getting on with the project. My final solution was a hard coded menu list in an array.

  TWILIO
    I successfully signed up activated number and sent myself a text from Twilio interface. gem install twilio-ruby appeared to work. However upon testing it didn't seem like the gem installed properly and I couldn't get it to work from my code. I attempted a few fixes but ran out of time.


CHALLENGE INSTRUCTIONS....



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
