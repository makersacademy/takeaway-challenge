require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order

  def print_menu
    menu.menu_items
  end

end
