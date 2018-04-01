require_relative 'menu'
class Customer

  attr_reader :order

  def initialize(order = Order.new)

    @order = order

  end


  def place_order

    @order.save_items(menu = Menu.new)

  end
end
