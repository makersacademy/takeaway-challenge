require_relative 'dishes'
require_relative 'takeaway'
class Order
  attr_reader :order_list

  def initialize(order_list = {})
    @order_list = order_list
  end

  def add_to_order(add)
    p dish = Dishes.new("name", "price", true)
    p dish.list_available_dishes.each do |k, v| @order_list.store(k, v) if add == true end
    p @order_list
  end

end