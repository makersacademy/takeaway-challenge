require_relative 'menu'

class Order

  attr_reader :current_order, :total

  def initialize
    @current_order = Array.new(0)
    @total = 0
  end

  def add(dish, quantity)
    quantity.times do
      @current_order << dish
    end
  end
  
end
