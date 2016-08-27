# understands how to place and confirm orders

require_relative 'dishes'
require_relative 'order'

class Restaurant

  attr_reader :dishes, :current_order, :order

  def initialize(dishes = Dishes, order = Order)
    @order = order
    @current_order = nil
    @dishes = dishes.new
  end

  def available_dishes
    dishes.dishes
  end

  def create_new_order(list, sum)
    fail "Wrong total" if dishes.check_sum(list,sum) == false
    @current_order = order.new
    current_order.start_order(list, sum)
    dishes.check_sum(list, sum)
  end

  # restaurant checks the sum with dishes

end
