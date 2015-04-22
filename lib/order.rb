require_relative 'menu'

attr_reader :menu, :order

class Order
  def initialize menu
    @menu = menu
    @order = []
  end

  def place_order(*dish_number)
    @order << *dish_number
  end
end

order = Order.new(Menu.new)
p order.menu
