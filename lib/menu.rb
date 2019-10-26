class Menu
  attr_reader :dishes

  def initialize
    @dishes = [ {dish: "Egg fried rice", price: 4} ]
  end

  def view
    puts @dishes
  end
end
