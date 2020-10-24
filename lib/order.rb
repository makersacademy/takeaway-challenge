
class Order
attr_accessor :dish_to_order, :customer_order

  def initialize
    @customer_order = []
    @dish_to_order
  end

  def show_current_order
    @customer_order = []
  end

  def add_to_order(number_of_dish, quantity)
    @customer_order.fill(@dish_to_order, @customer_order.size, quantity.to_i)
    show_current_order
  end

  

end
