require_relative "order_item.rb"
require_relative "order_total.rb"
require_relative "confirmation.rb"
#Manages the orders placed by the customer.
class Order

  attr_reader :items, :confirm
  attr_accessor :total

  def initialize(order_total_klass = OrderTotal, confirmation_klass = Confirmation)
    @items = []
    @total = order_total_klass.new
    @confirm = confirmation_klass.new
  end

  def add_item(dish, amount = 1, order_item_klass = OrderItem)
    save(order_item_klass.new(dish, amount))
  end

  def order_total
    total.calculate(items)
  end

  private

  def save(item)
    items << item
  end


end
