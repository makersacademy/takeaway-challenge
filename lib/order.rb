class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add(dish, quantity, cost)
    @current_order << { dish: dish, quantity: quantity, cost: cost }
  end

  def show
    order_str = @current_order.map do |order_item|
      "#{order_item[:dish]} x#{order_item[:quantity]} = £#{order_item[:cost]}"
    end
    order_str.join(", ")
  end

end
