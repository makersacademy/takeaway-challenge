I started this challenge by drawing out all the classes that I felt I would require. These started with Menu, Dish, Order & Takeaway. I built out a basic Dish class and then a Menu class which used the Dish class to implement the items on the menu. The order class used the Menu class to pick items of it and the Takeaway bought it all together which the customer would be using.

I have not yet implemented Twilio despite my efforts. I found this challenge difficult due to my uneasiness about relationships across classes. I certainly learnt alot throughout the challenge and feel I have a better grasp of the concepts compared to the challenges completed previously.

TBC - SMS implementation
    - Edge cases. Sometimes orders aren't stored correctly and menu items aren't added to the list

IRB snippet:

```
2.4.0 :001 > require './lib/takeaway'
 => true
2.4.0 :002 > PizzaHut = Takeaway.new
 => #<Takeaway:0x007fe8a98c00e8 @menu=[#<Dish:0x007fe8a98c0070 @name="Burger", @price=9>, #<Dish:0x007fe8a98c0020 @name="Curry", @price=8>, #<Dish:0x007fe8a98bbf70 @name="Soup", @price=6>], @order=#<Order:0x007fe8a98bbef8 @items=[], @total_cost=0>>
2.4.0 :003 > PizzaHut.menu
 => [#<Dish:0x007fe8a98c0070 @name="Burger", @price=9>, #<Dish:0x007fe8a98c0020 @name="Curry", @price=8>, #<Dish:0x007fe8a98bbf70 @name="Soup", @price=6>]
2.4.0 :004 > PizzaHut.show_menu
 => ["Burger -- £9", "Curry -- £8", "Soup -- £6"]
2.4.0 :005 > PizzaHut.add_item_to_order("Curry")
 => [#<Dish:0x007fe8a98c0070 @name="Burger", @price=9>, #<Dish:0x007fe8a98c0020 @name="Curry", @price=8>, #<Dish:0x007fe8a98bbf70 @name="Soup", @price=6>]
2.4.0 :006 > PizzaHut.order_total
 => 10.5
2.4.0 :007 > PizzaHut.order
 => #<Order:0x007fe8a98bbef8 @items=[#<Dish:0x007fe8a98c0020 @name="Curry", @price=8>], @total_cost=8>
2.4.0 :008 > Menu = Menu.new
(irb):8: warning: already initialized constant Menu
/Applications/Projects/MakersWeek2/WeekendChallenge/takeaway-challenge/lib/menu.rb:3: warning: previous definition of Menu was here
 => #<Menu:0x007fe8a98900a0 @items=[#<Dish:0x007fe8a988bf50 @name="Burger", @price=9>, #<Dish:0x007fe8a988be38 @name="Curry", @price=8>, #<Dish:0x007fe8a988bde8 @name="Soup", @price=6>]>
 ```


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
