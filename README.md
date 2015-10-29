Takeaway Challenge
==================

About
-----
This is my solution to the second of the weekend challenges we were set on the Makers Academy course. The project aims to fulfill the following user stories:

Usage
-----
To run this project, perform the following steps:
1. Run ```git clone git@github.com:thisdotrob/takeaway-challenge.git```.
2. Move to the root directory of the project.
3. Install the bundler gem: ```gem install bundler```.
4. Run ```bundle``` to install the required gems.
5. Open your REPL of choice e.g. ```irb```
6. Initialize a new Takeaway object: ```ta = Takeaway.new```
7. View the menu: ```puts ta.list_dishes```:

  ```
  0         Burger     £5.99
  1         Chips      £0.99
  ```
8. Add dishes to the order using ```ta.add_to_order(dish #, quantity)```, e.g. to order 10 burgers based on the menu above:

  ```ruby
  ta.add_to_order(0, 10)
  ```
9. When you have added your required dishes, complete the order by calculating your total and send it as an argument to the ```place_order``` method:
  ```ruby
  ta.place_order(59.90)
  ```
