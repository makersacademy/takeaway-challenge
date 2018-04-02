<h3>Takeaway challenge- Weekend challenge#2 for Makers Academy</h3>
<h2>Structure</h2>
<p>Takeaway is an implementation of a simple takeaway shop in OOP Ruby. There is a number of classes- Shop, Dishes, Order, OrderItem, Dish, OrderItemPrinter, OrderPrinter, DishPrinter and Communicator. The user interacts with the Shop class. A new instance of Shop is implemented with a menu instance variable- an instance of Dishes that reads menu data from a .csv file and creates and stores a number of Dish instances, each with a unique number, price and description. When the user first orders a new Order instance is created which will hold a number of OrderItems. </p>
<p>A user can see menu, order a number of dishes, see the order in progress, remove order items, checkout and see the bill. When the order is completed, the user will receive a confirmation message with estimated delivery time.</p>
<p>A number of edge cases are tested for, such as- number of dishes ordered has to be (1..12) (1 by default), only an existing
  dish (identified by id) can be ordered, only an existing order item (identified by order item id) can be removed and only from an order in progress, checkout is only possible if there is an order in progress with a total > 0, etc.</p>
<h2>Implementation</h2>
<p>App is written entirely in Ruby. I am using the Twilio API to send SMS messages to confirm the order and twilio-ruby gem to work with the API.</p>
<h2>In use</h2>

![Alt text](./images/order.png?raw=true)
  
