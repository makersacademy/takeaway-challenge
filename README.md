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

Instructions
-------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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
I would like to see a list of dishes with prices = menu
I would like to be able to select some number of severable available dishes = order
I would like to check that the total I have been given matches the sum of the various dishes in my order = order
I would like to receive a text after I have ordered - sms

I originally wanted three classes, but I struggled once I got to the point where I would need an order class as the concept with dependancy injection and doubles is still quite complex to me, but I did manage it for the menu class so I am pleased with that, so for now I have stuck with a takeaway and menu class only, understanding that the correct thing to do later when I feel more confident in the syntax and methods to make my code have high cohesion, I would refactor to take away the responsibilities I feel should go in order from the takeaway class.

Domain Model:
Class    | Instance Vars | methods      | responsibility
Menu     | dishes        |list_price    |initialises with dishes, converts hash into readable format
Takeaway | Takeaway(menu)|listed price? |initialises with menu, shows the menu
         |               |add(dishes)   | lets you pick the food you want
Order    |               |total         | gives you the total
                         |check_total   | checks your total matches the total your given
Sms      |               |              | sends the confirmation txt

Planning:

Takeaway = does everything without the methods, similar to oyster card.
https://www.freecodecamp.org/news/object-oriented-programming-concepts-21bb035f7260/ Linked website that makers provided as a resource to solidify my understanding with the coffee maker analogy they include.

I will start in takeaway with the first user story, writing the rspec for the code I would expect to be able to type if the separate classes existed. For example, a menu class would have the menu as a hash, and the ability to print the menu method in there. That print the menu method in the menu class would convert that hash into a string, so because menu is doing all of this work behind the scenes, all takeaway would have to do is show it, not do the whole creating and converting. I would need to go back as I mentioned above to refactor takeaway as it has a lot of responsibilities at the moment.

As the menu class doesn’t exist yet when I started,  I would use a double for the menu class and the menu method, just to see how it would work as that appears to be the simplest way rather than starting WITHIN the Classes that do all the hard work first, and go from there.

https://stackoverflow.com/questions/12389567/how-to-format-a-string-with-floats-in-ruby-using-variable I used this website when trying to find out how to convert my hash value into a string that has the correct floating point

https://stackoverflow.com/questions/41523788/compare-array-values-and-hash-keys-if-match-sum-corresponding-hash-values I used this website to help me understand how I can take my array of dish names, and compare it to the corresponding keys in my dishes hash in my menu class, and take the value of those keys and add them up.