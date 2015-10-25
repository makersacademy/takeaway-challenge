This program is designed to simulate a takeaway order process.

A customer has the ability to view the menu of their chosen takeaway venue. The
customer is able to add dishes to their basket(provided that the dish is a valid item provided by the takeaway) along with a specified quantity, check the total of
their basket and place an order with the takeaway.

When the takeaway receives the order, the customer will be sent an SMS,
notifying them of their order total and estimated delivery time.

Please see the below extract for a sample run of the program:

```Ruby
require './lib/customer'
# => true

customer = Customer.new(Takeaway)
# => #<Customer:0x007fb36c06f118
# @basket={},
# @takeaway=
# #<Takeaway:0x007fb36c06f0f0
# @menu={:chicken_noodle_soup˜>4.95, :duck_spring_rolls=>4.95, :crispy_duck=>8.95, :singapore_fried_noodles=>7.95, :steamed_rice=>2.95}>>

customer.view_menu
# => {:chicken_noodle_soup=>4.95, :duck_spring_rolls=>4.95, :crispy_duck=>8.95, :singapore_fried_noodles=>7.95, :steamed_rice=>2.95}

customer.place_order
# RuntimeError: Your basket is empty. Please select a dish

customer.select_dish(:invalid_dish, 2)
# RuntimeError: Please select a dish from the menu

customer.select_dish(:singapore_fried_noodles, 2)
# => "2x singapore_fried_noodles(s) added to your basket"

customer.select_dish(:steamed_rice, 2)
# => "2x steamed_rice(s) added to your basket"

customer.place_order
# => "Thank you! Your order total of £21.8 was placed and will be delivered before 19:35"
```
