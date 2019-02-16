class BasketItem
  attr_reader :dish, :quantity, :dish_total_price
  def initialize(dish, dish_quantity)
    @dish = dish
    @quantity = dish_quantity
    @dish_total_price = @dish.price * @quantity

  end
end
