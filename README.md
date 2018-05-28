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
==================

### Approach to solving the challenge:

1. Researched Twilio Gem and added to Gemfile.
2. Created a Feature Test file for creating TDD lead behaviour to fit each element of the user stories.
3. Modelled the exact interaction and behaviour needed to fit the smallest piece of the user story.
4. Worked through the Red, Green, Refactor process to address each user story.
5. Tried not to guess the object design but be guided by the code, thus worked to refactor all methods so that they had a single responsibility and then move any unrelated methods out to other classes as final refactor.
6. Therefore initially had all code for user story 1 in menu. Separated out dishes to a new class on completion of User story 1.
7. Created a structure where the Order_System was the main interface that knew about the other Classes but kept the dependencies restricted between the other classes.
8. Twilio API used to send a text message confirming the user's order and delivery within 1 hour of order confirmation.


### Status at point of push:
Command line functionality is complete.
Rubocop checked and no offenses.
Rspec running at 100% test coverage. 

### Description of what code does:
Command line interface that enables user to order takeaway dishes from a viewable menu. A running total will be kept for the order and can be viewed on request in the order process. Once order is confirmed by agreeing the total sum, a confirmation message will be displayed and a follow up text message will be sent confirming that the order will arrive in less than 1 hr.

### Code Style:
Standard Ruby and Rspec.

### Features:
Built with reuse in mind. A new menu can be added simply by adjusting the Restaurant class.
Dependencies have been injected.
Similarly the notification system is split out so that a different text provider could be easily swapped in should change be needed.

### Code Example:
Extract from the OrderSystem class:
```
def order_request
  order_intro = 'What would you like to order?'
  return order_intro unless !!order_in_progress
end

def add_to_order(item, number = 1)
  if menu.dishes.has_key?(item)
    number.times do
      @pending_order << item
      @total_cost += menu.dishes[item]
    end
  end
  "#{number} #{item}(s) added to your order."
end
```

### How to install the code:
1. Fork this project.
2. Run ```bundle``` to ensure you have all the relevant gems.
3. Use Ruby 2.5.0

### How to use the code:
Here is a demonstration via the command line:
```
2.5.0 :001 > require './lib/order_system.rb'
 => true
2.5.0 :002 > curry = OrderSystem.new
 => #<OrderSystem:0x00007fbfc70ba700 @menu=#<Menu:0x00007fbfc70ba3b8 @dishes={"Chicken Tikka"=>8.99, "Dry Meat"=>10.99, "Mixed Grill"=>14.99, "Chana Dal"=>7.99, "Peshwari Naan"=>3.99, "Garlic Naan"=>3.49, "Plain Rice"=>2.99}, @header="Ty Abs - Whitechapel\nTakeaway Menu", @foot="Please order before 10pm\nDelivery is available in the E2 area">, @order_in_progress=nil, @total_cost=0, @pending_order=[], @text=#<TwilioNotification:0x00007fbfc70ba2f0 @client=#<Twilio::REST::Client:0x00007fbfc70b9f80 @username="AC308ba4a10b2f8d5d71937c58814369ab", @password="5f97114b5b8512e090126f889df0abbe", @region=nil, @account_sid="AC308ba4a10b2f8d5d71937c58814369ab", @auth_token="5f97114b5b8512e090126f889df0abbe", @auth=["AC308ba4a10b2f8d5d71937c58814369ab", "5f97114b5b8512e090126f889df0abbe"], @http_client=#<Twilio::HTTP::Client:0x00007fbfc70b9ee0 @proxy_addr=nil, @proxy_port=nil, @proxy_user=nil, @proxy_pass=nil, @ssl_ca_file=nil, @timeout=nil, @adapter=:net_http>, @accounts=nil, @api=nil, @chat=nil, @fax=nil, @ip_messaging=nil, @lookups=nil, @monitor=nil, @notify=nil, @preview=nil, @pricing=nil, @proxy=nil, @taskrouter=nil, @trunking=nil, @video=nil, @messaging=nil, @wireless=nil, @sync=nil, @studio=nil>, @from="+447480639164", @to="+447917881462", @time=2018-05-28 17:33:13 +0100, @delivery="18:33">>
2.5.0 :003 > curry.menu.display
 => "Ty Abs - Whitechapel\nTakeaway Menu\n{\"Chicken Tikka\"=>8.99, \"Dry Meat\"=>10.99, \"Mixed Grill\"=>14.99, \"Chana Dal\"=>7.99, \"Peshwari Naan\"=>3.99, \"Garlic Naan\"=>3.49, \"Plain Rice\"=>2.99}\nPlease order before 10pm\nDelivery is available in the E2 area"
2.5.0 :004 > curry.order_request
 => "What would you like to order?"
2.5.0 :005 > curry.add_to_order("Chana Dal", 2)
 => "2 Chana Dal(s) added to your order."
2.5.0 :006 > curry.add_to_order("Mixed Grill")
 => "1 Mixed Grill(s) added to your order."
2.5.0 :007 > curry.add_to_order("Peshwari Naan", 2)
 => "2 Peshwari Naan(s) added to your order."
2.5.0 :008 > curry.total_cost
 => 38.95
2.5.0 :009 > curry.confirm_order(38.95)
 => "Total cost is 38.95. Thank you for your order."
  ```

### How to run the tests:
Spec file includes unit tests and feature tests sub folder. All tests can be run via ```rspec```.


Instructions Set By Makers Academy
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
