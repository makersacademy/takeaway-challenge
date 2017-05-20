require_relative 'menu'
# stores the order by a customer
class Order
  attr_reader :order_list

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_item = nil
    @order_list = []
  end

  def select_food(dish, quantity = 1)
    @menu.selected_item(dish)
    store_item(quantity)
  end

  private
  def store_item(quantity)
    @order_list << "#{quantity}x #{@menu.dish}: £#{@menu.price * quantity}"
  end
end
