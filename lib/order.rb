require_relative "order_item.rb"
#Manages the orders placed by the customer.
class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def add_order_item(dish, amount, order_item_klass = OrderItem)
    item = order_item_klass.new(dish, amount)
    save(item)
  end

  private

  def save(item)
    items << item
  end

end
