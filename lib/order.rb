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

  def finalize_order
    @order_items
  end

  def order_total
    @order_items.map do |dish, quantity|
      dish_overall_price = dish.price * quantity
    end.reduce { |sum, dish_overall_price| sum + dish_overall_price}
  end

end
