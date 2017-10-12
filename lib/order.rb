require 'item_list'

class Order
  attr_reader :order_items

  def initialize(order_items = ItemList::List.new)
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
    @order_items.to_summary([:name, :price])
  end

  def total
    @total = calc_total
  end

  private

  def calc_total
    @order_items.items.map { |item| item.price.to_f }.inject(:+).round(2)
  end
end
