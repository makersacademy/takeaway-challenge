class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Ramen": 3, "Burger": 2, "Coke": 5, "Chocolate": 3, "Parmigiano": 8}
  end
end
