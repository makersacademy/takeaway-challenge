class Dish

  attr_accessor :dish_entry

  def initialize(dish_name, dish_price)
    @dish_entry = { :dish_name => dish_name, :dish_price => dish_price }
  end

end
