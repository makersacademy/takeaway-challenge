require 'basket'

class Order

  attr_reader :total_price, :correct_total_price, :meal_order

  def place_order(items_and_quantities, total_price, time_ordered)
    fail "The sum is not correct" unless @correct_total_price
    @meal_order = [items_and_quantities, total_price]
    "Thanks! Your order is placed and will be delivered at #{time_ordered + 1}."
  end

  def correct_total_price?(total_price, prices_and_quantities_in_basket)
    total_price == prices_and_quantities_in_basket.map {|k, v| k*v }.inject(:+) ?
    @correct_total_price = true : @correct_total_price = false
  end

end
