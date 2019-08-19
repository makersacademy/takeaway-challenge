class Menu
  attr_reader :dishes
  def initialize
    @dishes = [{dish: "Teriyaki", price: 4.50},
               {dish: "Pho", price: 6.00},
               {dish: "Sushi", price: 7.00},
               {dish: "pizza", price: 7.50}]
  end
end
