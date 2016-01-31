Takeaway - Placing orders for a takeaway meal: V1.0

Author: Mat Drake

Created: 30/01/2016

Requirements: This program was designed to run with Ruby 2.2.3

-------------------------

Using this program, you will be able to view a list of dishes available from a menu, selecting your preferred dishes and confirming the price it should cost. If the prices entered match the cost of your orders, you can finalize an order and  a text will be sent to confirm it.

-------------------------

To start an order you will need to instantiate a new Order. When instantiated the required modules will be loaded automatically:

  - Menu
    - Allows you to view the items on a menu (dish and price)
    - Used to verify that items ordered are on the menu
  - Text
    - Holds the functionality to text order confirmations

-------------------------

An example of how you may create and finalize an order would be:

  - my_order = Order.new

  - my_order.add_to_order(:soup, 3, 4.50)

  - my_order.finalize_order

In the example above, a new order is instantiated and 3 soups with a price of £4.50 are added to the order. The price entered needs to be correct (based on those listed on the menu), otherwise an error will be shown to let you know the price is wrong. If the price is incorrect, the items will not be added to your order. By calling 'finalize_order', a text will be sent to confirm the order.

You can also view current orders and total cost:

  - my_order.current_order => Displays the items in your current order

  - my_order.total => Displays your current total cost

-------------------------
