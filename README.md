Takeaway Challenge

The Build
-------
Functional Representation

| User          |
| ------------- | 
| Terminal      | 
| Menu          |   
| Menu Printer  |   
| Check out     | 
| Order Selection| 
| Delivery      | 

The Story/How to use
-------

This program was built with a focus on the single responsability principle and TDD:

1. The Terminal handles all the other classes and uses dependency injection to use class methods.
2. The Menu printer takes information from the menu and prints it out to the use in a chosen format.
3. The Order Selection is injected within Terminal and allows the user to add and remove food.
4. The Checkout is injected within Terminal and calculates the total balance.
5. The delivery class sends a confirmation after all relevant checks have been completed.
6. To use, view the menu, add food using a string and quantity, check outstanding balance, then finally order. 

Things to change
-------

Some of the main things to change:

1. Refactor RSpec tests.
2. Refactor dependency injection.
3. Clean up require system, implement chain require.
4. Add more gaurd clauses.

