class Menu

  attr_reader :dishes

  def initialize
    @dishes = {dish: 'food', price: 1}
  end

  def display_dishes
    @dishes
  end

end
