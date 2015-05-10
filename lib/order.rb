class Order
  def initialize
  	@order_list = []
  end
  def add_dish(dish_key)
  	@order_list << dish_key
  end

  def view_order
  	@order_list
  end
end