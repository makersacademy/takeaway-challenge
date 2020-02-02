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

This programme controls the a takeaway with wonderful cuisine available at all hours. The customer can view the menu, add items to basket, view their basket and receive a SMS text message upon checking out. 

I created this application for second weekend challenge at [Makers Academy](https://github.com/makersacademy).


## Instructions

#### Install ####

1. Fork this repo, and clone to your local machine
2. Run the command gem install bundle (if you don't have bundle already)
3. When the installation completes, run bundle

#### Run ####

```Shell
$ irb
> require './lib/takeaway.rb'
```

#### Create an takeaway ####

You can create a takeaway using the following command and with a result like this. Yes we have the paneer here, have no fear:

```Shell
> t = Takeaway.new # => <Takeaway:0x00007fbceb41cd78 @menu=#<Menu:0x00007fbceb41cd28 @dishes={:"Kolhapuri Murgi"=>5.6, :"Salmon Tikka Masala"=>8.8, :"Butter Chicken"=>6.1, :"Saag Paneer"=>3.0, :"Pilau rice"=>1.5, :"Coconut rice"=>1.8, :Poppadom=>0.5, :"Mango Chutney"=>0.3}>, @order={}, @sms_texter=#<SmsTexter:0x00007fbceb41ccb0>> 
```

#### Peruse the menu ####

To view the menu, use the show_menu method:

```Shell
> t.show_menu # => {:"Kolhapuri Murgi"=>5.6, :"Salmon Tikka Masala"=>8.8, :"Butter Chicken"=>6.1, :"Saag Paneer"=>3.0, :"Pilau rice"=>1.5, :"Coconut rice"=>1.8, :Poppadom=>0.5, :"Mango Chutney"=>0.3}
```

#### See something you like? add it to your basket ####

If you see something on the menu that takes your fancy, swipe it up quick with the add function. You by default you will add one to your basket but if you're feeling peckish then you can order multiple at a time by adding a quantity after the item you want to add.

```Shell
> t.add "Kolhapuri Murgi" # => {:"Kolhapuri Murgi"=>1}
> t.add "Coconut rice", 10 # => {:"Kolhapuri Murgi"=>1, :"Coconut rice"=>10} 
```
That's a lot of rice for one person... :|

## User requirements

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
