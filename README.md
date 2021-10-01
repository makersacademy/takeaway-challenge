Takeaway Challenge
==================

Task
-----
* functionality:

  * List of dishes with prices.

  * User can access a list of dishes and their price
  
  * User can add food to purchase

  * Can show the reciept

  * Sends a text message when ordered

To Implement
-----
  * Verify number so anyone can get messages

  * Extract classes (for current text and items)

Gems
-----
* rspec

* Simplecov

* simplecov-console

* twilio-ruby

Example
-----
user = Takeaway.new

user.displayMenu

user.pickItem("spring roll")

user.pickItem("pork dumpling")

user.getReciept

user.pickItem("peking duck")

user.getReciept

user.addNumber("YOUR NUMBER")

user.order
