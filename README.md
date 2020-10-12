Takeaway Challenge
==================


The Takeawy allows customers to view a menu, order available items, check the total and recieve SMS confirmation of their food orders


1) Customer would like to be able to see a list of dishes
                    ***** Todo **********
  Takeaway class  

    i) Create a class Takeaway that is initialized with an argument that is a menu class object which is stored as an instance variable on takeaway
    ii) create a method 'print_menu' on takeaway that prints a menu. It should call a print method on the menu object

    Menu class

    i) Create a class menu that is initialized with an argument menu_items. This is stored as an instance variable and is a hash of dishes
    ii) create a method print which prints out a list of dishes
                    ***** done *********  

2) Customer would like to select a number of available dishes
                    ***** Todo **********
  Takeaway class
    i) create a method order which takes two arguments: item and quantity
    ii) create an instance variable current_order which is initialized as an empty array. The order method should push orders to this.
 

                    ***** done ********* 

3) Customer would like to check total given matches the sum of the dishes in the order
                    ***** Todo **********

  Takeaway class
 *--- i) create a checkout method that confirms order and returns the total cost 
      ii|0 update order to return an error if item is not on menu

  Order class
    i) create a new order class that is initialized on takeaway
    ii) move add and place_order methods to the order class - it will need to reference the menu (menu should be initializes on the order class)
    iii) add a checkout method that returns to the total cost of the order

                    ***** done ********* 


Outstanding: Add a method to send text messages confirming order




