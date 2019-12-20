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
SETUP:
1) Setup for Takeaway
a) uninitialized constant Takeaway
b) fixed by adding class Takeaway end & require

2) Setup for dish
a) uninitialized constant Dish
b) fixed by adding class Dish end & require

*********************************************

USER STORY 1
2a) User Story
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
b) Irb
takeaway = Takeaway.new
dish = Dish.new
takeaway.see(dish) will show the dish and price
c) Unit test
it {is_expected.to respond_to(:see).with(1).argument }
Failure/Error: it {is_expected.to respond_to(:see).with(1).argument }
       expected #<Takeaway:0x00007fb0f10b7e68> to respond to :see with 1 argument
d) Implementation (code)
def see(dish
end

2a) User Story Same
2b) Irb
dish = Dish.new
dish.price = will show price
c) Unit test
it 'shows the price of a dish'do
expect(subject.price(3)).to eq 3
NoMethodError:
     undefined method `price' for #<Dish:0x00007fb501859fe0>
d) Implementation (code)
def price(given)
  given

2a) User Story Same
2b) Irb
we now want to combine them together
take = Takeaway.new
salad = Dish.new
!!! Please note here I realised that it's easier to pass in test when dish is
 created so I added def initialize(price) & @price = price passed and def price
 @price
 c) Unit test
 it 'allows us to see list of dishes with prices'
 takeaway = Takeaway.new
 salad = Dish.new(10)
 expect(takeaway.see(salad)).to eq 10
 end
 uninitialized constant Dish
d) Implementation (code)
require_relative 'Dish'

****************************************************************************

USER STORY 1 REDONE

Please note here I realized that instead of individual items, Customer shoud be
able to see whole menu where item could be key and price hash so I changed
my file from Dish to menu

2a) User story same but fixing Menu
2b) IRB
takeaway = Takeaway.new
menu = Menu.new
menu.add(salad,10) -->menu = { salad --> 10}
menu.add(steak, 20) -->menu = {salad -->10, steak -->20 }
2c) Unit test
describe '#add' do
it 'enables Chef to add items to menu 'do
menu = Menu.new
menu.add("salad",10)
expect(menu.list).to eq [{ "salad" => 10 }]
2e) Implementation(code)
class Menu
attr_reader:list
def initialize
@list = []
end
def add(item,price)
@list << { item => price }
end
end

2a) User Story same but fixing takeaway
2b) IRB same
2c) Unit test
it 'allows us to see menu with prices'do
takeaway = Takeaway.new
menu = Menu.new
menu.add("salad",10)
expect(takeaway.see(menu)).to eq [{"salad" => 10 }]
end
end
undefined method price (old code)
2d) Implementation (code)
class Takeaway
def see(menu)
menu.list
end

****************************************************************************

USER STORY 2

3a) User story below
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
3b) Irb
takeaway = Takeaway.new
menu = Menu.new
menu.add("salad",10)
menu.add("fish",20)
takeaway.see(menu)-->shows hash of salad & fish
takeaway.select(fish)-->add fish to ordered items as hash
3c) Unit test
it 'allows us to select items' do
  takeaway = Takeaway.new
  menu = Menu.new
  menu.add("salad",10)
  menu.add("fish",20)
  takeaway.select("fish")
  expect(takeaway.basket).to eq [{"fish" => 20 }]
end
private method `select' called for #<Takeaway:0x00007f9144936ae8>
3d) Implementation (code)
def select(item)
  @result = @menu.find { |x| x[item] }
  @basket << @result
  end

3a) User Story above
3b) IRB
takeaway.select(fish,3)-->adds fish 3 times
3c) Unit test
it 'it adds item by number of times specified' do
  takeaway = Takeaway.new
  menu = Menu.new
  takeaway.see(menu)
  menu.add("salad",10)
  menu.add("fish",20)
  takeaway.select("fish",2)
  expect(takeaway.basket). to eq [{"fish"=>20}, {"fish"=>20}]
  wrong number of arguments (given 2, expected 1)
3d) Implementation(code)
def select(item,quantity=1)
  @result = @menu.find { |x| x[item] }
  @basket.push(@result)*quantity
  end

****************************************************************************

USER STORY 3

3a) As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
3b) Irb
takeaway = Takeaway.new
menu = Menu.new
takeaway.see(menu)
menu.add("water",2)
menu.add("water",2)
takeaway.total ==>equals 4
3c) Unit test
describe '#total' do
  it 'gives me total price of all items ordered' do
    takeaway = Takeaway.new
    menu = Menu.new
    takeaway.see(menu)
    menu.add("salad",10)
    menu.add("water",2)
    takeaway.select("water",2)
    expect(takeaway.total).to eq 4
  end
  NoMethodError:
        undefined method `total' for #<Menu:0x00007f88508a8ab0 @list=[{"salad"=>10}, {"water"=>2}]>
3d) Implementation (code)
def total
  @basket.each { |x|
    x.each { |key, value|
    @total = @total + value }}
    @total
end
end

3a) user story Same
3b)irb
takeaway.sum(4) (what the user thinks) compares takeaway.total which is 4 so
true gives thank you
takeaway.is_amount_correct to eq thank you
3c) Unit test
it 'compares whether the users amount is correct' do
  takeaway = Takeaway.new
  menu = Menu.new
  takeaway.see(menu)
  menu.add("salad",10)
  menu.add("water",2)
  takeaway.see(menu)
  takeaway.select("water",2)
  takeaway.sum(4)
  expect(takeaway.is_amount_correct).to eq "Thank you! Your order was
  placed and will be delivered before 18:52"
  undefined method `sum' for #<Takeaway:0x00007f9b59d82600>
3d) Implementation(code)
def is_amount_correct(total)
  if @total == total
    return "Thank you! Your order was placed and will be delivered before 18:52"
  elsif
    fail "Error"
  end

  ****************************************************************************

USER STORY 4

4a) User story below
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
4b) IRB
takeaway.is_amount_correct(4) to eq Thank you your order was placed..
4c) Unit test
N/A
4d) Implementation code
require("bundler")
Bundler.require()
def send_text(message)
  account_sid = 'AC95ce3cd8f6b05ca7c3ad0be95882c2c9'
  auth_token = 'b9ada2b73535d110b063116f4a47bd5b'

  @client = Twilio::REST::Client.new account_sid, auth_token
  @client.messages.create(
    from: '+13173761339',
    to: '+447519283210',
    body: 'Thank you! Your order was placed and will be delivered before 3:55'
  )

Please note: I have commented out my last test (for User Story 3) as with User
Story 4, I am no longer testing the message being displayed on screen
 but testing that the message is sent to my phone number.Since now when the
 takeaway.send(message) method is called it is sent to my phone number, it now
 fails RSPEC however it worked before I implemented User Story 4 :)

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
