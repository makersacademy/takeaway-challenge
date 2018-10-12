require_relative 'menu'

class Order

  include Menu

  attr_reader :order_items
  def initialize
    @order_items = []
  end

  def select_dish(dish, quantity = 1)
    quantity.times { @order_items << dish }
  end

  def total
    order_prices = []
    @order_items.select do |dish|
       @@menu.each {|d| order_prices << d[:price] if d[:dish] == dish}
    end
    order_prices.sum
  end
end
