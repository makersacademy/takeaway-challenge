Takeaway Challenge
==================

How to use
-------

Initialize your takeaway. I've written in a short menu in the menu class which it will find. If you want to change the menu then the menu class will have to be altered. With more time I could build in more than one menu or allow it to accept multiple menus from different text files.

my_takeaway = Takeaway.new

Show the menu:

my_takeaway.show_menu

=> ["Burger: £3", "Chips: £2", "Drink: £1"]

Place an order:

my_takeaway.place_order('Burger',2)
=> "2 - Burger has been added to your basket"
my_takeaway.place_order('Drink',3)
=> "3 - Drink has been added to your basket"

Check your order so far:

=> "Burger x2: £6... Drink x3: £3... Total price: £9"

Reset your order:
my_takeaway.reset_order

Or, if you're happy with your order, proceed to checkout my entering the exact price as an argument.

my_takeaway.checkout(9)

My approach
-------
When trying to figure out my domain model at the start, there seemed to be 2 main contributing parts to the challenge the menu and the takeaway. It soon became clear that I also needed an order class so I refactored to include this.
