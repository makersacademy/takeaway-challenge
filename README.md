# Takeaway challenge

```ruby
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

## Task
Write a Takeaway program with the following user stories:

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

## Interface
The expected interface for a customer to use is `irb` or `pry`. The following notes and accompanying code explain how to interact with the program.

Getting Started:
```ruby
require './lib/takeaway.rb'
```

Initializing a shop:
```ruby
cafe = Takeaway.new
```

Reading the raw menu data (name, price):
```ruby
cafe.menu
# => {:Espresso=>2, :Americano=>3 }
```

Adding items to the basket (returns updated basket):
```ruby
# cafe.add_to_basket(name, quantity)
cafe.add_to_basket("Espresso")
cafe.add_to_basket("Americano", 2)
# => ["Espresso", "Americano", "Americano"]
```

Viewing current basket:
```ruby
cafe.basket
# => ["Espresso", "Americano", "Americano"]
```

Viewing total cost of basket:
```ruby
cafe.total
# => 8
```

Completing an order:
```ruby
cafe.checkout
# => "Thank you! Your order came to £8. Our baristas are new, so expect your drinks at 03:49pm
```

## Twilio Text Alerts
The baristas are still in training, so it takes them 60 minutes to make the coffees :joy:. Because of this, the cafe needs to keep the customers updated via text message once they have checked out their order.

This program uses the `twilio-ruby` gem to send the texts. In order for them to work, the following environment variables need to be set, either in `.bash_profile` or using the `dotenv` gem:
- `TWILIO_SID` - Twilio Account SID
- `TWILIO_KEY` - Twilio Auth Token
- `TWILIO_NUM` - Twilio-verified phone number for sending messages
- `MOBILE_NUM` - Phone number for receiving messages
