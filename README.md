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

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.


My Approach
--------

In order to list a menu, I will create a text file that contains items and their price. This will allow business to edit the file and change the menu.

The text file will be read and displayed to the customer with item numbers.

The customer will select their dishes by entering the numbers for the associated dishes they wish to order. A total amount payable will be printed with the price break-down by item.

The customer will pay, and, if the amount payable equals the total amount, the order will be placed and they will receive a text of its expected arrival time.

How to use this application:
----------------------------

Clone the repository: https://github.com/hughbric/takeaway-challenge

From the command line, navigate to the root of the project folder:  
`cd takeaway-challenge`

To check the test suite runs, type:  
`rspec`

To run the application in IRB, type:  
`irb -r './lib/take_away.rb'`

Create a new take-away instance:  
`guest = TakeAway.new`

To see the menu and order a dish:  
`guest.read_menu`

`guest.order(1)`
`guest.order(3, 5)`

`guest.basket_summary`
`guest.total`

An example of how the app functions:

```
2.5.0 :001 > require './lib/take_away.rb'
 => true

2.5.0 :002 > guest = TakeAway.new
 => #<TakeAway:0x00007fd92a086528 @menu=[{:index=>1, :item=>"Miso Soup", :amount=>"2.00"}, {:index=>2, :item=>"Salty Edamam
e", :amount=>"2.95"}, {:index=>3, :item=>"Spicy Edamame", :amount=>"2.95"}, {:index=>4, :item=>"Seaweed Salad", :amount=>"5
.25"}, {:index=>5, :item=>"Wilted Spinach", :amount=>"5.50"}, {:index=>6, :item=>"Vegetarian Spring Rolls", :amount=>"4.25"
}, {:index=>7, :item=>"Salmon Spring Rolls", :amount=>"4.50"}, {:index=>8, :item=>"Panko crusted prawns", :amount=>"6.50"},
 {:index=>9, :item=>"Miso Dengaku", :amount=>"6.50"}, {:index=>10, :item=>"Agadashi tofu", :amount=>"4.00"}, {:index=>11, :
item=>"Nippon 'mock duck'", :amount=>"5.95"}, {:index=>12, :item=>"Kale and Quinoa Salad", :amount=>"6.00"}, {:index=>13, :
item=>"Japanese Buffalo Wings", :amount=>"4.95"}, {:index=>14, :item=>"Sesame Brocoli", :amount=>"2.50"}, {:index=>15, :ite
m=>"Extra Soy Sauce", :amount=>"0.50"}, {:index=>16, :item=>"Extra Ginger", :amount=>"0.50"}, {:index=>17, :item=>"Extra Wa
sabi", :amount=>"0.50"}], @basket=[], @total=0>
2.5.0 :003 > guest.read_menu
1. Miso Soup: £2.00
2. Salty Edamame: £2.95
3. Spicy Edamame: £2.95
4. Seaweed Salad: £5.25
5. Wilted Spinach: £5.50
6. Vegetarian Spring Rolls: £4.25
7. Salmon Spring Rolls: £4.50
8. Panko crusted prawns: £6.50
9. Miso Dengaku: £6.50
10. Agadashi tofu: £4.00
11. Nippon 'mock duck': £5.95
12. Kale and Quinoa Salad: £6.00
13. Japanese Buffalo Wings: £4.95
14. Sesame Brocoli: £2.50
15. Extra Soy Sauce: £0.50
16. Extra Ginger: £0.50
17. Extra Wasabi: £0.50
 => [{:index=>1, :item=>"Miso Soup", :amount=>"2.00"}, {:index=>2, :item=>"Salty Edamame", :amount=>"2.95"}, {:index=>3, :i
tem=>"Spicy Edamame", :amount=>"2.95"}, {:index=>4, :item=>"Seaweed Salad", :amount=>"5.25"}, {:index=>5, :item=>"Wilted Sp
inach", :amount=>"5.50"}, {:index=>6, :item=>"Vegetarian Spring Rolls", :amount=>"4.25"}, {:index=>7, :item=>"Salmon Spring
 Rolls", :amount=>"4.50"}, {:index=>8, :item=>"Panko crusted prawns", :amount=>"6.50"}, {:index=>9, :item=>"Miso Dengaku",
:amount=>"6.50"}, {:index=>10, :item=>"Agadashi tofu", :amount=>"4.00"}, {:index=>11, :item=>"Nippon 'mock duck'", :amount=
>"5.95"}, {:index=>12, :item=>"Kale and Quinoa Salad", :amount=>"6.00"}, {:index=>13, :item=>"Japanese Buffalo Wings", :amo
unt=>"4.95"}, {:index=>14, :item=>"Sesame Brocoli", :amount=>"2.50"}, {:index=>15, :item=>"Extra Soy Sauce", :amount=>"0.50
"}, {:index=>16, :item=>"Extra Ginger", :amount=>"0.50"}, {:index=>17, :item=>"Extra Wasabi", :amount=>"0.50"}]
2.5.0 :004 > guest.order(1)
 => "You have added 1 x Miso Soup to your basket."
2.5.0 :005 > guest.order(3, 5)
 => "You have added 5 x Spicy Edamame to your basket."
2.5.0 :006 > guest.basket_summary
1 x Miso Soup = £2.00
5 x Spicy Edamame = £14.75
 => [{:item_number=>1, :quantity=>1}, {:item_number=>3, :quantity=>5}]
2.5.0 :007 > guest.total
Total: £16.75
 => nil
```
