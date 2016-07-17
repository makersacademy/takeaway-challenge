class Menu
  DISHES = {'Chicken Jalfrezi': 5.99,
            'Chicken Tikka': 4.99,
            'Chicken Balti': 5.49,
            'Butter Chicken': 12,
            'Naan Bread': 1}

  attr_reader :dishes
  def initialize
    @dishes = DISHES
  end

end
