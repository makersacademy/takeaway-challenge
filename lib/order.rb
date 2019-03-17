class Order

  attr_reader :orderlines, :total, :order_calculations

  def initialize(menu, order_calculations = OrderCalculations)
    @orderlines = []
    @total = 0
    @order_calculations = order_calculations
    @menu = menu
  end

  def add(dish_name, quantity)
    @orderlines << { dish: @menu.find_dish(dish_name), quantity: quantity }
    @total = @order_calculations.calculate_total(self)
  end
end
