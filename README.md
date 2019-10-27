Takeaway Challenge
==================


Initially created a Takeaway class with an instance attribute `@menu` as an array of hashes:
`@menu = [
  { "margarita" => 7.5 },
  { "hawaian" => 8.5 },
  { "garlic bread" => 5 }
]`

Then made the decision to refactor `@menu` into a hash like so:
`@menu = {
  "margarita" => 7.5,
  "hawaian" => 8.5,
  "garlic bread" => 5
}`
because this made it easier to access the price for the dish being ordered.

When I implemented the user requirement "to be able to check that the total I have been given matches the sum of the various dishes in my order", I decided to implement a `confirm_total(amount)` method. If the amount entered by the user didn't match the total of the order placed, an error message would be raised.

In order to be able to store and calculate the total of the order placed, I decided a basket feature would be necessary. I decided to create a separate Order class, with basket as an attribute. This class is responsible for saving the user's order to the basket, and calculating the total of that order. If the total is correct, it sends the user a confirmation SMS.  

I also decided to refactor the menu. Instead of having it as an attribute in the main Takeaway class, there is now a separate menus file with multiple cuisine classes, each with a menu attribute. This is so the user can pass the cuisine of their choice into the initialize Takeaway so they can view and choose from multiple menus. However, they can only order from one cuisine per order.


I struggled with mocking and doubling to test the SMS function without actually sending an SMS.

I tried creating a double of the client and allowing it to receive the :messages and :create methods and return a stubbed output of the body of the text. However the test would not pass because it expected an output of the body of the text, but instead got true. It also still sends an SMS whenever I run rspec.

I saved my phone number, Twilio account sid and Twilio authorisation token as environmental variables so as not to upload sensitive and private information to the public.


I also should have done more TDD for this project, rather than implementing solutions and production code directly.
