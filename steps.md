# Review user stories and highlight nouns and verbs

# input class diagram and highlighted text

# RED, GREEN, REFACTOR
## rspec unit tests for menu class
- it holds information on dishes and prices upon initialisation
- it gives the user options on what menu they would like to view
- it prints a list of all dishes and prices on the menu when requested
- it raises an error if user tries to access a menu that does not exist

[x] rspec tests passing
[x] irb feature test working as expected
[x] refactored

## rspec unit tests for order class
- add method takes dish and quantity as arguments, adds them to the users order, and returns the current order list
- checkout method takes users name, phone number, address, sends a confirmation text, and returns the checkout summary including cost breakdown
- order method prints current order list

N.B. I originally planned this in the Class diagram as if there would be a user interface rb file,
that would ask for user input step by step e.g. please provide your name, please provide your phone 
number etc, but I've just realised I don't think that's going to work for rspec testing. I don't think 
you can do gets.chomp with rspec? So I will just go back and change the class diagram before continuing.

# input new class diagram


# TODO:
- I am relying on the menu class at the order initialise to get the @menu info - does this need to change for testing?

