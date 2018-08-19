class Order
# the Order class has an instance variable @o_items
# o_items is an array to store any user-selected dishes (instances of OrderItem)
# the Order class has a method to create order items.
# This takes user input of the MenuItem's number, and the quantity. If no qty is given, default to 1.
# Then an OrderItem is created from the MenuItem corresponding to this info, and pushed into the @o_items array.
# There is a method for calculating the total
# This done by multiplying the price & quantity of each element in the o_items array,
# and is then formatted to look pretty / have £ sign etc.
# User can then confirm an order! Which triggers Twilio to send the message (and
# also shows the time of now +1hr as delivery time)

end
