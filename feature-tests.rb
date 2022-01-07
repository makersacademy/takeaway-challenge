Dir["./lib/*.rb"].each { |file| require file }

interface = CustomerInterface.new
dish = "Katsu Chicken Curry"

interface.print_menu
interface.select_dish(dish)
interface.check_order