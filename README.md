Takeaway Challenge
==================
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

## My Approach

- Analyse user stories and use diagrams to plan basic program.
- Ensure unit tests for each class function in isolation.
- Use TDD: feature test, unit test, code, repeat.

## How to use

Using irb:
```
irb
require './lib/takeaway.rb'
```

Create a takeaway:
```
new_takeaway = Takeaway.new
```

View menu:
```
new_takeaway.view_menu
```

Create an order:
```
new_takeaway.add_to_order(food item, optional quantity (default = 1))
```

Place order:
```
new_takeaway.place_order(payment)
```

Running tests:
- Tests written with rspec, run from root directory:
```
rspec
```

## User Story Analysis:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
|Objects|Messages|
|----------|-----------|
|Customer||
|Menu|view_menu, print_menu|
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
|Objects|Messages|
|----------|----------|
|Customer||
|Dishes|add_to_order|
|Order|place_order|
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
|Objects|Messages|
|-----------|----------|
|Customer||
|Order|check_order|
|Total||
|Payment||
- Thoughts: place_order(payment) could allow customer to enter payment which can then be compared with a total calculated from the sum of each dish quantity * price in a check_order method before confirmation.
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
|Objects|Message|
|-----------|-----------|
|Customer||
|Order|confirm_order|
|ETA|calculate_eta|
|Text|send_message|
