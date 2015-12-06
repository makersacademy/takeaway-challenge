class DishList
  def initialize(dishes)
    @dishes = dishes
  end

  def prices
    price_list = {}
    @dishes.each do |dish|
      name = dish.name
      price = dish.price
      price_list[name] = price
    end
    price_list
  end

end
