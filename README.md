# Project: Takeaway Challenge

This project is a simple model of an online food-takeaway service. Users can choose the items they want from a menu and place them into their cart. After confirming the total price of the order, the project also sends a SMS message to the user's phone number.

## Example Code

```ruby
[2] pry(main)> cart = Cart.new
=> #<Cart:0x007faff98d58a0
 @basket={},
 @menu=#<Menu:0x007faff98d5800 @dishes={"pizza"=>3.0, "coke"=>1.0}>>
[3] pry(main)> cart.order('pizza', 3)
"3x pizza(s) added to your basket"
=> "3x pizza(s) added to your basket"
[4] pry(main)> cart.order('coke', 6)
"6x coke(s) added to your basket"
=> "6x coke(s) added to your basket"
[5] pry(main)> cart.basket
=> {"pizza"=>3, "coke"=>6}
[6] pry(main)> cart.total_price
=> 15.0
[7] pry(main)> cart.checkout(15)
=> "Checkout for $15.00 successful. You will receive a text shortly."
```

## My Approach

I started this project writing tests for the Menu class, which contains the name and price information for each available dish, before writing the code.

Next was the Cart class, which holds the responsibility of storing the customer's orders and sending an SMS to confirm the order. Again, I took a test-driven development approach where I wrote simple tests first (e.g. can accept orders), before adding more tests and refactoring as we increased functionality.

The ability to send the user an SMS is made possible by the Twilio API, which is also listed in the Gemfile.
