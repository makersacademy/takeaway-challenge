class Menu
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def list
    @dishes.map { |dish| [dish.name, dish.price] }
  end
end
