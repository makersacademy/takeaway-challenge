Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  D.L. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Tags: OOP, TDD, Ruby, RSpec, Mocks/Doubles, Dependency Injection, Encapsulation, APIs


What does it do?
-------

My takeaway offers a range of tasty ice-creams, take a look at the menu to find out what flavours we have! As a customer you can:
- See the menu on offer
- Place an order

If your order is provided with an incorrect total cost then an error will be raised. If the correct order cost is provided a text will be sent confirming the order is on its way.

The code comes with feature and unit tests. Coverage is 100% and all tests are passing.


Domain Model
--------

**OOP and TDD**

The user interacts directly with the OrderManager class via the terminal. The diagram below describes the class/module structure.

<pre>
OrderManager  
     |  
     |<----------> MenuPrinter  
     |  
     |
     |<----------> OrderChecker
                        |
                        |
                        |<---------------> SendText
                                              |
                                              |
                                              |<--------------> DeliveryTime
</pre>   


**TDD using RSpec:**
The program was developed test-first:
- Feature tests are provided in RSpec. Take a look at the features tests [here](spec/features/user_stories_spec.rb).
- Unit tests were also created in RSpec. These describe how I intend specific blocks of code to work in isolation. 
- Using the TDD process I developed chunks of code to ensure my unit tests passed. I followed the RED, GREEN, REFACTOR process before moving onto the next unit/feature test.
- `simplecov` was used to show the test coverage (current version shows 100% coverage).
- `rubocop` was used to ensure that coding standards were met in all files (no offenses in current version).


Usage
-------

As a user you can interact with my program through the terminal. First you need to instantiate a new OrderManager object:

`order = OrderManager.new`

After this you can see the range of ice-creams on offer (the menu is itemised - you'll need the item number for your order):

`order.see_menu`

If you'd like to place an order you need to provide an array containing your order details:

`order_array = [[[item_number, quantity], [item_number, quantity]...]], total_cost]`

Then:

`order.place_order(order_array)`

If you've provided the correct total cost you'll receive feedback on the terminal of the agreed total cost. A text message will also be sent confirming the expected deivery time.

If you've provided an order with the incorrect total cost then you'll see an error (no text message will be sent). You'll need to re-submit your order with the correct total cost.

If the text fails to send, we'll let you know through an error message on the terminal.


Running Tests
------------

The following test specs are included:
`./spec/order_manager_spec.rb`
`./spec/menu_printer_spec.rb`
`./spec/order_checker_spec.rb`
`./spec/send_text_spec.rb`
`./spec/delivery_time_spec.rb`
`./spec/features/user_stories_spec.rb`

To run these tests call `rspec` from the root of the directory. When you run the full suite of tests only one text will be sent (only the feature test actually sends a message). 

All unit tests have been isolated using doubles through depedency injection. For unit tests on SendText a fake Twilio client class was created that stored all the test values and responses, mimicking how the real Twilio class object saves information.


User Stories
-----

See below for the user stories:

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
