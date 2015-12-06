require_relative 'dish_list'

class OrderList

  def initialize(dish_list=DishList.new)
    @dish_list = dish_list
  end


  def prices
    @dish_list.prices
  end

  def place_order(hash_quantities)
  dishes_available = @dish_list.dishes.map{|dish| dish.name}
  condition = hash_quantities.keys.all?{|(name)| dishes_available.include? name }
  fail 'An ordered dish is unavailable' if dishes_available
  end

end
