class Order
  def initialize
  	@order_list = []
  end
  def add_dish(quantity, dish_key)
  	quantity.times do
  	  @order_list << dish_key
  	end
  end

  def view_order
  	@order_list
  end
end