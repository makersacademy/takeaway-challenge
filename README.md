## Takeaway application
This is an application that orders takeaway food

## Motivation
This project app makes it easier for users to order food without calling

## Tech/framework used
<b>Built with</b>
- Ruby 2.5.0
- rubocop
- RSpec
- Twilio

## API Reference

Twilio

## Tests

RSpec

## How to use?
- Clone the directory and run './lib/interface.rb' in irb
-  to open new interface with pre-loaded menu
  ```new_user = Interface.new(menu)```
- to add an item to the order
  ```new_user.get(item, quantity)```
- to show full order
  ```new_user.show_order```
- to show total for order
  ```new_user.show_total```
- to checkout
  ```new_user.checkout(sum, number)```
