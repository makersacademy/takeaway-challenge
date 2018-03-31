class Order
  attr_reader :order_items

  def initialize
    @order_items = []
  end

  def save_item(dish)
    order_items << dish
  end
end
