require_relative 'takeaway'
class Order
  attr_reader :basket
  def initialize
    @basket = {}
    @basket.default = 0 # Set default of
  end

  def add_to_basket(item, qty = 1)
    @basket[item] += qty
  end

  def calc_total(menu)
    sum = 0
    @basket.each { |item, qty| sum += (menu[item] * qty) }
    sum.round(2)
  end
end
