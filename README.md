Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  RORY |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instruction Manual
-----

- To get started, create a new customer with Customer.new, and a new Restaurant for them to interact with (Restaurant.new)
  - All interaction is handled via the Customer
- Request the Menu with #request_menu
- Customer can make selection with #make_selection. This is hard coded into @user_selection, for testing purposes, but actual selections could easily be sent into that variable with an interactive menu
  - There is the option to over-ride this, although the way it's written you must pass #request_menu two arguments: (your_phone_number, your_selection) -- your phone number must be a string like '0123456789' and your selection must be an array like ['Tikka_Masala', 'Naan', 'Rice']. Also, those are the only three options on the Menu
  - Finally, to select a quantity, you must enter the item the amount of times you'd like it. If you'd like 3x Naan, then ['Naan', 'Naan', 'Naan']

- Customer can ask for their total with #confirm_total, and then check this alongside maths on their own (didn't really understand instruction that they should be able to total it up themselves, since this just repeats the same code MyOrder uses, so it doesn't verify anything)
- Customer can confirm their order with #confirm_order, which sends a text confirming arrival in one hour


Short-comings
-----
- Right now, you can't really add more things to your order once you input it -- it'll just over-write anything you had before; I did split out "Input selection" and "Confirm selection" within the restaurant, but I didn't quite get around to splitting these out into two separate functions on the Customer side
  - There is a variable called @send_to_order and, ideally, Customer choosing to #make_selection would send it there first, and then #confirm_selection methods on both Customer and Restaurant side would then send that through to My_Order; atm, #make_selection triggers #confirm_selection, which begins by running #input_selection, before then sending @send_to_order straight through to MyOrder

- I would've liked to have got the advanced thing implemented where users can order via text too.

- Tests need more isolation

- Nothing is in private

- Auth keys need hiding it dotenv


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



* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
