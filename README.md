
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

# Takeaway Challenge

Takeaway Challenge is a collection of Ruby classes and unit tests developed to satisfy the requirements of a challenge set during the first week of the Makers Academy bootcamp.

## Installation

Use the Ruby package manager [Bundler](https://bundler.io/) to setup your environment after cloning the repository.

```bash
git clone git@github.com:Mornevanzyl/takeaway-challenge.git

gem install bundle

bundle
```
### Twilio
The program uses the [Twilio](www.twilio.com) messaging API to send SMS order confirmations to the client. Register for your own account and API keys [here](https://www.twilio.com/try-twilio) and update your environment variables as outlined below: -

```bash
$export TWILIO_ACCOUNT_SID="your account sid"
$export TWILIO_AUTH_TOKEN="your supplied token"
```
---

## Usage

```ruby
require './lib/dish'
require './lib/menu'
require './lib/order'

# Substitute your own dishes below
dish1 = Dish.new(44, 'Ramen', 1.99)
dish2 = Dish.new(53, 'Katsu', 2.49)

# Create menu and add dishes
menu = Menu.new
menu.add(dish1)
menu.add(dish2)

# Create new order with selected menu and open
order = Order.new(menu)
order.open

# Follow menu-prompts to add dishes to your order. Confirm order and you'll receive a SMS order confirmation.

# Bon Appétit!
```

## Approach
The chosen approach to this application challenge was to implement three classes that played together nicely, but could be deployed independantly and re-used in other apps.

A simple ```Dish``` class exposes ```id```, ```name``` and ```price``` properties.

The ```Menu``` class exposes the list of dishes on the menu via the ```dishes``` property. You can add dishes to the menu via the appropriately-titled ```add``` method. The ```list``` method outputs the list of dishes.

Finally, the ```Order``` class is the real worker bee that brings it all together. The order is instantiated with any ```menu``` that you have created. Dishes are listed and you can select one or more, or cancel prior to order completion. The app sends a SMS to confirm order and delivery time.

> The user story listed above have not yet been implemented. I would like to discuss this with the client as I believe offering this functionality to an App user may suggest a lack of confidence in the underlying implementation.

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

## Suggested Improvements
This section outlines known/identified areas of improvement/optimisation that serve as input to future development of this project.

- Some unit tests have been implemented in a fairly rudimentary way to overcome 'blockers'. They should be revisited and made more specific and rigorous.

- The application would benefit from a more stylish web interface.

##  Acknowledgements/Appreciations
- I'd like to thank the Academy. Also, Kids… go to bed!
