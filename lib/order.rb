class Order

  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  def save_order_items(food_item)
    @ordered_items << food_item
  end
end
