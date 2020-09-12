class Restaurant
  attr_reader :menu, :dish_class

  def initialize(dish_class = 'Dish')
    @menu = []
    @dish_class = dish_class
  end


end