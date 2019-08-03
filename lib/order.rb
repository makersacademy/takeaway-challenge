class Order
  attr_reader :total_order

  def initialize
    @total_order = []
  end

  def add_item(item, amount = 1)
    item_ordered = {}
    item_ordered[item] = amount
    @total_order << item_ordered
  end

end
