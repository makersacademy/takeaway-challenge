require_relative "./restaurant.rb"
class Order
  attr_reader :order
  def initialize
    @calculated_sum = 0
    @menu = Restaurant.new
  end

  def select_dishes(current_order)
    @order = current_order
  end

  def dishes_costs_sum
    @order.each{ |dish, number| @calculated_sum += @menu.dish[dish] * number}
    @calculated_sum
  end

  def check_sum?(given_total)
    self.dishes_costs_sum == given_total
  end
end
