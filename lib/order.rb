require_relative 'menu'
require_relative 'messaging'

class Order

  include Menu

  attr_reader :order_items
  attr_accessor :submitted

  def initialize
    @order_items = []
    @order_prices = []
    @submitted = false
  end

  def add_dish(dish, quantity = 1)
    # raise "Please select a valid item" unless
    @order_items << { :dish => dish, :quantity => quantity }
  end

  def basket_items
    @order_items.map { |b| "#{b[:quantity]} x #{b[:dish]}" }.join("\n")
  end

  def total
    @order_items.select do |order_dish|
      @order_prices << find_item_price(order_dish[:dish]) * order_dish[:quantity]
    end
    ('%.2f' % @order_prices.reduce(:+)).to_f
  end

  def find_item_price(dish)
    DISHES.each { |d| return d[dish] unless d[dish].nil? }
  end

end
