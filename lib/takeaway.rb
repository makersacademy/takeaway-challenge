require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :price

  def initialize
    @menu = Menu.new.menu
  end

  def order(price, *food)
    @new_order = Order.new(food)
    @price = @new_order.current_order
    raise "That price doesn't match the food order" if price != @price
    @new_order.complete
  end

end
