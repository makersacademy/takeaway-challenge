class Menu

  MENU = {
    "Pici cacio & pepe" => 6,
    "Burrata" => 5,
    "Salmon crudo" => 10
   }

  attr_reader :dishes

  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def view
    @dishes.map { |dish, cost| "#{dish} - £#{cost}" }.join(", ")
  end

  def on_menu?(dish)
    !!dishes[dish]
  end

  def cost(dish)
    dishes[dish]
  end

end
