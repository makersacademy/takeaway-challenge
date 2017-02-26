require_relative '../../lib/takeaway'

puts "----- FEATURE TEST -----"

takeaway = Takeaway.new

takeaway.show_menu

takeaway.choose_dish("Charsui pork", 2)
# takeaway.choose_dish("asfasfgasf", 2) # => ITEM NOT ON MENU
takeaway.choose_dish("Choisum", 3)

p takeaway.order

p takeaway.calculate_total # => 19

p takeaway.place_order(19)




puts "----- END FEATURE TEST -----"
puts puts
