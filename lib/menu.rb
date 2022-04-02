# Menu class
# initiated with empty list of available dishes
# can add dish to the list of available dishes
# can be asked to view its list of available dishes
# can be asked to select a dish from list and add it to basket

require_relative './dish'

class Menu
  attr_reader :available_dishes
  
  def initialize(dish_class = Dish)
    @available_dishes = []
    @dish_class = dish_class
  end

  def new_dish(name, price)
    @available_dishes << @dish_class.new(name, price)
  end
end