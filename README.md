# Takeaway Challenge

[Exercise instructions are here](takeaway-challenge.md)

## Installation

1. Fork and clone this repo
2. `bundle install`
3. Copy `twilio-config-EXAMPLE` to `twilio-config-PRIVATE` (the latter is protected by `.gitignore`)
4. Enter your Twilio credentials and phone numbers in `twilio-config-PRIVATE`

## Instructions

1. `source ./twilio-config-PRIVATE` to load Twilio details
2. `irb -r ./lib/takeaway.rb`
3. Create a new takeaway object:
   ```ruby
   > takeaway = Takeaway.new
    => #<Takeaway...>
   ```
4. Check the menu:
   ```ruby
   > takeaway.menu
    => [{:name=>"mixed meze", :price=>10}, {:name=>"lahmacun", :price=>4} ... ] 
   ```
5. Add an item to your order with `takeaway.add_to_order(item, quantity)`:
   ```ruby
   > takeaway.add_to_order(takeaway.menu[1], 2)
    => #<Basket... @contents=[{:name=>"lahmacun", :price=>4}, {:name=>"lahmacun", :price=>4}]> 
   ```
6. Check your order
   ```ruby
   > takeaway.basket
    => [{:name=>"lahmacun", :price=>4}, {:name=>"lahmacun", :price=>4}]
   ```
7. Confirm your order by verifying the price:
   ```ruby
   > takeaway.verify(8)
    => true
   ```
8. We will confirm delivery time by text.
9. Bon appetit 👨‍🍳

## To do

1. Generally check for refactoring possibilities
2. Be clear about the responsibilities of my classes
3. Extract `Menu` class - menu items shouldn't be hard-coded in `Takeaway`
4. Give menu items an id number you can use when ordering? Also better for ordering by text
5. Maybe `basket` should be `order`, and it could look after the `verify` method?
6. Pretty-print menu?
