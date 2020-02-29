require_relative 'takeaway'

class Order

  attr_reader :items, :menu

  def initialize(menu:)
    @items = {}
    @menu = menu
  end

  def add_item(item, qty)
    @items[item] = qty
  end

  def order_total
    total = 0
    current_order.values.each do |price|
      total += price
    end
    return total
  end


end
