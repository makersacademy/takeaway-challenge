require_relative '../../lib/takeaway'

puts "----- FEATURE TEST -----"

takeaway = Takeaway.new

takeaway.show_menu

takeaway.place_order("Charsui pork", 2)





# user inputs:
# order: Chicken x2, Veg x1
# expected total: 13




puts "----- END FEATURE TEST -----"
