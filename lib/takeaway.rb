require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new )
    @menu = menu
    @order = order
  end

  def menu
    @menu.show_menu
  end

end