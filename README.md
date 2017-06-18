Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | Mary's|   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

### Task
Write a Takeaway program from the following user stories, using the [Twilio API](https://www.twilio.com/sms/api):
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



## Installation

- Run `git clone https://github.com/MarySalemme/takeaway-challenge.git`
- Navigate to the repo `cd takeaway-challenge`
- Run `gem install bundle` from the command line
- Run `bundle`

## Usage
```
[2] pry(main)> require './lib/order.rb'
=> true
[3] pry(main)> menu = Menu.new([{ name: 'Spaghetti', price: 10 }, { name: 'Bolognese', price: 12 }, { name: 'Pizza', price: 8 }])
=> #<Menu:0x007fe9dbac5a40 @dishes=[{:name=>"Spaghetti", :price=>10}, {:name=>"Bolognese", :price=>12}, {:name=>"Pizza", :price=>8}]>
[4] pry(main)> order = Order.new(menu)
=> #<Order:0x007fe9dba8cec0
 @entries=[],
 @menu=#<Menu:0x007fe9dbac5a40 @dishes=[{:name=>"Spaghetti", :price=>10}, {:name=>"Bolognese", :price=>12}, {:name=>"Pizza", :price=>8}]>,
 @messenger=
  #<Messenger:0x007fe9dba8ce20 @client=<Twilio::REST::Client @account_sid=ACf3440f773fa43bf7fd4fb0ad846b291d>, @from="+44 1639 262014">>
[5] pry(main)> order.add_entry("Spaghetti", 4)
=> [{:name=>"Spaghetti", :price=>10}, {:name=>"Spaghetti", :price=>10}, {:name=>"Spaghetti", :price=>10}, {:name=>"Spaghetti", :price=>10}]
[6] pry(main)> order.add_entry("Pizza", 2)
=> [{:name=>"Spaghetti", :price=>10},
 {:name=>"Spaghetti", :price=>10},
 {:name=>"Spaghetti", :price=>10},
 {:name=>"Spaghetti", :price=>10},
 {:name=>"Pizza", :price=>8},
 {:name=>"Pizza", :price=>8}]
[7] pry(main)> order.add_entry("Lasagna", 4)
RuntimeError: Dish not found
from /Users/marysalemme/Desktop/Dev/week2/takeaway-challenge/lib/order.rb:15:in `add_entry'
[8] pry(main)> order.total_amount
=> 56
[9] pry(main)> order.place(56, "Mary", "+447756241735")
Sent message to Mary
=> "Your oder has been placed. You will receive an SMS confirmation shortly"
```
Text received:
```
Hey Mary, you will receive your order at 22:24!

```
## Running tests

`rspec`

**Overall test coverage > 96%**  
(I didn't manage to implement a test in messenger.rb without sending a text)
