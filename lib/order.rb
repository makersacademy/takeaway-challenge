require 'menu'

class Order

  attr_reader :menu, :current_order, :order_total

  def initialize
    @menu = Menu.new
    @current_order = []
    @order_total = 0
  end

end
