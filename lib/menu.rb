class Menu

  attr_reader :menu

  def initialize
    @menu = { Ramen: 3, Burger: 2, Coke: 5, Chocolate: 3, Parmigiano: 8}
  end

  def price(dish)
    menu[dish]
  end
end
