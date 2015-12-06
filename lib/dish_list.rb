class DishList
  def initialize(dishes)
    @dishes = dishes
  end

  def prices
    price_list = {}
    @dishes.each{ |dish| price_list[dish.name] = dish.price}
    price_list
  end

end
