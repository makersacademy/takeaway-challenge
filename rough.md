# Takeaway Challenge

## Summary of challenge
- Create a command line application that can display a takeaway food menu
- Allow a user to make an order by specifying the dish names and quantities of each
- Allow the user to see the total cost of their order, including a line by line breakdown of each dish
- Allow the user to place their order
- Have the user receive a confirmation text specifying when the order will arrive

## How To Use
```
irb -r ./lib/takeaway.rb
>t = TakeAway.new
> t.start
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

## Considerations
- A decision was made early on to present the application as an interactive menu so that different functions could be carried out by typing strings into the command line, as opposed to having to run individual methods. The prompts and user responses were carried out using `puts` and `gets` methods. The code implementation was not too difficult, but there was a real challenge in writing the rspec tests. Trying to mock the user inputs and testing that the user prompts all appeared correctly and in the right order was extremely cumbersome. I will look into whether there is an easier way to test this type of process.
- I was careful to restrict public access only to class methods that would either be used by the User or by other classes. This seemed like a reasonable thing to do, but also resulted in the vast majority of my unit tests being deleted. I assumed that since I would be testing behavior instead of state, that so long as the public methods acted as they were supposed to, and that there were no redundant private methods, that all the methods would end up being tested, either explicitly or implicitly. However, after implementing all the tests, the test coverage was found to be fairly low - around 80%. I am still trying to determine whether I implemented the tests correctly, or if I was too strict in allowing public access to class methods.
- I struggled to figure out the correct way to store the menu data, such that it could be displayed by the `Menu` class, as well as used by the `Order` class to verify user inputs and `Basket` class to calculate price totals. I had originally planned to to store the data within the Menu class, but did not like the idea of each class accessing the `Menu` class individually, which, as far as I could tell, would result in many instances of the `Menu` class being created. I instead opted to store the menu data in a .csv file that each class would access individually. This also has the added benefit of easily being able to change the menu and prices without modifying any of the classes.

## Future development
- The use of a presentation class would have made code implementation a lot easier and would also prevent return values from appearing in IRB which can be distracting.
- Adding functionality so that orders could be made via sms message