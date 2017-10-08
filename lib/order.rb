require './lib/item_list.rb'

class Order
  attr_reader :order_items

  def initialize(order_items = ItemList.new)
    @order_items = order_items
    @total = 0.0
  end

  def add_item(item)
    @order_items.add item
  end

  def remove_item(item)
    @order_items.remove item
  end

  def view_order
    @order_items.to_string
  end

  def total
    @total = calc_total
  end

  private

  def calc_total
    @order_items.items.map { |item| item.price }.inject(:+).round(2)
  end
end
