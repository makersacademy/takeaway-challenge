class Menu

  attr_reader :dishes

  def initialize
    @dishes = { 'fish' => 5, 'chips' => 3, 'gravy' => 1, 'savoly' => 2 }
  end

  def read
    @dishes
  end

  def dish_price(dish)
    @dishes[dish]
  end
end
