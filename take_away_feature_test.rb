require './lib/takeaway'



# Tested class
take_away = TakeAway.new
puts
puts

#Scenario #1, user looks at the menu
puts "SCENARIO #1, user looks at the menu"
print take_away.dishes
puts
puts

#Scenario #2, user selects 2 hamburgers and 1 salad
puts "SCENARIO #2, user selects 2 hamburgers and 1 salad"
take_away.select('hamburger', 2)
take_away.select('salad', 1)
print take_away.current_order
puts
puts

#Scenario #3, user places the order
puts "SCENARIO #3, user places the order"
take_away.place_order(take_away.current_order, 34)
