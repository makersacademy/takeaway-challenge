Takeaway challenge
==================
When first attempting this challenge it was important for me to establish how to allow the user to select and view their order. With this I created an interface class which the user could easily navigate as oppose to using irb. I created the menu which would have 2 methods; #show_menu and #choose. These would display the menu and allow the user to select the indexed dishes respectively. The interface would then call these methods on the menu class.

To enable the user to order items I created an Order class that would be responsible for storing information on the ordered items such as the dishes with prices and the total cost. This class would include the methods that interacted with the ordered items. I wished to allow the user to view their order, see their order price total, place their order and most importantly add items to their order.

Need to workout how to write spec tests for the interface which relies heavily on 'gets'.
