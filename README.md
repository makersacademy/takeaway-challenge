TAKEAWAY CHALLENGE
=======================

## Synopsis

Project involves creating a takeaway menu of dishes and prices, to enable customers to order single or multiple dishes. Program allows customers to check that the price they expected to pay matches the total cost of the order. Customers also receive a text message confirming that their order has been placed. This text also includes information about when they can expect their order to be delivered by.



## Technologies Used

- Ruby
- Rspec


## Job List

- Menu contains a fixed list of dishes and their price (now in Order class after numerous issues having a separate menu class)
- Display contents of menu (now in Order class after numerous issues having a separate menu class)
- Place order of items (from menu) and specify the quantity of each item
- Add items in order together to create bill total
- Add error message if item specified is not on menu


## Still to complete/refactor
- I wasted about 12 hours just trying to get my doubles working and some kind of interaction between the menu and order classes, in the end I had to combine everything into a single order class just to move forward with the project, so I hope to go back and split these back out into 2 separate classes when I understand it better and am able to do so
- Add functionality to show order summary - including list of dishes and prices, with total price listed below
- Place order by giving the list of dishes, their quantities and a number that matches the order total (if the totals don't match an error should be raised)
- Implement the ability to place orders via text message - using twilio-ruby gem to access the API - use mocks and/or stubs, as necessary to not to send texts when your tests are run
- So far there aren't many if any examples of the Single Responsibility and Dependency Injection/Inversion principles in program - TODO when I work out how

