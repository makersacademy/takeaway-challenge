![alt text](./assets/scooter.png "Scooter")  Takeaway Challenge  ![alt text](./assets/scooter.png "Scooter")
==================
![alt text](./assets/food.png "Colorful dishes")

#### *This program is a toolkit of classes and methods in Ruby that could potentially be used to create a takeaway app. It can handle a restaurant having a menu, taking orders and notifying the customer via text, using the Twilio API.*
## How to install
- Run `bundle install`
- Register a free account on twilio: https://www.twilio.com/ and create a phone number
- Set up environment variables:
  Find your *Phone number*, *Accound SID* and *Auth token* on your [twilio dashboard](https://www.twilio.com/console). Then create new environment variables in your terminal to store them like so: 
    - On UNIX-based systems (Don't type in the "$"!):
    ```bash
    $ export TWILIO_SID="Your Account SID here" # (Quote marks required !)
    $ export TWILIO_AUTH_TOKEN="Your Auth token here" # (Quote marks required !)
    $ export TWILIO_PHONE="Your twilio phone number here" # (Quote marks required !)
    ```
    *You can add those lines to your desired config file (~/.profile, ~/.bashrc, ~/.zshrc and friends...) to avoid having to type it every time.*



    - On Windows systems open PowerShell and type (without the ">"):
    ```powershell
    > setx TWILIO_SID="Your Account SID here" # (Quote marks required !)
    > setx TWILIO_AUTH_TOKEN="Your Auth token here" # (Quote marks required !)
    > setx TWILIO_PHONE="Your twilio phone number here" # (Quote marks required !)  
    ```
## How to use

Here is a basic feature test example of how the program can be used:
```ruby
require_relative '../lib/takeaway.rb'

salad = Dish.new("Salad", 10)
chicken = Dish.new("Chicken", 13)
fries = Dish.new("Fries", 4)
fish = Dish.new("Fish", 17)

menu = Menu.new([salad, chicken, fries, fish])

restaurant = Restaurant.new(menu)
phone_number = ENV["MY_PHONE"]

# Have a look at the menu:
restaurant.menu.show

# Start a new order with my phone number:
restaurant.new_order(phone_number)

# Add an item to my order:
restaurant.order.items.add(salad, 1)

# Check my order:
puts restaurant.order_summary

# Add 3 items of the same kind to my order:
restaurant.order.items.add(fries, 3)

# Remove one of the previous items:
restaurant.order.items.remove(fries, 1)

# Check my order again:
puts restaurant.order_summary

# Checking out with the correct price:
restaurant.place_order(18) # A text was sent to the number provided earlier.

# The order is now closed:
puts "Checked out? : #{restaurant.order.checked_out?}"

```

For a detailed breakdown of the classes and their methods, please refer to the [Domain Model](https://github.com/Clepsyd/takeaway-challenge/blob/master/DomainModel.md).

<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>