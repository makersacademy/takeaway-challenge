class Restaurant
  def initialize(order = Order.new)
    @dishes = Dishes.new
    @order = order
  end

  def place_order
    @order.select_dishes
  end

  def list_dishes
    @dishes.list_menu
  end

  def bill
    @order.summarised_bill
  end
end
