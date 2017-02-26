require_relative '../../lib/takeaway'

puts "----- FEATURE TEST -----"

takeaway = Takeaway.new

takeaway.show_menu

takeaway.place_order("Charsui pork", 2)
# takeaway.place_order("asfasfgasf", 2) # => ITEM NOT ON MENU
takeaway.place_order("Choisum", 3)

p takeaway.order

p takeaway.calculate_total # => 19





puts "----- END FEATURE TEST -----"
