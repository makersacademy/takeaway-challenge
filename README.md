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

Makers Academy Weekend Challenge - Week 2
-----------------------------------------

For this challenge, I responded to several user stories to create a model of a takeaway order service using TDD. Here are the user stories followed with explanations of how I implemented them, and how I might improve them in the future:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
- I created a Menu class, which a readable attribute of `@dishes`, which is an array containing a list of dishes
- For simplicity and to save time, I hard-coded the available dishes into the class attribute, and represented each dish as a hash which holds key-value pairs representing the name and price of the dish; if I had more time (or if there had been user stories from the perspective of restaurants wanting to update the menu), I would have probably created a Dish class (with name and price attributes) and placed these in the array instead of hashes. I would also have probably made use of a CSV file containing the dishes, so that multiple dishes could be added and removed more easily, and required a CSV file as an argument in initializing a new menu object, so that different menus could be created for different restaurants.
- I established a `#display` method within the Menu class, which iterates through the items in the `@dishes` array and prints them out as an ordered list under the heading "Menu".

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
- I created an Order class, which takes an instance of the Menu class as an argument upon initializing (defaulting to Menu.new if none is provided), and which has an `@items` attribute, which initializes as an empty array.
- I defined the `#add_item` method, which takes two arguments: dish name, and quantity. If no quantity is provided, it defaults to 1. Calling this method adds dishes from the Menu class's list of dishes (that is, a hash representing a dish) to the order's `@items` array, adding to the hash the key `:quantity`, with its value set to the quantity specified (or to 1 if no quantity is specified).
- At present, this doesn't respond to edge cases such as users trying to call this method with a dish that's not on the menu (including typos).

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
