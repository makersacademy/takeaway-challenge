require_relative 'dish'

class Takeaway
  def initialize(dish_class = Dish)
    @dish_class = dish_class
  end

  def menu
    [@dish_class.new]
  end
end
