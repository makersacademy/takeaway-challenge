class Menu
  attr_accessor :dishes_list

  def initialize
    @dishes_list = [{dish: "Chicken and rice", prize: 3.50},
      {dish: "Lamb and rice", prize: 4.0},
      {dish: "Beef and rice", prize: 4.50}]
  end
end
