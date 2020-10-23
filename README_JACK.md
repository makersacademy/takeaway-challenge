The nouns were split into owners & properties.
The actions were split into who owned them.
The actions were then given the properties that they read/write.
This resulted in:

class       --> dishes
properties  --> cost of dishes
            --> name of dishes
actions     --> read

class       --> total
properties  --> list of dishes
            --> current order
actions     --> add to order
            --> read order
            --> sum order

class       --> text
properties  --> total
            --> time
            --> order completed
actions     --> send


I then moved on to writing a failing test for the initialize method of my first class 'Dishes'. These tests checked to make sure that an array of hashes was created, and that this array included both names and costs for the dishes. The list also needed to be printable.
I then wrote tests to make the test pass, then refactored my test.

I then wrote a test to list all of the given dishes and their costs. When implementing this code, i recognised that i just needed a hash, not an array of hashes. This meant that i had to re-write my code/checks to reflect this.
Created a new document for the dishes, and moved current code and tests to the appropriate documents. 
