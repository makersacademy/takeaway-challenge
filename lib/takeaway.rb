require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def read_menu
    menu.dishes
  end

  def order(item)
    new_order = Order.new(menu)
    basket << new_order.add(item)
  end

  private

end
