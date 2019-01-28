Takeaway Challenge
==================
 Instructions to this challenge can be found [here](https://github.com/jesslns/takeaway-challenge/blob/master/README.md).

 #### Approach to the problem

 - Read the **user stories** and identify the object and message.
 - Draft a **domain model** based on user stories.
 - Plan how i can **delegate** methods into classes.
 - Write feature test and transform it into a unit test using **Rspec**.
 - In the unit test, write the expected behaviour of a method and **pass the test** through resolving the error messages, i.e. coding the behaviour.
 - When the test is passed, **refactor** and **encapsulate** my code.

 ##### Skills Aquired:

 - Use the **Twillio API** to generate a confirmation text.
 - Use **environment variables** to store personal details.
 - Class **delegation**.


### Instructions

- `takeaway = Takeaway.new` replicates a scenario when a customer walks/call in a restaurant.

- `takeaway.read_menu` is like displaying the customer the dish on offer with price (output is in hash as it is intended to feed into another model rather than into a view in a client).

- `takeaway.add_order(dish, number)` allows user i.e. the customer to add a dish and the quantity of that dish. `dish` needs to be an symbol argument.

- `takeaway.basket` will show the order summary.

- `takeaway.checkout` will show the total amount as well as sub-total of each order.

- `takeaway.confirm_order` will check if the bill is the correct sum through the provate method `checl_bill`. If the bill is correct, a confirmation sms will be sent to the customer.

An example on how methods can be used:
<div style='float: center'>
<img style='width: 400px' src="./public/images/screenshot_irb.png">
</div>
