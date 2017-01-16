Takeaway Challenge

First, some initial notes on the challenge. There are some things I am unhappy
about with my solution, and if given more time would try to implement the following:

1. Refactoring of methods in Printer - these seem quite inelegant as stood.
2. Better testing for Modules - need to research modules & rspec. As they stand,
  I feel that these aren't strong functionality tests.
3. Redo Printer as a Class instead of a module.
4. Make it so the Twilio phone number doesn't have to be input every time.
5. Adapt the Time class output so it is only showing hours and minutes + 30
6. Set up defaults.
7. Allow the list class to be set up by importing pre-made menus, which can then
  be added to or subtracted from.
8. Redo printer so printing the itemised list isn't reliant on show_list first.

Basically, feel that this isn't an ideal solution, and look forward to watching
the exemplar video so I can discover a more effective method.

HOW TO USE PROGRAM:

1. Require takeaway (./lib/takeaway.rb)
2. Add new list - list = List.new
3. Add a couple of meals with prices to the list - list.add_dish("Burger", 5)
4. Create a new takeaway - takeaway = Takeaway.new(list)
5. Order a meal with quantity - takeaway.order_meal("Burger", 5)
6. Show price of order - takeaway.show_price
7. Print an itemised list of order - takeaway.show_order_list
8. Send a confirmation text - takeaway.send_message(twilio_number, customer_number)
