require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    menu.show_dishes
  end

  def add(dish)
    fail 'Sorry, that\'s not on the menu' unless menu.dishes[dish]
    order.add_dish(dish)
  end

  private

  attr_reader :menu, :basket

end
