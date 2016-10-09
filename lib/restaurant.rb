require_relative 'takeaway'

class Restaurant < TakeAway

end

restaurant = Restaurant.new
restaurant.change_menu "menu1.csv"
puts restaurant.inspect
restaurant.read_menu
restaurant.order "FILLET OF VEAL", 2
restaurant.order "SEA BASS", 2
restaurant.summary
restaurant.change_menu "menu.csv"
restaurant.read_menu
restaurant.order "fu-king fried rice", 9
restaurant.summary
restaurant.total
restaurant.checkout 229.70    
