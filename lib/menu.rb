require_relative 'order'

#knows the dishes
class Menu

attr_reader :dishes

  def initialize
    @dishes = { 'pizza' => 3.00,
                'soup' => 2.00,
                'fanta' => 1.00  }
  end

  def add(name, price)
    dishes.store(name, price)
  end

  def list_menu
    dishes
  end
end
