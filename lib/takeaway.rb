require_relative 'dish'

class Takeaway
  attr_reader :order, :quantity

  def initialize
    @order = Array.new
  end

  def add_dish(quantity, dish)
    @order << {dish: dish, quantity: quantity}
  end

  def order_sum
    sum = 0
    @order.each{ |dish_details| sum += dish_details[:quantity] * dish_details[:dish].price }
    sum
  end

  def list_dishes

  end

end
