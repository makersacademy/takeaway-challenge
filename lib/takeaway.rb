require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.show_dishes
  end

  def add(number=1, dish)
    fail 'Sorry, that\'s not on the menu' unless menu.dishes[dish]
    @order.add_dish(number, dish)
  end

  private

  attr_reader :menu, :basket

end
