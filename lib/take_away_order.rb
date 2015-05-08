require_relative 'restaurant'

class TakeAwayOrder
  attr_reader :total, :order_status, :order_placed
  attr_accessor :items

  def initialize
    @items = {}
    @order_status = order_placed
  end

  def items_price
    @items.each_value { |v| v }
  end

  def total
    # items_price.inject(:+).nil? ? 0 : items_price.inject(:+).round(2)
  end

  def review
  end

  def order_placed?
    false
  end
end
