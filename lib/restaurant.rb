require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_dishes
    print @menu.current_order
  end

end
