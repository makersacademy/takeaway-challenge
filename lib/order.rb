require_relative 'menu'
class Order
  attr_reader :order_items

  def initialize
    @order_items = []
  end


  def save_items(menu)
    'order noted'
  end

  def add_item(item)
    @order_items.push(item)
  end
end
