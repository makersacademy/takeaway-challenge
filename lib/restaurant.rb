require_relative "order.rb"

#Will be placing and checking out orders
class Restaurant
  attr_reader :name, :menu, :orders
  attr_accessor :order

  DEFAULT_NAME = "Top 5"
  def initialize(name = DEFAULT_NAME, menu_klass = Menu)
    @name = name
    @menu = menu_klass.new
    @order
    @orders = []
  end

  def start_order(order_klass = Order)
    self.order = order_klass.new
  end

  def add_to_order(dish, amount)
    order.add_order_item(dish, amount)
  end

  def finish_order(order)
    orders << order
  end

  def reset_order
    self.order = nil
  end

end
