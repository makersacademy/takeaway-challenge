class Order
  attr_reader :total_order

  def initialize
    @total_order = []
  end

  def add_item(item)
    item_ordered = {}
    item_ordered[item] = 1
    @total_order << item_ordered
  end

end
