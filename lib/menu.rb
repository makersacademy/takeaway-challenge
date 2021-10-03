class Menu
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def list
    { :Pizza => 8, :Chicken => 6 }
  end
end
