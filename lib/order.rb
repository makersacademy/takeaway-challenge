require_relative "till"

class Order

  attr_reader :items

  def initialize
    @items = []
    @till = Till.new
  end

  def save_order(order_item)
    @items << order_item
  end

  def finish
    @till.sum(@items)
  end

end
