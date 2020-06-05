class Menu
  attr_accessor :dishes
  def initialize
    @dishes = []
  end

  def add_dish(dish)
    self.dishes.push(dish)
  end
end