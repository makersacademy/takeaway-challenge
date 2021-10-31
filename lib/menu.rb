class Menu
  attr_reader :dishes 

  def initialize 
    @dishes = {
      "calzone" => 5,
      "pizza" => 8,
      "mozzarella sticks" => 3,
      "pasta" => 6,
      "gelato" => 4
      }
  end
    
  def view_menu
    @dishes.map { | dish, price |
      "#{dish.capitalize}: £#{price}" } 
      .join(", ")
  end
 
end