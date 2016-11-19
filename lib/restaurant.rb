#Will be placing and checking out orders
class Restaurant
  attr_reader :name, :menu, :order

  DEFAULT_NAME = "Top 5"
  def initialize(name = DEFAULT_NAME, menu_klass = Menu)
    @name = name
    @menu = menu_klass.new
    @order
  end

  def add_to_order(dish, amount, order_klass = Order)

  end

end
