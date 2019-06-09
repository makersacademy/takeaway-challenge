require_relative 'menu'

class Order

  attr_reader :current_order

  def initialize(menu)
    @menu = menu
    @current_order = Hash.new(0)
    @total = 0
  end

  def add(dish, quantity)
    raise 'Item is not available' if @menu.dishes[dish] == nil
    @current_order[dish] = quantity 
  end

  def total_order(dish, quantity)
    @total += (@menu.dishes[dish] * quantity)
    "Your total order is £%.2f" % [@total]
  end
end
