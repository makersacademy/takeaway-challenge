# build order
# read available options
# compare total
# submit order

require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :menu, :new_order

def initialize
  @menu = Menu.new
  @new_order = Order.new
end

  def show_menu
    self.menu.dishes
  end

# order
  def add_dish(dish, quantity=1)
    new_order.order(dish, quantity)
    # @my_selection[dish] += quantity
  end


  private

  attr_writer :menu, :new_order

end
