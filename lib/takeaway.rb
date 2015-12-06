require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order_klass, :current_order

  def initialize(menu: Menu.new, order_klass: Order)
    @menu = menu
    @order_klass = order_klass
    @current_order = order_klass.new
  end

  def read_menu
    menu.list
  end

end
