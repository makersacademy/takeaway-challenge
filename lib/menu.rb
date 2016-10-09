class Menu

  attr_reader :menu

  def initialize
    @menu = []
  end

  def entry(dish = Dish.new("Patate lesse", 1))
    @menu << {dish: dish.name ,price: dish.price}
  end
end
