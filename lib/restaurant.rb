# understands how to place and confirm orders

require_relative 'dishes'
require_relative 'order'

class Restaurant

  attr_reader :dishes, :current_order, :order, :order_history

  def initialize(dishes = Dishes, order = Order)
    @order = order
    @current_order = nil
    @order_history = []
    @dishes = dishes.new
  end

  def available_dishes
    dishes.dishes
  end

  def create_new_order(list, sum)
    @current_order = order.new
    current_order.start_order(list, sum)
  end

  def confirm_order
    fail "Wrong total!" if dishes.check_sum(current_order.list,current_order.sum) == false
    current_order.confirm_order
    text_message.send(current_order)
  end

  def close_order
    order_history << current_order
    @current_order = nil
  end

  # restaurant checks the sum with dishes

end
