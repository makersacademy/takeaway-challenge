require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu

  def initialize(restaurant_menu)
    @menu = restaurant_menu
  end

  def print_menu
    menu.print_menu
  end
end


dishes = { chicken: 2.99, beef: 3.49 }
menu = Menu.new(dishes)
takeaway = Takeaway.new(menu)
order = Order.new(menu)
order.add("chicken", 3)
order.add("beef", 5)
