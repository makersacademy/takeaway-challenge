Dir["./lib/*.rb"].each { |file| require file }

interface = CustomerInterface.new
dish = Dish.new("Katsu Chicken Curry", 7.99, 20)
another_dish = Dish.new("Sushi Platter", 21.99, 30)
interface.print_menu
interface.select_dish(dish)
interface.select_dish(another_dish)
interface.check_order