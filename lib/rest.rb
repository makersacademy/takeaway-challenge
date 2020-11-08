require_relative './menu.rb'
require_relative './order.rb'

class Rest
  attr_accessor :menu, :order

  def initialize
    @menu = Menu.new
    @order = nil
  end

  def place_order
    @order = Order.new
  end

end
