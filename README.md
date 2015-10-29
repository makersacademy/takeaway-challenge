Takeaway Challenge
==================

About
-----
This is my solution to the second of the weekend challenges we were set on the Makers Academy course. The project aims to fulfill the following user stories:

Usage
-----
To run this project, perform the following steps:
1. Add the following environment variables:
  ```
  TWILIO_NUMBER <- Your Twilio API phone number
  MY_NUMBER     <- Your phone number
  TWILIO_SID    <- Your Twilio SID
  TWILIO_TOKEN  <- Your Twilio token
  ```
1. Run ```git clone git@github.com:thisdotrob/takeaway-challenge.git```.
1. Move to the root directory of the project.
1. Install the bundler gem: ```gem install bundler```.
1. Run ```bundle``` to install the required gems.
1. Open your REPL of choice e.g. ```irb```
1. Initialize a new Takeaway object: ```ta = Takeaway.new```
1. View the menu: ```puts ta.list_dishes```:

  ```
  0         Burger     £5.99
  1         Chips      £0.99
  ```
1. Add dishes to the order using ```ta.add_to_order(dish #, quantity)```, e.g. to order 10 burgers based on the menu above:

  ```ruby
  ta.add_to_order(0, 10)
  ```
1. When you have added your required dishes, complete the order by calculating your total and send it as an argument to the ```place_order``` method:
  ```ruby
  ta.place_order(59.90)
  ```

Modifying the menu
------------------
The menu is loaded from the ```menu.txt``` file. Each dish should be on a new line in the following format:
```
name,price
```

Author
------
Rob Stevenson (this.rob@outlook.com)
