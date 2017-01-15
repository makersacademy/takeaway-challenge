require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket, :total
  include Menu, Order

  def initialize
    @basket = []
    @total = 0
  end

  def order(item, number=1)
    number.times{@basket << add_to_order(item)}
    "#{number} x #{item.upcase} added to basket"
  end

  def total
    calculate_total
  end

  def basket_summary
    return "No items added" if @basket.empty?
    format_basket
  end


end
