require_relative 'menu'

class Order
attr_reader :menu, :order_list

  def initialize
    @menu = Menu.new
    @order_list = []
  end

  def take_order(item, quantity = 1)
    @order_list << {:item => item, :quantity => quantity}
  end

end
