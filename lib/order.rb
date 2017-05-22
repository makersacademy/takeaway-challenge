# deals with the orders
require_relative 'dish'

class Order

  attr_reader :order_items

  def initialize
    @order_items = Hash.new(0)
  end

  def add_dish(dish, quantity = 1)
    @order_items[dish] += quantity
  end

  def display_order
    @order_items
  end

  def finalize_order(price)
    raise "Please confirm your order price!" unless correct_amount?(price)
    order_total
  end

  private

  def order_total
    @order_items.map do |dish, quantity|
      dish.price * quantity
    end.reduce { |sum, dish_overall_price| sum + dish_overall_price }
  end

  def correct_amount?(price)
    order_total == price
  end

end
