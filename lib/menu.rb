class Menu

  attr_reader :menu, :dish

  def initialize
    @menu = []
  end

  def add_dish(name, price, dish_class = Dish)
    @dish = dish_class.new(name, price)
    @menu << @dish
  end 

  # def remove_dish(name)
  #   @menu.delete(@dish.name)
  # end
end
