class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {
        "Banitsa" => 3,
        "Cake" => 4,
        "Milkshake" => 2,
        "Cheeseburger" => 6,
        "Dumplings" => 5
      }
  end
  
end
