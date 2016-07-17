require_relative 'menu'
require_relative 'order'
class Takeaway
  attr_reader :menu
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.dishes
  end

  def order(dish, quantity = 1)
    puts "#{quantity}x #{dish}(s) added to your basket."
    @order.add(dish, quantity = 1)
  end
end
