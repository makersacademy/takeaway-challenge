require_relative 'menu'
require_relative 'pretty_format'

class Order

  attr_reader :basket, :total

  include Menu
  include PrettyFormat

  def initialize
    @basket = {}
    @total = 0
  end

  def add(dish, quantity)
    price = ALL_DISHES.values[(dish - 1).to_f]
    dish = [ALL_DISHES.keys[(dish - 1).to_f]]
    @basket.has_key?(dish) ? @basket.keys.each { |k| @basket[k] += quantity if k == dish } : @basket[dish] = quantity
    @total += (price * quantity)
  end

end
