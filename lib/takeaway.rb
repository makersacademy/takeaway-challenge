require_relative 'menu'
require_relative 'order'


class Takeaway

  attr_reader :completed

  def initialize(menu = Menu.new, order = nil)
    @menu = menu
    @completed = false
    @order = order
  end

  def get_menu
    menu.print_menu
  end

  def place_order(dish, quantity)
    invalid_order(dish)
    completed? ? return : @order = Order.new
    order.add(dish, quantity)
  end

  def invalid_order(dish)
    raise "Invalid order" if !get_menu.include?(dish)
  end

  def basket_summary
    @order.basket
  end

private

  attr_reader :menu, :order

def completed?
  @completed
end


end
