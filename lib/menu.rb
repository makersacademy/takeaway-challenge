class Menu
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def list_menu
    @dishes.map { |dish| [dish.name, dish.price] }
  end
end
