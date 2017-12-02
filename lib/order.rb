require_relative 'order'
require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def place_order()
    @menu.print_dishes
  end


end
