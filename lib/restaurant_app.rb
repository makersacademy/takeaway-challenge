class RestaurantApp

attr_reader :dish, :order_list

  def initialize
    @dish = dish
    @order_list = []
  end

  def add_dish(dish)
    @order_list << dish
  end
end
