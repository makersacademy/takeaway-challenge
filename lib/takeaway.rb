require_relative 'menu'
require_relative 'order'
require_relative 'dish'
require_relative 'sms'

class Takeaway
  attr_reader :menu

  def initialize(restaurant_menu)
    @menu = restaurant_menu
  end

  def print_menu
    menu.print_menu
  end
end

dish1 = Dish.new("chicken", 2.99)
dish2 = Dish.new("beef", 3.49)
menu = Menu.new()
menu.add_dish(dish1)
menu.add_dish(dish2)
takeaway = Takeaway.new(menu)
order = Order.new(menu)
order.add(dish1, 3)
order.add(dish2, 5)
order.total
