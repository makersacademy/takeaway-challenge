# Overview
This program is designed to simulate a takeaway order process.

A customer has the ability to view the menu of their chosen takeaway venue. The
customer is able to add dishes to their basket(provided that the dish is a valid item provided by the takeaway) along with a specified quantity, check the total of
their basket and place an order with the takeaway.

When the takeaway receives the order, the customer will be sent an SMS,
notifying them of their order total and estimated delivery time.

# Approach
The intention was to develop a program that adhered to the Open/Closed and Single
Responsibility Principle, more explicitly, I wanted to inject my dependency (the Takeaway class)
as close to run-time as possible.

The Takeaway class currently holds a concrete dependency on the menu, which is initailized at
run-time. Future improvements should be made so that this dependency is also injected, allowing
users of the system to extend the functionality of the program to include more menus, but require no modification of the program itself.

# Feature test run:

##### Firstly require the relevant file.
```Ruby
require './lib/customer'
# => true
```
##### Instantiate an instance of the Customer class
```Ruby
customer = Customer.new(Takeaway)
# => #<Customer:0x007fb36c06f118
# @basket={},
# @takeaway=
# #<Takeaway:0x007fb36c06f0f0
# @menu={:chicken_noodle_soup˜>4.95, :duck_spring_rolls=>4.95, :crispy_duck=>8.95, :singapore_fried_noodles=>7.95, :steamed_rice=>2.95}>>
```

##### Run the view_menu instance method to view your Takeaway's chosen menu
```Ruby
customer.view_menu
# => {:chicken_noodle_soup=>4.95, :duck_spring_rolls=>4.95, :crispy_duck=>8.95, :singapore_fried_noodles=>7.95, :steamed_rice=>2.95}
```

##### When attempting to place an order with an empty basket, an error should be raised
```Ruby
customer.place_order
# RuntimeError: Your basket is empty. Please select a dish
```

##### When attempting to order a dish that does not exist on the menu, an error should be raised
```Ruby
customer.select_dish(:invalid_dish, 2)
# RuntimeError: Please select a dish from the menu
```

##### Selecting valid dishes will add them to your basket
```Ruby
customer.select_dish(:singapore_fried_noodles, 2)
# => "2x singapore_fried_noodles(s) added to your basket"

customer.select_dish(:steamed_rice, 2)
# => "2x steamed_rice(s) added to your basket"
```

##### Finally, an order can be placed. The user will receive a confirmation message on the interface and a text sent to their phone.
```Ruby
customer.place_order
# => "Thank you! Your order total of £21.8 was placed and will be delivered before 19:35"
```
