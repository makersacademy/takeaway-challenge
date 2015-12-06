require_relative 'dish'

class DishList

attr_reader :dishes
  def initialize(dishes)
    @dishes = dishes
  end

  def prices
    price_list = {}
    @dishes.each{ |dish| price_list[dish.name] = dish.price}
    price_list
  end

end
