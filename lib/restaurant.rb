require_relative 'order'
require_relative 'menu'

class Restaurant

  attr_accessor :menu, :order

  def initialize
    @menu = Menu.new
    @order = nil
  end

  def place_order
    @order = Order.new
  end

end
