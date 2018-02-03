require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.print
  end

  # def create_order(order = Order.new)
  #   @order = order
  # end

end
