require 'dishes'
require 'takeaway'

# create new instance of dishes
dishes = Dishes.new

# add items to the menu
dishes.add_item("Chop Suey", 15.99)
dishes.add_item("Thai Curry", 11.99)
dishes.add_item("Singapore Noodles", 9.99)

# show the menu
dishes.list
