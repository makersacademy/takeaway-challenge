require_relative 'order'
require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    @menu.display_dishes
  end
end
