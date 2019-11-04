Takeaway Challenge
==================

This is the second weekend project of the Makers Academy course. The program enables a user to view a variety of takeaway menus, select a quantity of several dishes and confirm the order total cost. If the total is correct, the program sends the user a confirmation SMS via Twilio.

### Tech/languages

Built in Ruby, with the Twilio app.

### Code example

The program is run in IRB by requiring the `./lib/takeaway` file.

The user can create a new instance of the Takeaway class by passing in a cuisine of their choice (Pizza/Chinese/Indian) as an initialize argument. If no cuisine is chosen the default is Pizza.

The user can then run a series of commands:
* `.view_menu` (to view the menu for that cuisine)
* `.select(dish, quantity)` (to add a quantity of a dish to their basket)
* `.basket` (to view the basket so far)
* `.confirm_total(amount)` (to confirm the total of their final order)

[Screen shot of app in use](https://github.com/eliseaston/takeaway-challenge/blob/master/takeaway_screenshot.png)

### Installation

This project requires:
* `twilio-ruby` gem
* RSpec for testing

You will need a Twilio account with log-in details to run this program. You will need to sign up for a Twilio account at INSERT LINK and create the following environmental variables:
* TWILIO_ACCOUNT_SID - your SID for your Twilio account
* TWILIO_AUTH_TOKEN - your authorisation token for your Twilio account
* PHONENUMBER - the phone number you want to send SMS confirmation messages to during testing.

### Process of writing the program

I initially created a single Takeaway class with an instance attribute `@menu` as an array of hashes:

`@menu = [
  { "margarita" => 7.5 },
  { "hawaian" => 8.5 },
  { "garlic bread" => 5 }
]`

I then decided to refactor `@menu` into a hash like so:

`@menu = {
  "margarita" => 7.5,
  "hawaian" => 8.5,
  "garlic bread" => 5
}`

because this made it easier to access the price for the dish being ordered.

When I implemented the user requirement "to be able to check that the total I have been given matches the sum of the various dishes in my order", I decided to implement a `confirm_total(amount)` method and a `calculate_total` method. If the amount entered by the user didn't match the total of the order placed, an error message would be raised.

In order to be able to store and calculate the total of the order placed, I decided a basket feature would be necessary. I decided to create a separate Order class, with basket as an attribute. This class is responsible for saving the user's order to the basket, and calculating the total of that order. If the total is correct, it sends the user a confirmation SMS.  

I also decided to refactor the menu. Instead of having it as an attribute in the main Takeaway class, there is now a separate menus file with multiple cuisine classes, each with a menu attribute. This is so the user can pass the cuisine of their choice into the initialize Takeaway so they can view and choose from multiple menus. However, they can only order from one cuisine per order.

I saved my phone number, Twilio account SID and Twilio authorisation token as environmental variables so as not to upload sensitive and private information to the public.

#### Challenges

I struggled with mocking and doubling to test the SMS function without actually sending an SMS.

I tried creating a double of the client and allowing it to receive the `:messages` and `:create` methods and return a stubbed output of the body of the text. However the test would not pass because it expected an output of the body of the text, but instead got true. It also still sends an SMS whenever I run this rspec test.

I finally solved the issue (with the help of my fellow students and coach at Makers) by taking the following steps:
* I refactored the SMS class so that the Twilio `@client.messages.create()` method is contained in an instance method `send_message`, which is now called as part of the `order.confirm_total()` method.
* I could then create a double of the SMS within my order_spec tests to pass to the order object. This meant that the real SMS object with the real method of sending an SMS would not be called.

I also should have done more TDD for this project, rather than directly implementing solutions and production code.

#### Contributions

I referred to the following resources during this project:
* The Twilio walk through video to set up my `@client.messages.create()` method
* My coach and fellow student at Makers helped me to correctly implement a double into my tests so as not to send a live SMS.
