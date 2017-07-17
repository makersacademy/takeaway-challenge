require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = []
  end

  def read_menu(menu)
    menu
  end

  def order(dish, quantity)
    add_to_order(dish, quantity)
  end

private

  def add_to_order(dish, quantity)
    Order.new(dish, quantity)
  end

end
