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

 ## Introduction

 I undertook this project in order to help me further understand object oriented programming principles and test-driven development (TDD).

 This program allows the user to view a menu, add items to their order, place their order, and receive an SMS confirming the order with an estimated time of delivery. Here are the user stories provided beforehand:

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

 ## Approach

I took a four-step approach to solve this challenge:

 1. **Domain modelling:** mapping out each object and the messages that will flow between them. Translating this into classes and their methods.

2. **Feature tests:** running the program through a REPL (in this case Pry), so that I could see errors and write unit tests accordingly.
3. **Unit tests:** writing tests (or expectations) in Rspec to show the expected functionality of each particular method and watching these fail straight away. These are located in the spec folder.
4. **Refactoring:** once I made my tests pass i refactored my code to make it simpler and more readable.

## How to run this program
### Installing this program
- Fork and clone this project onto your machine.
- Change directory (or CD) into the directory where this project is saved.
- Launch your REPL (irb or Pry - I'm using Pry here)

### Running this program
Make sure you require the takeaway file and then create a new instance of the Takeaway class:

```
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> takeaway = Takeaway.new
=> #<Takeaway:0x007f9bdb8cd7e0
 @dishes=
  {"Cheeseburger"=>6,
   "Hamburger"=>5,
   "Pizza"=>7,
   "Milkshake"=>3,
   "Burrito"=>6},
 @menu=#<Menu:0x007f9bdb8cd7b8>,
 @total_order=[]>
```

Here you can see that we have a Takeaway with a list of dishes (taken from the menu class) and a total order array, which is currently empty.

View the menu using the view_dishes method:

```
[3] pry(main)> takeaway.view_dishes
=> {"Cheeseburger"=>6, "Hamburger"=>5, "Pizza"=>7, "Milkshake"=>3, "Burrito"=>6}
```

Add an item to your order using the add method, you can specify a quantity, or it will default to 1 if not specified:

```
[4] pry(main)> takeaway.add("Cheeseburger", 2)
=> [{"Cheeseburger"=>6}, {"Cheeseburger"=>6}]
```

You can then place you order, giving the expected cost. If this does not match, you will receive an error:

```
[5] pry(main)> takeaway.place_order(11)
RuntimeError: Order total is £12. You expected £11.
```

When you enter the correct amount, you will receive a confirmation message:

```
[8] pry(main)> takeaway.place_order(12)
=> "Thank you! Your order costs £12 and will be delivered before 14:19"
```

You will also receive a text message.
