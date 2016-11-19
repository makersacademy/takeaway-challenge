require_relative 'menu'

class Takeaway

  attr_reader :menu
  attr_accessor :order

  def initialize(menu_klass)
    @menu = menu_klass.new
  end

  def view_menu
    menu.print
  end

  def new_order(order_klass)
    @order = order_klass.new
  end

end
