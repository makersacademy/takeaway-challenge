require_relative 'menu'

attr_reader :menu

class Order
  def initialize menu
    @menu = menu
  end

  def place_order(*dish_number)

  end
end

order = Order.new(Menu.new)
p order.menu

