

class Order
  def initialize(dish_class = Dish)
    @order_list = []
    @dish_class = dish_class
  end

  def add_dish(menu, dish)
    availability = menu.check(dish)
    @order_list << dish if availability == 'true'
    raise AvailabilityError if availability == 'false'
  end

  def view_order
    @order_list
  end
end
