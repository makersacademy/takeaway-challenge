class Order

  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  def save_order_items(food_item)
    ordered_items << food_item
  end

  def check_order_total(total)
    item_total = ordered_items.map {|price| price[:price].to_f}.inject(:+)
    fail 'Order total incorrect' if total != item_total
    item_total
  end
end
