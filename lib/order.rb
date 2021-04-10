class Order
  def initialize(dish_class = Dish)
    @order_list = []
    @dish_class = dish_class
  end

  def add_dish(dish)
    @order_list << dish
  end

  def view_order
    @order_list
  end
end