 __       ___,.-------..__        __
//\\ _,-''                `'--._ //\\
\\ ;'                           `: //
`(             TAKEAWAY          )'
  :.                           ,;
   `.`--.___           ___.--','
     `.     ``-------''     ,'
        -.               ,-
          `-._______.-'

What does the program do?
---------

  It allows users to order food from a menu. Users can see the menu and add items to their order. Orders and the total can be checked. Once ready, can be placed: this triggers the automation of a text to the users mobile confirming that the delivery will arrive in an hours time.

  Test coverage is: 100%
  All tests are passing

How do I use it?
---------

Instantiate new menu:

`menu = Menu.new`

See dishes and prices:

`menu.see_dishes`

When ready to order, create an create an instance of Order:

`order = Order.new`

Add the dish and quantity you want:

`add(dish, quantity)`
  - if the dish is not on the menu, you will receive an error and nothing will be added to your basket.

Check what is currently in your basket and it's total cost:

`order.check`

When you are happy with your order:

`order.checkout`
  - you will receive a delivery ETA by text.


What was my approach?
---------
Menu allows the user to view available dishes.

Order allows users to check and manipulate their order.

Messager holds twilio authentication details and allows for texts to be sent.


How would I improve it?
---------
- Not hardcode the menu. This would allow for expansion of different menus.

- Consider making a higher order Restaurant class as the majority of work being in the order class seems illogical.

- Order is currently held as an array of hashes which makes it circuitous to accumulate items. A hash would have sufficed for this purpose.

- Possibly add a formatter class to handle presenting menus and order checks in an easily readable fashion.

- Find another way to manage the private pretty_basket method. The method is too long partly due to the basket data storage type.

- Find a way to hold the Messager account info securely.
