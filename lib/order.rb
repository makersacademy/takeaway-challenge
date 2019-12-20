require_relative 'dishes_list'

class Order
  attr_reader :order_list, :total

  def initialize
    @order_list ={}
    @total = 0
  end

  def select(dish, quantity)
  end

end
