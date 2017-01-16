Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  MFM |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
The idea of this project was to simulate a takeaway. The user would be able to view the menu. Specify which items they would like from the menu and then finalise their order. When the order was placed a text message would be sent using the Twilio API.
# Issues faced

I found this challenge difficult. After creating my initial domain models I struggled to write the tests for the classes I thought should exist in rspec.
 Initially I had stored the menu items in an array of hashes (I know right?) which made working with any of the menu items incredibly difficult. There were a few other illogical leaps I made that proved almost impossible to implement in the way that I had originally written my code.After getting as far as User story 2 and spending a long time writing and testing code that had trapped me in a corner I decided the best course of action would be to look at the Makers Academy example and the example video.

After looking at the arrangement of the classes and the methods within those classes I had a better idea of how this challenge should have been approached and was able to re-write my code although it drew most of the basic functions from the example below.

https://www.youtube.com/watch?v=mgiJKdH9x8c

https://github.com/makersacademy/takeaway-exemplar/blob/master/lib/menu.rb

# Domain models
I'll add these at a later date.

# Classes

- TakeAway
- Menu

# How to use

At this point, you can view the menu with the view_menu method. Add items to your order with the add_to_order method which takes a dish and an amount. If just the dish is specified, the default amount is set to 1. You can view your current order with the view_order method. This returns the dish, amount and the total of that specific dish (e.g dish price * amount of dish).

```
  USERs-MacBook-Air-3:takeaway-challenge Mike$ pry
  You have created takeaway
  [1] pry(main)> takeaway.view_menu
  "Fish and Chips; £7.99"
  "Shephards Pie; £5.99"
  "Burger; £6.99"
  => ["Fish and Chips; £7.99", "Shephards Pie; £5.99", "Burger; £6.99"]
  [2] pry(main)> takeaway.add_to_order("Fish and chips", 5)
  RuntimeError: Cannot add to order: dish doesn't exist
  from /Users/Mike/Google Drive/Projects/takeaway-challenge/takeaway-challenge/lib/takeaway.rb:16:in `add_to_order'
  [3] pry(main)> takeaway.add_to_order("Fish and Chips", 5)
  => 5
  [4] pry(main)> takeaway.add_to_order("Burger", 5)
  => 5
  [5] pry(main)> takeaway.view_order
  "5x Fish and Chips: £39.95"
  "5x Burger: £34.95"
  => ["5x Fish and Chips: £39.95", "5x Burger: £34.95"]
  [6] pry(main)>
```
# Future intentions

Looking at my domain models and the way the classes are set up it seems like it would be a good idea to pull the order methods out and create an Order class. Because a lot of my program was re-written, my rspec test aren't great. After implementing the basic functionality I would like to refactor both my rspec tests and my written code.

I will spend the rest of this week finishing the project as aI am very interested in working with the Twilio API.
