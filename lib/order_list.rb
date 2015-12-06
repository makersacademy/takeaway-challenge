require_relative 'dish_list'

class OrderList

  def initialize(dish_list=DishList.new)
    @dish_list = dish_list
  end


  def prices
    @dish_list.prices
  end

  def place_order(hash_quantities)
  fail 'An ordered dish is unavailable' unless ordered_dishes_available?(hash_quantities)
  end

  private

  def dishes_available
    @dish_list.dishes.map{|dish| dish.name}
  end

  def ordered_dishes_available?(hash_quantities)
    hash_quantities.keys.all?{|(name)| dishes_available.include? name }
  end

end
