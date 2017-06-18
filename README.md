# Takeaway Challenge

The hot new bespoke app for ordering a takeaway from Harold's House of Horse - London's premiere horse meat specialist restaurant!

Some highlight features include:
- Use the *stylish* and *vintage* terminal interface to read the menu and place your order!
- See your order total update in realtime! (as long as you do order.view)
- Get a confirmation text message!

All tests are passing at the time of writing, with very high test coverage (99.39%). It would've been 100%, but I couldn't find a way to comprehensively stub the Twilio API for one of my methods so I had to exclude it. It all behaves as expected when actually being used, however.

I'm happy with how this turned out overall, especially considering the amount of time we're given to develop this. If I had more time, I would've delegated the order basket into its own class for the sake of adhering more strictly to the single responsibility principle. Aside from that, I believe that my code adheres fairly well to the 4 rules of simple design.

Made with :heart: for the week 2 weekend challenge for Makers Academy. There was also some blood, sweat and tears along the way.

## Installation
1. Clone this repo by running `git clone git@github.com:tbscanlon/takeaway-challenge.git` from your terminal
2. Navigate to the project folder: `cd takeaway-challenge/`.
3. Install dependencies by running `bundle install` (you may need to `gem install bundle`).

**Very important note:** You'll need a Twilio account with the details to access the API. Sign up for one here: https://www.twilio.com/try-twilio. After that, do the following:

1. Create a `.env` folder in the root directory of this project (i.e. not in `/lib` or `/spec`).
2. Copy the following into your new `.env` file:
```
ACCOUNT_SID = <your account SID>
AUTH_TOKEN = <your account authentication token>
FROM = <your Twilio phone number>
TO = <your mobile phone number>
```

## Usage
1. Run `irb` in the project folder.
2. Type `require './lib/order'` and press enter to load everything.

Then try this out:
```ruby
order = Order.new
order.show_menu
order.add("Horse Burger")
order.add("Horse Surprise")
order.view # to confirm your order
order.submit # to send a confirmation text
```

## Code Examples

### Initializing a new Order
```ruby
def initialize(menu = Menu.new, messenger = Messenger.new)
  @basket    = []
  @menu      = menu
  @total     = nil
  @messenger = messenger
end
```

### Calculating the Delivery Time
```ruby
def calculate_delivery_time
  t = Time.new + (60 * 60)
  "#{t.hour}:#{t.min}"
end
```

### Sending a text
```ruby
def submit
  raise "Add some items to your basket first" if basket.empty?
  raise "Check your basket first to confirm (order.view)" if total.nil?
  send_text
end

def send_text
  @messenger.send "Thanks for ordering from Harold's House of Horse! Your order will be with you by #{calculate_delivery_time}"
end

def send(text)
  @twilio.account.messages.create(from: from, to: to, body: text)
end
```

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
