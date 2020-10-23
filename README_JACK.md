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
