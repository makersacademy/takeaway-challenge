## Takeaway Challenge

before looking at the challenge, I made sure I had the Gemfile set up, the correct version of Ruby and finally added any new gems I would need for the project such as the 'twilio-ruby' gem.

Step-1: After reading the challenge, I analysed the user stories to create my initial Domain Model. 

#### User Story 1

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

_Breaking down this User Story:_

We can create a single **Dish** class that will describe the Dish objects like their name and price
- [x] Create a tests for the Dish class, check to ensure a name and price can be stored correctly on the object
- [x] Make those tests pass 
- [x] Refactor your solution

Create a **Dishes** Class that will represent all the dishes currently offered at the takeaway

_Create the following tests for the Dishes Class:_
- [x] It should initialize Dish objects on creation, they should be saved in an array called **list**
- [x] It should be able to initialize any number of Dish objects 0 included.
- [x] It should have a method to **see_dishes**
- [x] **see_dishes** should display dishes using string interpolation with their name followed by price

- [x] Make those tests pass
- [x] Refactor your solution

After the above is completed the user should now be able to see the list of dishes with their prices included. 

##### _**Self Review**_
The SRP (Single responsibility Principle) should be kept in your mind. Analyse all the classes and methods, are they handling one responsibility and how well are they handling it. 

If a class has to describe more than one object, maybe consider refactoring it into to two or more classes. 

Methods should be doing one task, and should be short and simple. If you have long methods you may be asking the method to perform too many responsibilities, consider refactoring it and make sure to keep it DRY(Dont Repeat Yourself).

Try to read through the code, consider the names of the methods. Do they describe the method properly? Is there a better name that would read better? If yes, consider changing the name of your method. Making your code easier to read now will help people who need to modify it in the future and also yourself.



#### User Story 2

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

_Breaking down this user story_

Since we have no way for the user to select his meals, we change the **list** array into a hash. The keys will be the **meal-numbers** and the value will be the dish objects. This way the users can choose what meals they want by the meal numbers

- [x] change the **list** variable into a hash, where the keys represent meal numbers and the values are the Dish objects
- [x] change the output of #see_dishes to incorporate dish numbers
- [x] Add some instructions to the user at the end of the #see_dishes output on how to order
- [x] check to see if any tests are broken and fix any issues

We then need a new method for selecting dishes (#select_dishes) this should initialize a new object called Order this will handle storing the order from the user and anything else to do with modifying the order.

_Create the following tests for Dishes:_
- [x] The #select_dishes method should take an array of numbers as an argument
- [x] It should output an array of chosen dishes and save this to a parameter called **chosen_dishes**

- [x] Make the above tests pass
- [x] refactor your code

_Create the following tests for Order:_
- [x] It should take 1 argument and save it to current order

- [x] Make this test pass
- [x] Refactor your code




