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




