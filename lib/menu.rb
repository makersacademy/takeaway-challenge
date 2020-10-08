class Menu
  attr_reader :dishes
  def initialize
    @dishes = original_dishes
  end

  def original_dishes
    dishes = []
    dishes << Dish.new('curry',8)
    dishes << Dish.new('rice',3)
  end
end