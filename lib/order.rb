class Order
  attr_reader :item_list

  def initialize
    @item_list = []
  end

  def add_item(item)
    item_list << item
  end

  def items
    @item_list
  end
end
