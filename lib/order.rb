require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add_to_basket(food, quantity = 1)
    quantity.times { @order << food }
  end

end
