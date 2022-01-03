## I would like feedback on the following:

* Are my classes coupled enough?

* Are they loosely coupled?

* Could I have used keyword arguments better to make my code more changeable later?

* How would these classes work together as a program if they are so loosely coupled. Do I need a customer ordering interface to implement the public methods of my classes? Or should one of my classes be doing this already e.g. restaurant?

* Am I accessinging my attributes correctly in my restaurant methods? Should I be using the method rather than the instance variable?

* I initialise my restaurant class with a pre-set menu. Is there a better way of doing this, e.g. with optional arguments or keyword arguments?

* In my tests, I have hard coded the costs of the menu. Is this reasonable or should I be using my doubles to do this? 

* I have two almost identical methods in my restaurant and basket classes – would I abstract this method out to a module here?