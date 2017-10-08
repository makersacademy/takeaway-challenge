require 'order_item'
class Order
  attr_reader :order_items

  def initialize
    @order_items = {}
  end

  def add_food_item(description, quantity, unit_price)
    order_item = Order_item.new(description, unit_price) unless
        order_items.has_key?(description)
    order_item = @order_items[description] if order_items.has_key?(description)
    order_item.alter_quantity quantity
    @order_items[description] = order_item
  end

  def order_items
    @order_items
  end

  def total_value
    @order_items.inject(0) {|sum, (k, v)| sum + v.value}
  end
end
