# Takeaway Challenge
```
                            _________
              r==           |       |
           _  //            | EDINA |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
## Description

This is the result of the second weekend challenge for submission to Makers Academy. The program represents a takeaway restaurant with the following functionalities:

* The restaurant exposes its menu
* Clients can order a number of several available dishes
* Clients can check whether the total is correct
* Clients receive confirmation message on successful order

## User Stories
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

## Getting Started

1. Clone this repo to your local machine using `git@github.com:EdinaBMakers/takeaway-challenge.git`
2. Run `gem install bundle` (if it is not installed already)
3. Run `bundle`

## Objects

#### TakeawayRestaurant

This class represents a takeaway restaurant. It exposes its menu with available `Dish`es and can take orders. It also notifies the client if order is successful.

#### Dish

This class represents an item on the menu with name and price.

#### MessageService

This class is responsible for sending text messages to the client. It uses the `Twilio API` to achieve this goal.

#### MessageServiceConfig

This class is a container for the pieces of configuration data required when connecting to the `Twilio API`.

## Usage

Run `irb` in the terminal and execute the following statements:

```
require './lib/takeaway_restaurant.rb'

# Create dishes and the menu
burrito = Dish.new("Burrito", 7.50)
pizza = Dish.new("Pizza", 9.50)
menu = [burrito, pizza]

# Create a MessageServiceConfig instance with the following arguments:
# <Account SID>: Your Account SID from Twilio
# <Auth Token>: Your Authorization Token from Twilio
# <From>: Your Twilio phone number
# <To>: Recipient phone number
config = MessageServiceConfig.new('<Account SID>', '<Auth Token>', '<From>', '<To>')

# Create a MessageService instance with the config
message_service = MessageService.new(config)

# Create a TakeawayRestaurant instance with the menu and message service
takeaway_restaurant = TakeawayRestaurant.new(menu, message_service)

orders = [{ :dish => burrito, :portion => 2 }, { :dish => pizza, :portion => 1 }]
expected_total = burrito.price * 2 + pizza.price

# Place orders
takeaway_restaurant.order(orders, expected_total)
```

The code snippet above places a valid order and providing the message service is configured to use valid `Twilio` credentials and phone numbers, recipient should receive a confirmation text message with the expected delivery time.

`Note: ` You need to sign up on [Twilio](https://www.twilio.com/try-twilio) to get your connection details.  

## Dependencies

This program uses the following gems:

```
source 'https://rubygems.org'

ruby '2.5.0'

gem 'capybara'
gem 'rake'
gem 'rspec'
gem 'rubocop', '0.56.0'
gem 'simplecov', require: false, group: :test
gem 'simplecov-console', require: false, group: :test
gem 'twilio-ruby', '~> 5.22', '>= 5.22.3'
```

## Testing

#### Running Tests

Tests can be run from the root directory using the `rspec` command.

#### Doubles and Stubs

To reduce complexity, ensure deterministic test results and prevent unwanted messages from `Twilio` during test runs, I used doubles and stubs. For the actual implementation please open the spec files in the `spec` folder.

#### Test Results and Coverage

All tests pass and `simplecov` reported a test coverage of `100%`.

## Code Style

I used [Rubocop](https://rubocop.readthedocs.io/en/latest/) before each commit to ensure that Ruby coding standards are followed.
