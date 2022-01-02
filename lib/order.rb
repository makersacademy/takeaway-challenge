require_relative "menu"

class Order
  attr_reader :order

  def initialize 
    @order = []
  end

  def add(dish)
    @order << dish
  end
end
