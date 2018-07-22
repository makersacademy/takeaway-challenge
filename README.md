# Takeaway Challenge
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

### Completed by Marek Schmidt
#### See Instructions and User stories below

## Context
This was the second weekend project I attempted while at Maker's Academy. When completing this I had two week's worth of practical experience in Ruby and Rspec, and no experience using an API in a project. This week we focused on encapsulation and cohesion, using techniques including data injection, mocking, stubbing, and class extraction.

## Approach
Like last week, I again used IRB as a method for feature testing this program. I did not want to create an interactive menu or a file that runs by itself, as that will be more accessible after learning about front end. I only created two classes, one for a menu and one for the user's shopping cart. There is a third class, a 'TextSender' class, though this comes from the Twilio API and likely was not implemented entirely correctly. I decided to challenge myself and load a menu from a json file that I have created, in order to add additional 'restaurants' in the future (different jsons).   

## Summary
The user acts as a customer ordering at a restaurant. The user can view the menu, view a menu category (i.e. "Lunch", "Drinks"), add from the cart, remove from the cart, view the cart's items, view the cart's total price, and checkout. Upon checkout the user must confirm the total amount to be payed or else the order will not go through. When run in IRB, the confirmation message is sent via sms to my personal phone number. You can alter this number in 'send_sms.rb' in order to receive your own confirmations.

## State of project and changes to be made
The main functionality of this program is rather complete. All user stories have been satisfied and some extras have been added for convenience or in order to further challenge myself.  

The main addition I would like to make is the ability to choose from different restaurant menus. I believe I may be able to complete this now, though much of my tests will have to change or be greatly added to. I will leave this for a later date. Another possible, and more challenging addition, would be to allow ordering via sms as opposed to only receiving sms confirmations. This may take quite a bit more work.  

Currently I have 98.84% test coverage. I replaced the sending of sms confirmations in rspec with a puts statement, though when actually run it will send the message. I am not sure how to test for the sending of an sms, so that is where the missing coverage lies. I have 12 offenses with rubocop, all of which have to do with either lines being too long, methods being too long, or a class being too long. Though I would like to reduce these offenses, I believe the way my methods currently function add to usability (such as allowing either a single item name or an array of item names to be passed when adding or removing from cart). I could separate these methods, but I'd cull the amount of method names the user has to work with as opposed to shortening my methods.  

## Feature testing
There is a file in the spec folder called 'features_spec.rb' which has the purpose of testing all four user stories. This does not include tests for any extra features I included outside the range of the user stories. For more detailed testing, try it yourself! Instructions are below.

## How to use

#### 1. Run IRB from the main folder 'takeaway_challenge'
```
irb
```

#### 2. Require the proper files
```
require './lib/cart.rb'
```

#### 3. Silence IRB in order to avoid long return statements containing the entire menu
```
conf.return_format = ""
```

#### 4. Create a shopping cart
```
cart = Cart.new
```

#### 5. Print the menu
* You may print the full menu
  ```
  cart.print_full_menu
  ```
* Or print a category from the menu
  ```
  cart.print_category("Dinner")
  ```

#### 6. Add items to your cart
  * You may add a single item by it's name
  ```
  cart.add("Prime Rib")
  ```
  * Or add multiple items at once by passing an array of names
  ```
  cart.add(["Chicken Alfredo", "Ceasar Salad", "Soup of the Day", "Lemonade", "Lemonade"])
  ```
  * To add multiple of the same item, add it's name the desired number of times

#### 7. View your cart
  * You can view all items in your cart
  ```
  cart.my_items
  ```
  * Or view the total price of your order
  ```
  cart.my_total
  ```

#### 8. Remove items from your cart, if necessary
  * You may remove a single item by it's name
  ```
  cart.remove("Soup of the Day")
  ```
  * Or remove multiple items at once by passing an array of names
  ```
  cart.remove(["Chicken Alfredo", "Lemonade"])
  ```
  * To add multiple of the same item, add it's name the desired number of times

#### 9. Check out!
  * You must enter the total amount to pay, which must match your cart's total, in order to confirm checkout
  * _If you would like to receive a text verification of your order, please edit the line in './lib/send_sms.rb' that contains the @to number to use your personal number_
  ```
  cart.checkout(14.00)
  ```
  * If you fail to enter the proper total, you can try again
  * Upon checking out, your cart will return to empty for your next order

#### 10. When finished, exit IRB
```
exit
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
