require_relative "./restaurant.rb"
class Order
  attr_reader :order
  def initialize
    @calculated_sum = 0
    @menu = Restaurant.new
  end

  def select_dishes(current_order)
    @order = current_order
    raise "Incorrect order - please select a dish from the menu" unless incorrect_order?
    @order
  end

  def checking_total(given_total)
    @given_total = given_total
    raise "Incorrect sum - please retry to place order" unless incorrect_sum?
    @given_total
  end

  def calculate_total_cost
    @order.each{ |dish, number| @calculated_sum += @menu.dish[dish] * number}
    @calculated_sum
  end

  private
  def incorrect_order?
    (@order.keys - @menu.dish.keys) == []
  end

  def incorrect_sum?
    self.calculate_total_cost == @given_total
  end
end
